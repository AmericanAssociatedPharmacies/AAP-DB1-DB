USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_ComputerSoftwareLastUpdated]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_ComputerSoftwareLastUpdated]
AS

select cast(primarykey as int) as PMID,max(auditdate) as LastUpdated
from audit 
where tablename = 'dbo.pm_pharmacy' and columnname = '[ComputerSoftware]'
group by primarykey
 
 
GO
