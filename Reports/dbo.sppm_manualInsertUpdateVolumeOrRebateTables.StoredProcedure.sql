USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_manualInsertUpdateVolumeOrRebateTables]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_manualInsertUpdateVolumeOrRebateTables]
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- INSERT  into pharmacymaster..all_volume (Date,PMID,CHAccountNo,DCNum,DCCity,AccountName,Address,City,State,ZIP,APIAccountNo,AAPAccountNo,UDAccountNo,DEA,APICOGAppliedSales,
--						APINetSales,APIGENRx,APIGENTotalSrc,APIGENTotalP2P3,APIGENTotal,APIBrand,APIOTC,APIOther,APIGBRPerc,AAPCOGAppliedSales,AAPNetSales,
--						AAPBrand,AAPGENTotal,AAPGENTotalSrc,AAPGENExcl,AAPOTC,AAPOther,UDNetSales,UDBrand,UDGENTotalSrc,UDGENTotal,UDOTC,UDOther,UDAdminOnly,CombNetSales,
--						CombBrands,CombOTC,CombGENTotal,CombGENTotalSrc,CombOther,CombAdminOnly )   
--VALUES('07/01/2011',105910,null,null,null,'THE MEDICINE SHOPPE #0387',null,null,null,null,'10202724','12162',null,'BT5548562',0,
--        0,0,0,0,0,0,0,0,0,362627.55,440058.31,
--        380481.88,48423.34,48356.86,66.48,2706.08,8447.01,0,0,0,0,0,0,0,0,
--        0,0,0,0,0,0)
--------
--
--
--------Need to update all_volume with August data for 105910 (there is already a record in there)
--update pharmacymaster..all_volume set 
--AAPAccountNo = 12162,
--AAPCOGAppliedSales = 352589.51,
--AAPNetSales = 426181.57,
--AAPBrand = 362646.57,
--AAPGENTotal = 50938.91,
--AAPGENTotalSrc = 50878.93,
--AAPGENExcl = 59.98,
--AAPOTC = 2568.63,
--AAPOther = 10027.46
-- where 
--pmid = 105910 and month(date) = 08 and year(date) = 2011
----

