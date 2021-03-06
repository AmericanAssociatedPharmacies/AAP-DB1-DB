USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spQC_SCANESIDaily2]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spQC_SCANESIDaily2]
(
	@ncpdp varchar(8),
	@includePHI int
)
AS
/*	rxaap quality center SCAN data display
	BG 1/2015 show only populated columns, e.g. omit drug3 if no records containing it
	optionally suppress PHI columns
*/
BEGIN
DECLARE @buf varchar(100)
SELECT 
DISTINCT  ---remove duplicates in daily file loads
	  /*[Id]
      ,[QC_ScanFileId]
      ,[NCPDP]
      ,[NPI]
      ,[PharmacyName]
      ,[CorporateName]
      ,[ClientEsiId]
      ,
      */
	  case when @includePHI=1 then [PatientId] else '' end as [PatientId]
      ,case when @includePHI=1 then [PatientLName] else '' end as [PatientLName]
      ,case when @includePHI=1 then [PatientFName] else '' end as [PatientFName]
      ,case when @includePHI=1 then [DOB] else '' end as [DOB]
      ,case when @includePHI=1 then [Phone] else '' end as [Phone]
      --,[PlanName] --always SCAN HEALTH PLAN
--,[CMSContractId] as [CMS Contract Id]  --show this? two distinct values
--,convert(varchar(12),DATEADD(dd, 0, DATEDIFF(dd, 0, filedate)),101) as [SCAN File Date]
,[FirstFillDate] as [First Fill Date] 
,[Drug1NpiNbr] as [Drug1 NPI] 
,[Drug1NumFill] as [Drug1 NumFill] 
,[Drug1Name] as [Drug1 Name] 
,[Drug1GCN] as [Drug1 GCN] 
,[Drug2NumFill] as [Drug2 NumFill] 
,[Drug2Name] as [Drug2 Name] 
,[Drug2GCN] as [Drug2 GCN] 
,[Drug3NumFill] as [Drug3 NumFill]   --show this and the following only if populated
,[Drug3Name] as [Drug3 Name] 
,[Drug3GCN] as [Drug3 GCN] 
      /*
      ,[Drug4NumFill]
      ,[Drug4Name]
      ,[Drug4GCN]
      ,[Drug5NumFill]
      ,[Drug5Name]
      ,[Drug5GCN]
      --,[IsValid] --? all NULL
      */
--INTO #TempTable    
FROM [WebDev].[dbo].[QC_ScanEsiDaily]
where NCPDP=@NCPDP AND FileDate=(select max(filedate) from qc_SCANESIDaily)
/*
SELECT @buf = max([Drug5Name]) from #TempTable
if (ltrim(@buf)='' or @buf is null)
	BEGIN
		ALTER TABLE #TempTable DROP COLUMN [Drug5NumFill],[Drug5Name],[Drug5GCN]
	END
SELECT @buf = max([Drug4Name]) from #TempTable
if (ltrim(@buf)='' or @buf is null)
	BEGIN
		ALTER TABLE #TempTable DROP COLUMN [Drug4NumFill],[Drug4Name],[Drug4GCN]
	END
SELECT @buf = max([Drug3Name]) from #TempTable
if (ltrim(@buf)='' or @buf is null)
	BEGIN
		ALTER TABLE #TempTable DROP COLUMN [Drug3NumFill],[Drug3Name],[Drug3GCN]
	END
SELECT @buf = max([Drug2Name]) from #TempTable
if (@buf is null or ltrim(@buf)='')
	BEGIN
		ALTER TABLE #TempTable DROP COLUMN [Drug2NumFill],[Drug2Name],[Drug2GCN]
	END	
SELECT * FROM #TempTable
DROP TABLE #TempTable
*/
END

GO
