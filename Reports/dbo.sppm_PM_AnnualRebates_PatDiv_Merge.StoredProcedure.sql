USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_PatDiv_Merge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ====================
-- Author:		< Joni Wilson>
-- Create date: <02/10/2016>
-- Description:	 Merge old data into reports..import_RebatePatDivRebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_PatDiv_Merge]
(@in_year varchar(4) )
AS
BEGIN
--2011
--INSERT  INTO import_RebatePatDivRebate (Year,PMID,AccountName,PatDivRebate,FirstPayment,SecondPayment)
--SELECT  '2011' as year, PMID,[Store Name],[Total Patr Div],[Pay in Apr],[Pay in Jul] from  import_PatDivRebate2011

----2012
----
--INSERT  INTO import_RebatePatDivRebate (Year,PMID,AccountName,AAPAccountNo,AAPParentNo,UDNo,APIAccountNo,Affiliate,AAPEffectiveDate,
--AAPQuitDate,IsMC,MCQuitDate,MLAdminFee,HighVolIncentive,AAPPVAVolAdminFee,
--AAPPVAVolAdminFeeRetained,AAPPVAGenAdminFee,AAPPVAGenAdminFeeRetained,CardinalAnnualRebate,
--CardinalUpfrontAdmin,WHBrandYear,WHGenYear,WHOTCYear,
--FinalAllocation,FirstPayment,SecondPayment,PatDivRebate)
--
--SELECT  '2012' as Year,PMID,AccountName,[AAP Account No],[AAP Parent No],[UD Account No],[API Account No],Affiliate,[AAP Effective Date],
--[AAP Quit Date],[Is MC],[MC Quit Date],[ML Admin Fee],[HIGH VOL INCENTIVE],[AAP PVA Vol Admin Fee],
--[AAP PVA Vol Admin Fee Retained],[AAP PVA Gen Admin Fee],[AAP PVA Gen Admin Fee Retained],[Cardinal Annual Admin],
--[Cardinal Upfront Admin Fee Alloc],[WH Brand 2012],[WH Gen 2012],[WH OTC 2012],
--[Total Allocation],[Send April 15],[Send July 15],[Patronage Dividends] from  import_PatDivRebate2012
-- 
 

--2013
INSERT  INTO import_RebatePatDivRebate (Year,PMID,AccountName,AAPAccountNo,AAPParentNo,UDNo,APIAccountNo,Affiliate,AAPEffectiveDate,AAPQuitDate,
IsMC,MCQuitDate,MLAdminFee,HighVolIncentive,AAPPVAVolAdminFee,
AAPPVAVolAdminFeeRetained,AAPPVAGenAdminFee,AAPPVAGenAdminFeeRetained,CardinalAnnualRebate,
CardinalUpfrontAdmin,WHBrandYear,WHGenYear, WHOTCYear,FinalAllocation,
FirstPayment,SecondPayment,PatDivRebate)

select '2013',PMID,[AccountName],[AAP No#],[Parent No#],[UD No],[API No#],[Affiliate],[AAPEffDate],[AAP Quit],
[Is MC],[MC Quit],[ML Adm Fee],[HV INCENTIVE],[PVA Vol Adm Fee],
[PVA Vol Adm Fee Kept],[PVA Gen Adm Fee],[PVA Gen Adm Fee Kept],[Card Annual Rebate],
[Cardinal Upfront Admin],[WH Brand 2013],[WH Gen 2013],[WH OTC 2013],[Total Alloc],
[Send Apr 14],[Send July 14],[Total Patr Div] from  import_PatDivRebate2013




--Year,PMID,AccountName,AAPAccountNo,AAPParentNo,UDNo,APIAccountNo,Affiliate,AAPEffectiveDate,
--AAPQuitDate,IsMC,MCQuitDate,MCContribution,MLAdminFee,HighVolIncentive,AAPPVAVolAdminFee,
--AAPPVAVolAdminFeeRetained,AAPPVAGenAdminFee,AAPPVAGenAdminFeeRetained,CardinalAnnualRebate,
--SubtotalCardinal,CardinalUpfrontAdmin,CardinalHVTotal,AAPParentContribution,WHBrandYear,
--WHGenYear,WHGenContribution,WHOTCYear,MCCardinalAPIWhseContribution,PrelimAllocation,
--Under15deleted,FinalAllocation,HalfOfAllocation,PaymentMethod,CheckFee,FirstPayment,
--SecondPayment,PatDivRebate


 
END








GO