--Insert into reports..import_CHRebate (Date,PMID,[Primary CA#],Division,API#,[Account Name],[SumOfExtended Sales],[AAP Volume Admin Fee],[Affiliation],[Bs Class],
--[Affiliate Admin Fee],[SumOfBrand Rx Sales],[SumOfCCA = AAP Generics 872, 25676, 25677],[SumOfCCA = 26776 AAP Excluded Generic Rx Prod],[SumOfTotal Generics],
--[Est Generic Admin Fee],[Generic Admin Fee -PIPCO only],[Calculated generic rebate],[Leader Rebate],
--[MSI Rebate],[Pay to Store],[Pay to Affiliate Office],[Total to Pay Out],[Territory Manager],[Pay Account],[Effective Rebate%],HRTA,[Sort Code])
--values
--('07/01/2011',105910,'61295','VALENCIA','10202724','THE MEDICINE SHOPPE #0387',440058.31,1540.20,'PFOA','C34',
--880.11,380481.88,48356.86,66.48,48423.34,1208.92,0,7379.59,0,
--0,0,8259.7,8259.7,30,1,15.26,19.50,0)

--Insert into pharmacymaster..pm_rebates_chaap (Date,PMID,PrimaryCANo,Division,APIAccountNo,AccountName,ExtendedSales,AAPVolumeAdminFee,Affiliate,BusCls,
--AAPVolumeAdminFeePaidToAffiliate,BrandRxSales,SourceGenericSales,ExcludedGenericSales,TotalGenericSales,AAPGenericAdminFee,AAPGenericAdminFeePaidToPipco,GenericRebate,LeaderRebate,
--MSIRebate,PayToStore,PayToAffiliateOffice,TotalToPayOut,TM,PayAccount,EffRebatePerc,HRTA,SortCode,RebateType)
--values
--('07/01/2011',105910,'61295','VALENCIA','10202724','THE MEDICINE SHOPPE #0387',440058.31,1540.20,'PFOA','C34',
--880.11,380481.88,48356.86,66.48,48423.34,1208.92,0,7379.59,0,
--0,0,8259.7,8259.7,30,1,15.26,19.50,0,'GR')
--
--
--select * from reports..import_CHRebate 
----
--DON"T DO THIS  _ WE DONT HAVE AUGUST REBATES YET
--Insert into temptables..pm_rebates_chaap_testJMW (Date,PMID,PrimaryCANo,Division,APIAccountNo,AccountName,ExtendedSales,AAPVolumeAdminFee,Affiliate,BusCls,
--AAPVolumeAdminFeePaidToAffiliate,BrandRxSales,SourceGenericSales,ExcludedGenericSales,TotalGenericSales,AAPGenericAdminFee,AAPGenericAdminFeePaidToPipco,GenericRebate,LeaderRebate,
--MSIRebate,PayToStore,PayToAffiliateOffice,TotalToPayOut,TM,PayAccount,EffRebatePerc,HRTA,SortCode,RebateType)
--values
--('08/01/2011',105910,'61295','32','10202724','THE MEDICINE SHOPPE #0387',426181.57,1491.64,'PFOA','C34',
--0,362646.57,50878.93,59.98,50938.91,0,0,7871.39,0,
--0,0,0,0,0,0,0,0,0,'GR')


--drop table temptables..ALL_Volume_testJMW 
-- select * into temptables..ALL_Volume_testJMW from pharmacymaster..all_volume
-- select * into temptables..ALL_Volume_B4Change092211 from pharmacymaster..all_volume
-- select * into temptables..ch_allpva_sales_B4Change092211 from pharmacymaster..ch_allpva_sales
--
-- drop table temptables..pm_rebates_chaap_testJMW 
-- select * into temptables..pm_rebates_chaap_testJMW from pharmacymaster..pm_rebates_chaap
-- select * into temptables..pm_rebates_chaap_B4Change092211 from pharmacymaster..pm_rebates_chaap
-- select * into temptables..import_CHRebate_B4Change092211 from reports..import_Chrebate
--
--select * from temptables..ALL_Volume_testJMW where pmid = 105910 and month(date) = 08 and year(date) = 2011
--select * from temptables..pm_rebates_chaap_testJMW where pmid = 105910 and month(date) = 07 and year(date) = 2011

------Need to update all_volume with July data for 105977 (there is already a record in there)
--update pharmacymaster..all_volume set 
--AAPAccountNo = 12232,
--AAPCOGAppliedSales = 40196.43,
--AAPNetSales = 61226.08,
--AAPBrand = 39623.35,
--AAPGENTotal = 20260.83,
--AAPGENTotalSrc = 20068.11,
--AAPGENExcl = 192.72,
--AAPOTC = 1018.32,
--AAPOther = 323.58
-- where 
--pmid = 105977 and month(date) = 07 and year(date) = 2011 

--select * from  pharmacymaster..ch_allpva_sales where  pmid = 105977 

--------
--PMID	ExtendedSales	AAPVolumeAdminFee	AffiliateAdminFee	SumOfBrandRxSales	SrcGens ExcludedGens	TotalGenerics	EstGenericAdminFee	Calculatedgenericrebate	PaytoAffiliateOffice	TotaltoPayOut
-----

--update pharmacymaster..pm_rebates_chaap set 
--ExtendedSales = 61226.08,
--AAPVolumeAdminFee = 214.29,
--AAPVolumeAdminFeePaidToAffiliate = 122.45,
--BrandRxSales = 39623.35,
--SourceGenericSales = 20068.11,
--ExcludedGenericSales = 192.72,
--TotalGenericSales  = 20260.83,
--AAPGenericAdminFee = 501.70,
--GenericRebate = 2360.56,
--PayToAffiliateOffice = 2483.01,
--TotalToPayOut = 2483.01
-- where 
--pmid = 105977 and month(date) = 07 and year(date) = 2011 

--update  reports..import_Chrebate set 
--[SumOfExtended Sales] = 61226.08,
--[AAP Volume Admin Fee] = 214.29,
--[Affiliate Admin Fee] = 122.45,
--[SumOfBrand Rx Sales] = 39623.35,
--[SumOfCCA = AAP Generics 872, 25676, 25677] = 20068.11,
--[SumOfCCA = 26776 AAP Excluded Generic Rx Prod] = 192.72,
--[SumOfTotal Generics]  = 20260.83,
--[Est Generic Admin Fee] = 501.70,
--[Calculated generic rebate] = 2360.56,
--[Pay to Affiliate Office] = 2483.01,
--[Total to Pay Out] = 2483.01
-- where 
--pmid = 105977 and month(date) = 07 and year(date) = 2011 
 
 


--drop table temptables..ALL_Volume_testJMW 
 --select * into temptables..ALL_Volume_testJMW from pharmacymaster..all_volume
--select * into temptables..ALL_Volume_B4Change092111 from pharmacymaster..all_volume
--
--drop table temptables..pm_rebates_chaap_testJMW 
--select * into temptables..pm_rebates_chaap_testJMW from pharmacymaster..pm_rebates_chaap
--select * into temptables..pm_rebates_chaap_B4Change092111 from pharmacymaster..pm_rebates_chaap

 -- select * from temptables..ALL_Volume_testJMW where pmid = 105977 and month(date) = 07 and year(date) = 2011 
 --select * from temptables..pm_rebates_chaap_testJMW where pmid = 105977 and month(date) = 07 and year(date) = 2011 
--
--select * from temptables..pm_rebates_chaap_testJMW where affiliate = 'PFOA'
END








GO
