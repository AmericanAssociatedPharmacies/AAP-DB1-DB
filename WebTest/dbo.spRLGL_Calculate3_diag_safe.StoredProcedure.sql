USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_Calculate3_diag_safe]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/* =============================================
7/14 diag version of calculate3 for support questions BG
returns string with calculation internals
this version, _diag_safe, hides the net API price. spRLGL_Calculate3_diag shows them.
restrict access to the version that shows them!
10/14 expanded to include price and rebate dates. 
Modified both this and spRLGL_calculate3 to fix price dates: 
	they were >= fill date, now <= fill date, and no more than N months back.
-- ============================================= */
CREATE PROCEDURE [dbo].[spRLGL_Calculate3_diag_safe]

	(
		--@NCPDP int,
		@NCPDP varchar(7), --leading zeros
		@RxNbr nvarchar(50),
		@filldate datetime --smalldatetime	
	)
	
AS
	BEGIN

		SET NOCOUNT ON;
declare @diag varchar(255)
declare @diag2 varchar(255)
declare @buf varchar(255)
declare @buf2 varchar(255)

		DECLARE @monthsback int
		DECLARE @totalpaid numeric(18,6)
		DECLARE @Qty int
		DECLARE @NDC nvarchar(11)
		DECLARE @PMID int

		DECLARE @totalcost numeric(18,4)
		DECLARE @costperunit numeric(18,4)
		DECLARE @percent numeric(18,4)

