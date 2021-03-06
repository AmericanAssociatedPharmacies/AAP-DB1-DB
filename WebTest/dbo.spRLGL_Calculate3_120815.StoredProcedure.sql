USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_Calculate3_120815]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/* =============================================
-- Author:		JOSHILA NARAYANAN modified 10/15/13 BGrant
-- Create date: 10/01/2013
-- revised 5/14/14 BG to extend price checks to last 6 months
-- Description:	Red Light Green Light
-- todo: change case of RED GREEN to Red Green
-- ============================================= */
CREATE PROCEDURE [dbo].[spRLGL_Calculate3_120815]

	(
		--@NCPDP int,
		@NCPDP varchar(7), --leading zeros
		@RxNbr nvarchar(50),
		@filldate datetime --smalldatetime	
	)
	
AS
	BEGIN

		SET NOCOUNT ON;
		DECLARE @monthsback int
		DECLARE @totalpaid numeric(18,6)
		DECLARE @Qty int
		DECLARE @NDC nvarchar(11)
		DECLARE @PMID int

		DECLARE @totalcost numeric(18,4)
		DECLARE @costperunit numeric(18,4)
		DECLARE @percent numeric(18,4)
		DECLARE @startdate datetime

		SET @monthsback = 6  --max lookback in price tables
		SET @startdate = dateadd(m,-1*@monthsback,@filldate)

		--Verify NCPDP in Claims data. Note @NDC used as buffer here
		select top 1 @NDC = [Pharm ID]  FROM Webdev.dbo.Rx30Latest 
			WHERE [Pharm ID]=@NCPDP
		if (@NDC is null)
			BEGIN
				Select 'NoNCPDP' as result,NULL as unitcost
				RETURN 0
			END
			
		--Find the NDC,TotalPaid,Qty from Rx30 Claims
		Select @totalpaid = [Total Price],@Qty = [Qty Dispensed],@NDC = NDC FROM Webdev.dbo.Rx30Latest 
			WHERE [Pharm ID]=@NCPDP AND [Rx Nbr]=@RxNbr AND [Rx Date] = @filldate 
		if (@totalpaid is null)
			BEGIN
				Select 'NoClaim' as result,NULL as unitcost
				RETURN 0
			END
		
		--API CHECK
		--rewritten 1/2015 bg todo: security
		Select top 1 @costperunit = ISNULL(UnitNet,0) from Purchases.dbo.APIPriceAll WHERE NDC=@ndc 
			and dateloaded < @filldate
			and dateloaded > @startdate
			order by dateloaded desc
		if (@costperunit != 0 )
			--USE API
			BEGIN				
				if @totalpaid > (@costperunit * @Qty) 
					BEGIN
						Select 'GREEN' as result,@costperunit as unitcost
					END
				ELSE
					BEGIN
						Select 'RED' as result,@costperunit as unitcost
					END
			END
		Else
		--CARDINAL CHECK
			BEGIN
				--set @costperunit = 0
			Select top 1 
				@PMID=PMID FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates WHERE NCPDP=@NCPDP 
				--AND (PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPQuitDate IS NULL) AND 
				--		  (PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPAccountNo IS NOT NULL)
				order by PMID desc
				if (@PMID is null)
					BEGIN
						Select 'NoPMID' as result,NULL as unitcost
						RETURN 0
					END				

				--Store Rebate for that month
				--Select @percent =  (1-(CHRebatePerc)) FROM Purchases.dbo.CHRebates WHERE PMID=@pmid AND [Month]= Month(@filldate) AND [Year] = Year(@filldate) ORDER BY Year ASC,Month ASC 
				--added top 1 to support orderby
				select top 1
					@percent =  isnull(CHRebatePerc,0) 
					from  Purchases.dbo.CHRebates WHERE PMID=@pmid 
					AND CHRebatePerc is not null
					AND DATALENGTH(CHRebatePerc) > 0
					and [date] <= @filldate
					and [date] > @startdate
					order by [date] desc

				--CAH Price
				Select top 1  @costperunit = isnull(PricePerUnit,0) FROM Purchases.dbo.v_CHAllWeek
					WHERE NDC=@ndc 
					and [dateloaded] <= @filldate
					and [dateloaded] > @startdate
					and PricePerUnit is not null
					AND DATALENGTH(PricePerUnit) > 0
					order by [dateloaded] desc
								
				if (@costperunit != 0 )
					BEGIN
						--print 'CAH2'
						if @totalpaid > ((@costperunit * @Qty)  * (1.0 - @percent)) 
							BEGIN
								Select 'Green' as result,@costperunit  as unitcost
							END 
						ELSE
							BEGIN
								Select 'Red' as result,@costperunit as unitcost
							END
					END
				Else --if No Pricing found in CAH
					BEGIN
						Select 'NoPrice' as result,NULL as unitcost
					END

			END
			RETURN 1
END					

			

















GO
