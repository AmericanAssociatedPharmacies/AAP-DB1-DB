USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[aap_monitor]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 1-19-10
-- Modify date: 1-20-10
-- Description:	audit monitor.  Q&A dept. reviews this report. 
-- 1-20-10 REH - added a 3rd parameter @pRecordtype
-- =============================================
CREATE PROCEDURE [dbo].[aap_monitor]
	-- Add the parameters for the stored procedure here
	@pStartDate datetime = getdate ,
	@pEndDate datetime = GETDATE ,
	@pRecordType INT = 3 -- 0=adds only, 1= updates only, 2=Deletes, 3=all
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	set @pStartDate = CONVERT(varchar(10), @pStartDate, 101)
    set @pEndDate = CONVERT(varchar(10), @pEndDate, 101)

/*
WITH unq_primary AS (SELECT DISTINCT PrimaryKey, SysUser, TableName
      FROM         dbo.Audit), unq_users AS
    (SELECT DISTINCT PrimaryKey, SysUser FROM dbo.Audit AS Audit_4), unq_tables AS
    (SELECT DISTINCT PrimaryKey, SysUser, TableName FROM dbo.Audit AS Audit_3), unq_primary_today AS(SELECT DISTINCT PrimaryKey, SysUser, TableName
      FROM          dbo.Audit AS Audit_2
      WHERE      (CAST(CONVERT(varchar, AuditDate, 101) AS DateTime) = CAST(CONVERT(varchar, GETDATE(), 101) AS DateTime))), 
unq_primary_yesterday AS
    (SELECT DISTINCT PrimaryKey, SysUser, TableName
      FROM          dbo.Audit AS Audit_1
      WHERE      (CAST(CONVERT(varchar, AuditDate, 101) AS DateTime) = CAST(CONVERT(varchar, GETDATE(), 101) AS DateTime)))
  
*/  
	
	
	IF @pRecordType = 3
	--all records   
	   
	SELECT distinct aap.aapAccountNo as [aapid],a.SysUser, a.TableName, CASE operation WHEN 'i' THEN 'ADD' WHEN 'd' THEN 'DELETED' ELSE 'UPDATE' END AS operation, a.AuditDate, 
           aap.CorporateName as [corpname], aap.accountname as [StoreName], aap.aapAccountNo as [AAPID], aap.DEA, aap.aappreviousgroup as [PreviousAcctNo], a.oldvalue,a.newvalue,a.ColumnName
    FROM  pharmacymaster.dbo.Audit AS a INNER JOIN
          pharmacymaster.dbo.pm_pharmacy AS aap ON a.PrimaryKey = aap.pmID
    WHERE     (CAST(CONVERT(varchar, a.AuditDate, 101) AS DateTime) BETWEEN @pStartDate AND @pEndDate) AND Operation IN ('i','u','d')
    GROUP BY aap.aapAccountNo, a.SysUser, a.TableName, a.Operation, a.AuditDate, aap.CorporateName, aap.AccountName, aap.DEA, aap.aapPreviousGroup,a.oldvalue, a.newvalue, a.ColumnName
    UNION ALL
	SELECT distinct '' AS [aapid],a.SysUser, a.TableName, CASE operation WHEN 'i' THEN 'ADD' WHEN 'd' THEN 'DELETED' ELSE 'UPDATE' END AS operation, a.AuditDate, 
           '' AS CorpName, '' AS  StoreName, '' AS AAPID, '' AS DEA, '' AS PreviousAcctNo, a.oldvalue,a.newvalue,a.ColumnName
    FROM  dbo.Audit AS a 
    WHERE     (CAST(CONVERT(varchar, a.AuditDate, 101) AS DateTime) BETWEEN @pStartDate AND @pEndDate) AND Operation IN ('d')
    GROUP BY a.SysUser, a.TableName, a.Operation, a.AuditDate, a.oldvalue, a.newvalue,a.ColumnName
    ORDER BY a.AuditDate
    
    

    
	IF @pRecordType = 0
	--inserts only   
	SELECT distinct aap.aapAccountNo as [aapid],a.SysUser, a.TableName, CASE operation WHEN 'i' THEN 'ADD' WHEN 'd' THEN 'DELETED' ELSE 'UPDATE' END AS operation, a.AuditDate, 
           aap.CorporateName as [corpname], aap.accountname as [StoreName], aap.aapAccountNo as [AAPID], aap.DEA, aap.aappreviousgroup as [PreviousAcctNo], a.oldvalue,a.newvalue,a.ColumnName
    FROM  pharmacymaster.dbo.Audit AS a INNER JOIN
          pharmacymaster.dbo.pm_pharmacy AS aap ON a.PrimaryKey = aap.pmID
    WHERE     (CAST(CONVERT(varchar, a.AuditDate, 101) AS DateTime) BETWEEN @pStartDate AND @pEndDate) AND Operation IN ('i')
    GROUP BY aap.aapAccountNo, a.SysUser, a.TableName, a.Operation, a.AuditDate, aap.CorporateName, aap.AccountName, aap.DEA, aap.aapPreviousGroup,a.oldvalue, a.newvalue, a.ColumnName
    ORDER BY a.AuditDate
    
	IF @pRecordType = 1
	--updates only   
	   
	SELECT distinct aap.aapAccountNo as [aapid],a.SysUser, a.TableName, CASE operation WHEN 'i' THEN 'ADD' WHEN 'd' THEN 'DELETED' ELSE 'UPDATE' END AS operation, a.AuditDate, 
           aap.CorporateName as [corpname], aap.accountname as [StoreName], aap.aapAccountNo as [AAPID], aap.DEA, aap.aappreviousgroup as [PreviousAcctNo], a.oldvalue,a.newvalue,a.ColumnName
    FROM  pharmacymaster.dbo.Audit AS a INNER JOIN
          pharmacymaster.dbo.pm_pharmacy AS aap ON a.PrimaryKey = aap.pmID
    WHERE     (CAST(CONVERT(varchar, a.AuditDate, 101) AS DateTime) BETWEEN @pStartDate AND @pEndDate) AND Operation IN ('u')
    GROUP BY aap.aapAccountNo, a.SysUser, a.TableName, a.Operation, a.AuditDate, aap.CorporateName, aap.AccountName, aap.DEA, aap.aapPreviousGroup,a.oldvalue, a.newvalue, a.ColumnName
    ORDER BY a.AuditDate
    
   	IF @pRecordType = 2
	--deletes only   
	   
	SELECT distinct '' AS [aapid],a.SysUser, a.TableName, CASE operation WHEN 'i' THEN 'ADD' WHEN 'd' THEN 'DELETED' ELSE 'UPDATE' END AS operation, a.AuditDate, 
           '' AS CorporateName, '' AS  accountName, '' AS AAPaccountno, '' AS DEA, '' AS aappreviousgroup, a.oldvalue,a.newvalue,a.ColumnName
    FROM  dbo.Audit AS a 
    WHERE     (CAST(CONVERT(varchar, a.AuditDate, 101) AS DateTime) BETWEEN @pStartDate AND @pEndDate) AND Operation IN ('d')
    GROUP BY a.SysUser, a.TableName, a.Operation, a.AuditDate, a.oldvalue, a.newvalue,a.ColumnName
    ORDER BY a.AuditDate


END










GO
