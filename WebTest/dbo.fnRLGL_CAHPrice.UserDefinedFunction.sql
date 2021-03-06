USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnRLGL_CAHPrice]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnRLGL_CAHPrice]
(
	@NCPDP varchar(7)
	,@NDC varchar(11)
	,@filldate datetime
	,@mode int  --0 gross 1 net
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @result float
	DECLARE @PMID int
	DECLARE @rpercent float
	DECLARE @costperunit float
	DECLARE @costperunitNet float
	
			Select top 1 
				@PMID=PMID FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates WHERE NCPDP=@NCPDP 
				order by PMID desc
				if (@PMID is null)
					BEGIN
						set @result = -1.0
						RETURN NULL --@result
					END				

				--CAH Price
				Select top 1  @costperunit = isnull(PricePerUnit,0.0) FROM Purchases.dbo.v_CHAllWeek
					WHERE NDC=@ndc 
					and dateloaded <= @filldate
					order by [dateloaded] desc
					if (@costperunit = 0.0)
						BEGIN
							set @result = -2.0
							RETURN NULL --@result
						END		
				
				IF @mode = 0
					BEGIN
						set @result = @costperunit
						return @result
					END
				ELSE
					BEGIN				
					--Store Rebate for that month
					Select top 1  
						@rpercent =  CHRebatePerc FROM Purchases.dbo.CHRebates WHERE PMID=@pmid 
						and [date] <= @filldate
						and CHRebatePerc is not null
						order by [date] desc
						if (@rpercent is null)
							BEGIN
								set @result = 0.0
								RETURN NULL --@result
							END				
				
					set @result = @costperunit * (1.0 - @rpercent)
					return @result
					END

	RETURN @result

END
GO
