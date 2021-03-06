USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spQC_SCANESIMonthly]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spQC_SCANESIMonthly]

(
	@ncpdp varchar(7)

)
as
DECLARE @buf varchar(100)
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
,case when [DiabetesOpportunity] = 0 then 'No' else 'Yes' end as [Diabetes Opportunity]
,DiabetesPDC as [Diabetes PDC]
,case when [HypertensionOpportunity] = 0 then 'No' else 'Yes' end as [Hypertension Opportunity]
,HypertensionPDC as [Hypertension PDC]
,case when [CholesterolOpportunity] = 0 then 'No' else 'Yes' end as [Cholesterol Opportunity]
,CholesterolPDC as [Cholesterol PDC]
,case when DiabetesOpportunityTreatment = 0 then 'No' else 'Yes' end as [Diabetes Opportunity Treatment]
,case when HrmOpportunity = 0 then 'No' else 'Yes' end as [HRM Opportunity]
,Drug1Name as [Drug1 Name]
,Drug1NumberHRM2Fills as [Drug1 Number HRM2Fills]
,Drug2Name as [Drug2 Name]
,Drug2NumberHRM2Fills as [Drug2 Number HRM2Fills]
,Drug3Name as [Drug3 Name]
,Drug3NumberHRM2Fills as [Drug3 Number HRM2Fills]

,Drug4Name as [Drug4 Name]
,Drug4NumberHRM2Fills as [Drug4 Number HRM2Fills]
,Drug5Name as [Drug5 Name]
,Drug5NumberHRM2Fills as [Drug5 Number HRM2Fills]
,Drug6Name as [Drug6 Name]
,Drug6NumberHRM2Fills as [Drug6 Number HRM2Fills]

/*
,IsValid
,filedate
,EsiRawTxt
,ParseErrors
*/
INTO #TempTable_QC_ScanEsiMonthly  
from qc_SCANESIMonthly
where ncpdp=@ncpdp
and isvalid=1
and filedate=(select max(filedate) from qc_SCANESIMonthly)
--DATEADD(dd, 0, DATEDIFF(dd, 0, filedate)) > '2/5/2015'

SELECT @buf = max([Drug6 Name]) from #TempTable_QC_ScanEsiMonthly
if (@buf is null or ltrim(@buf)='')
	BEGIN
		ALTER TABLE #TempTable_QC_ScanEsiMonthly DROP COLUMN [Drug6 Number HRM2Fills],[Drug6 Name]
	END	
SELECT @buf = max([Drug5 Name]) from #TempTable_QC_ScanEsiMonthly
if (ltrim(@buf)='' or @buf is null)
	BEGIN
		ALTER TABLE #TempTable_QC_ScanEsiMonthly DROP COLUMN [Drug5 Number HRM2Fills],[Drug5 Name]
	END
SELECT @buf = max([Drug4 Name]) from #TempTable_QC_ScanEsiMonthly
if (ltrim(@buf)='' or @buf is null)
	BEGIN
		ALTER TABLE #TempTable_QC_ScanEsiMonthly DROP COLUMN [Drug4 Number HRM2Fills],[Drug4 Name]
	END
SELECT @buf = max([Drug3 Name]) from #TempTable_QC_ScanEsiMonthly
if (ltrim(@buf)='' or @buf is null)
	BEGIN
		ALTER TABLE #TempTable_QC_ScanEsiMonthly DROP COLUMN [Drug3 Number HRM2Fills],[Drug3 Name]
	END
SELECT @buf = max([Drug2 Name]) from #TempTable_QC_ScanEsiMonthly
if (@buf is null or ltrim(@buf)='')
	BEGIN
		ALTER TABLE #TempTable_QC_ScanEsiMonthly DROP COLUMN [Drug2 Number HRM2Fills],[Drug2 Name]
	END	
SELECT @buf = max([Drug1 Name]) from #TempTable_QC_ScanEsiMonthly
if (@buf is null or ltrim(@buf)='')
	BEGIN
		ALTER TABLE #TempTable_QC_ScanEsiMonthly DROP COLUMN [Drug1 Number HRM2Fills],[Drug1 Name]
	END	
	
SELECT * FROM #TempTable_QC_ScanEsiMonthly  
DROP TABLE #TempTable_QC_ScanEsiMonthly 

--grant exec on spQC_SCANESIMonthly to webdevuser

/*
spQC_SCANESIMonthly '0500163' 

select distinct filedate from qc_SCANESIMonthly order by filedate desc
select * from qc_SCANESIMonthly where filedate='4/3/15'
and ncpdp='0500163' --patientid='386495754'
select * from qc_SCANESIMonthly 
where patientid='386495652'


select distinct HypertensionPDC from qc_SCANESIMonthly where filedate='4/3/15'

drop table QC_NCPDPs
select distinct ncpdp

from
(
select distinct [pharmid] as ncpdp from QC_DDI --sic
union
select distinct [pharm id] as ncpdp from QC_HRM
union
select distinct [pharm id] as ncpdp from QC_Adherence
union
select distinct [pharm id] as ncpdp from QC_DiabetesPlan
) dt

select * from QC_NCPDPs
*/
GO
