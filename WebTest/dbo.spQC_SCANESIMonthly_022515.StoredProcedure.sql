USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spQC_SCANESIMonthly_022515]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spQC_SCANESIMonthly_022515]
(
	@ncpdp varchar(7)

)
as
select
/*
Id
,ScanFileId
,NCPDP
,NPI
,PharmacyName
,CorporateName
,ClientEsiId
,
*/
PatientId as [Patient ID]
,PatientLName as [Patient LName]
,PatientFName as [Patient FName]
,convert(varchar(12),convert(datetime,DOB),101) as [DOB]
,Phone as [Phone]
--,PlanName as [Plan Name]
--,CMSContractId as [CMS Contract Id]
,DateFirstFillDiabetes as [Date FirstFill Diabetes]
,DateFirstFillHypertension as [Date FirstFill Hypertension]
,DateFirstFillCholesterol as [Date FirstFill Cholesterol]
,DiabetesOpportunity as [Diabetes Opportunity]
,DiabetesPDC as [Diabetes PDC]
,HypertensionOpportunity as [Hypertension Opportunity]
,HypertensionPDC as [Hypertension PDC]
,CholesterolOpportunity as [Cholesterol Opportunity]
,CholesterolPDC as [Cholesterol PDC]
,HrmOpportunity as [HRM Opportunity]
,DiabetesOpportunityTreatment as [Diabetes Opportunity Treatment]
,Drug1Name as [Drug1 Name]
,Drug1NumberHRM2Fills as [Drug1 Number HRM2Fills]
,Drug2Name as [Drug2 Name]
,Drug2NumberHRM2Fills as [Drug2 Number HRM2Fills]
,Drug3Name as [Drug3 Name]
,Drug3NumberHRM2Fills as [Drug3 Number HRM2Fills]
/*
,Drug4Name as [Drug4 Name]
,Drug4NumberHRM2Fills as [Drug4 Number HRM2Fills]
,Drug5Name as [Drug5 Name]
,Drug5NumberHRM2Fills as [Drug5 Number HRM2Fills]
,Drug6Name as [Drug6 Name]
,Drug6NumberHRM2Fills as [Drug6 Number HRM2Fills]
*/
/*
,IsValid
,filedate
,EsiRawTxt
,ParseErrors
*/
from qc_SCANESIMonthly
where ncpdp=@ncpdp
and isvalid=1
and  DATEADD(dd, 0, DATEDIFF(dd, 0, filedate)) > '2/5/2015'
--grant exec on spQC_SCANESIMonthly to webdevuser

/*
spQC_SCANESIMonthly '
*/
GO
