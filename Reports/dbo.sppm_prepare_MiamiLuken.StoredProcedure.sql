USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_MiamiLuken]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate Rebate from  Import
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_MiamiLuken]
(@in_date varchar(10))
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'MiamiLuken_BKP')
 BEGIN
  DROP TABLE MiamiLuken_BKP
 END

SELECT * into MiamiLuken_BKP from PharmacyMaster..MiamiLuken 
 
INSERT INTO PharmacyMaster..MiamiLuken  
SELECT * from  reports..import_MiamiLuken   where date = @in_date;
 
DELETE from PharmacyMaster..MiamiLuken  where TotalSales = 0 and RxSales = 0 and GenericSales = 0 and TotalRebate = 0
and AdminRebate = 0 and GenericRebate = 0

UPDATE  ml  set 
	ml.pmid = p.pmid  
FROM pharmacymaster..MiamiLuken   ml 
inner join 
	( select  pmid, udaccountno ,aapaccountno from pharmacymaster..pm_pharmacy  ) p
on ml.udaccountno = p.udaccountno or ml.udaccountno = p.aapaccountno where ml.pmid is null

END










GO
