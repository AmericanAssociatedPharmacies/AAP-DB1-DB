USE [Purchases]
GO
/****** Object:  UserDefinedFunction [dbo].[GetInvoice_Test]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetInvoice_Test] --ORIGINAL

(	
	@NDC nvarchar(20),
	--@FillDate smalldatetime,
	@APINo nvarchar(50),
	@PMID nvarchar(50)	
)

RETURNS nvarchar(50)
AS
BEGIN

declare @iRet nvarchar(50)
set @iRet = '0'


IF @iRet = '0'
BEGIN
		
BEGIN
		
		--API
		select @iRet = 'API'+ISNULL(MAX(InvNbr),'0') from API..APISalesDetail 
        where 
        WHAccountID=@APINo AND 
        NDC = @NDC 
        --AND convert(varchar(10), INVDATE, 101) < @filldate AND convert(varchar(10), INVDATE, 101) > DATEADD(mm, DATEDIFF(mm,0,DATEADD(m, - 5, @filldate)), 0)
		if @iRet = 'API0'
			BEGIN
				--CAH
				select @iRet = 'CAH'+ISNULL(MAX(Invoice_No),'0') from CHPH_AAP 
				where PMID=@PMID AND NDC = @NDC 
                --AND convert(varchar(10), INV_DATE, 101) < @filldate AND convert(varchar(10), INV_DATE, 101) > DATEADD(mm, DATEDIFF(mm,0,DATEADD(m, - 5, @filldate)), 0)
               
                              
		END
         if @iRet = 'CAH0'
			BEGIN
				--ML
				select @iRet = Case WHEN PrimaryWholesaler = 44 THEN 'OML' ELSE '' END from PharmacyMaster..PM_Pharmacy
				where PMID=@PMID 
			END
		
		
	END
END

return @iRet
end



--(	
--	@NDC nvarchar(20),
--	@FillDate smalldatetime,
--	@APINo nvarchar(50),
--	@PMID nvarchar(50)	
--)
--
--RETURNS nvarchar(50)
--AS
--BEGIN
--
--declare @iRet nvarchar(50)
--set @iRet = '0'
--
--
--IF @iRet = '0'
--BEGIN
--		
--	BEGIN
--		
--		--API
--		select @iRet = 'API'+ISNULL(MAX(InvNbr),'0') from API..APISalesDetail 
--        where 
--            WHAccountID=@APINo AND 
--            NDC = @NDC 
--            --AND INVDATE < @filldate AND INVDATE > DATEADD(mm, DATEDIFF(mm,0,DATEADD(m, - 3, @filldate)), 0)
--             AND INVDATE >= DATEADD(m, -3, @filldate)
--
--		if @iRet = 'API0'
--			BEGIN
--				--CAH
--				select @iRet = 'CAH'+ISNULL(MAX(Invoice_No),'0') from CHPH_AAP 
--				where 
--                  PMID=@PMID AND 
--                  NDC = @NDC 
--                 --AND INV_DATE < @filldate AND INV_DATE > DATEADD(mm, DATEDIFF(mm,0,DATEADD(m, - 6, @filldate)), 0)
--                  AND INV_DATE >= DATEADD(m, -3, @filldate)
--                
--			END
--
--		if @iRet = 'CAH0'
--			BEGIN
--				--ML
--				select @iRet = Case WHEN PrimaryWholesaler = 44 THEN 'OML' ELSE '' END from PharmacyMaster..PM_Pharmacy
--				where PMID=@PMID 
--			END
--		
--		
--	END
--END
--
--return @iRet
--end
GO