set @diag='diagnostic: default value'
set @diag2 = ''
set @monthsback = 6  --max lookback in price tables

		--Verify NCPDP in Claims data. Note @NDC used as buffer here
		select top 1 @NDC = [Pharm ID]  FROM Webdev.dbo.Rx30Latest 
			WHERE [Pharm ID]=@NCPDP
		if (@NDC is null)
			BEGIN
				--Select 'NoNCPDP' as result,NULL as unitcost
				set @diag = 'NCPDP not found in claims data' 
				select @diag as diag
				RETURN 0
			END
			
		--Find the NDC,TotalPaid,Qty from Rx30 Claims
		Select @totalpaid = [Total Price],@Qty = [Qty Dispensed],@NDC = NDC 
			,@diag2=' rfl=' + convert(varchar,[rfnbr]) + ' bin='+[bin nbr]+' costpaid='+convert(varchar,[cost paid])+ ' feepaid='+convert(varchar,[fee paid]) + ' costsubmit=' + convert(varchar,[cost submitted])
			FROM Webdev.dbo.Rx30Latest 
			WHERE [Pharm ID]=@NCPDP AND [Rx Nbr]=@RxNbr AND [Rx Date] = @filldate 
		if (@totalpaid is null)
			BEGIN
				--Select 'NoClaim' as result,NULL as unitcost
				set @diag = 'Claim not found in claims data. rx ' + @RxNbr + ' ' + convert(varchar(15),@filldate,1) + ' ' + @NCPDP 
				select @diag as diag
				RETURN 0
			END
		
		--API CHECK
		--Select @costperunit = ISNULL(NetPerUnit,0) from Purchases.dbo.v_APIRebates WHERE NDC=@ndc AND Mnth = Month(@filldate) AND Yr = Year(@filldate)
		Select top 1 @costperunit = ISNULL(NetPerUnit,0)
			,@buf=convert(varchar(5),Mnth) + '/' + convert(varchar(5),Yr)
			,@buf2=convert(varchar,PriceperUnit) 
			from Purchases.dbo.v_APIRebates2 WHERE NDC=@ndc 
			AND Mnth >= dbo.fnRLGL_Pricedate2(Month(@filldate),Year(@filldate),@monthsback,'m')
			AND Mnth <= Month(@filldate)	--added 10/14 bg
			AND Yr >= dbo.fnRLGL_Pricedate2(Month(@filldate),Year(@filldate),@monthsback,'y')
			AND Yr <= Year(@filldate)
			Order by Yr desc,Mnth desc
		if (@costperunit != 0 )
			--USE API
			BEGIN				
				if @totalpaid > (@costperunit * @Qty) 
					BEGIN
						--Select 'GREEN' as result,@costperunit as unitcost
						set @diag = 'Green1: priceperunit=' + @buf2 
							+ ' netperunit=' + convert(varchar(15),@costperunit,1) 
							+ ' qty=' + convert(varchar(15),@Qty,1)
							+ ' nettotal=' + convert(varchar(15),(@costperunit * @Qty),1)
							+ ' paid=' + convert(varchar(15),@totalpaid,1) 
							+ ' ndc=' + @NDC + ' pricedate=' + @buf 
						---SAFE VERSION---
						set @diag = 'Green: API price net of rebates is not shown, but was less than the unit cost paid.'
							+ ' ndc=' + @NDC + ' pricedate=' + @buf 
							+ ' priceperunit (NOT net)=' + @buf2
					END
				ELSE
					BEGIN
						--Select 'RED' as result,@costperunit as unitcost
						set @diag = 'Red1: priceperunit=' + @buf2 
							+ ' netperunit=' + convert(varchar(15),@costperunit,1) 
							+ ' qty=' + convert(varchar(15),@Qty,1)
							+ ' nettotal=' + convert(varchar(15),(@costperunit * @Qty),1)
							+ ' paid=' + convert(varchar(15),@totalpaid,1)
							+ ' ndc=' + @NDC + ' pricedate=' + @buf 
						---SAFE VERSION---
						set @diag = 'Red: API price net of rebates is not shown, but was greater than the unit cost paid.'
							+ ' ndc=' + @NDC + ' pricedate=' + @buf 
							+ ' priceperunit (NOT net)=' + @buf2
					END
			END
		Else
		--CARDINAL CHECK
			BEGIN
			Select top 1 
				@PMID=PMID FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates WHERE NCPDP=@NCPDP 
				--AND (PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPQuitDate IS NULL) AND 
				--		  (PharmacyMaster.dbo.v_PM_AllWithAffiliates.AAPAccountNo IS NOT NULL)
				order by PMID desc
				if (@PMID is null)
					BEGIN
						--Select 'NoPMID' as result,NULL as unitcost
						set @diag = 'PMID not found for this NCPDP in Pharmacy Master: ' + @NCPDP
						select @diag as diag
						RETURN 0
					END				

				--Store Rebate for that month
				--Select @percent =  (1-(CHRebatePerc)) FROM Purchases.dbo.CHRebates WHERE PMID=@pmid AND [Month]= Month(@filldate) AND [Year] = Year(@filldate) ORDER BY Year ASC,Month ASC 
				--added top 1 to support orderby
				Select top 1  
					@percent =  isnull(CHRebatePerc,0)  
					,@buf2 = convert(varchar(5),Month(@filldate)) + '/' + convert(varchar(5),Year(@filldate))
					FROM Purchases.dbo.CHRebates
					WHERE PMID=@pmid 
					AND [Month]= Month(@filldate) AND [Year] = Year(@filldate) 
					AND CHRebatePerc is not null
					AND DATALENGTH(CHRebatePerc) > 0
					ORDER BY Year DESC,Month DESC 
				
				--if store rebate is null for the requested month get the latest rebate available
				if (@percent = 0) OR Datalength(@percent) IS NULL
				BEGIN
					Select top 1
					@percent =  isnull(CHRebatePerc,0)
					,@buf2 = convert(varchar(5),isnull([Month],0)) + '/' + convert(varchar(5),isnull([Year],0))
					FROM Purchases.dbo.CHRebates
					WHERE PMID=@pmid 
					AND CHRebatePerc is not null
					AND DATALENGTH(CHRebatePerc) > 0
					AND [Year] <= year(@filldate)		--added 10/14 bg
					AND [Month] <= month(@filldate)
					ORDER BY Year DESC,Month DESC
				END

				--CAH Price
				Select top 1  @costperunit = isnull(Price,0) 
					--WHERE NDC=@ndc AND [Month] = Month(@filldate) AND [Year] = Year(@filldate)
					,@buf=convert(varchar(5),[Month]) + '/' + convert(varchar(5),[Year])
					FROM Purchases.dbo.v_CHPriceMonthNDC 
					WHERE NDC=@ndc 
					AND [Month] >= dbo.fnRLGL_Pricedate2(Month(@filldate),Year(@filldate),@monthsback,'m')
					AND [Month] <= month(@filldate)
					AND [Year] >= dbo.fnRLGL_Pricedate2(Month(@filldate),Year(@filldate),@monthsback,'y')
					AND [Year] <= year(@filldate)		--added 10/14 bg
					Order by [Year] desc,[Month] desc
								
				if (@costperunit != 0 )
					BEGIN
						--print 'CAH2'
						if @totalpaid > ((@costperunit * @Qty)  * (1.0 - @percent))
							BEGIN
								--Select 'Green' as result,@costperunit  as unitcost
								set @diag = 'Green: CH grossperunit=' + convert(varchar(15),@costperunit,1)
									+ ' qty=' + convert(varchar(15),@Qty,1)
									+ ' total=' + convert(varchar(15),(@costperunit * @Qty),1)
									+ ' CH rebate%=' + convert(varchar(15),@percent,1)
									+ ' nettotal=' + convert(varchar(15),((@costperunit * @Qty)  * (1.0 - @percent)) ,1)			
									+ ' paid=' + convert(varchar(15),@totalpaid,1)
									+ ' pricedate=' + @buf
									+ ' rebatedate=' + @buf2
							END 
						ELSE
							BEGIN
								--Select 'Red' as result,@costperunit as unitcost
								set @diag = 'Red: CH grossperunit=' + convert(varchar(15),@costperunit,1)
									+ ' qty=' + convert(varchar(15),@Qty,1)
									+ ' total=' + convert(varchar(15),(@costperunit * @Qty),1)
									+ ' CH rebate%=' + convert(varchar(15),@percent,1)
									+ ' nettotal=' + convert(varchar(15),((@costperunit * @Qty)  * (1.0 - @percent)) ,1)			
									+ ' paid=' + convert(varchar(15),@totalpaid,1)						
									+ ' pricedate=' + @buf
									+ ' rebatedate=' + @buf2
							END
					END
				Else --if No Pricing found in CAH
					BEGIN
						--Select 'NoPrice' as result,NULL as unitcost
						set @diag = 'price not found in API or CAH ndc=' + @ndc + ' filldate=' + convert(varchar(15),@filldate,1) 
					END

			END
			select  @diag + ' rx=' + @RxNbr + ' fill=' + convert(varchar(15),@filldate,1) + @diag2 as diag
			RETURN 1
END
GO
