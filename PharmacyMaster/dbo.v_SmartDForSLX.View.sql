USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_SmartDForSLX]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SmartDForSLX]
AS
SELECT NCPDP,AAPAccountNo,p.PMID from pm_pharmacy p
join (
	SELECT * from pm_memberprograms where programid = 193
	and startdate is not null and enddate is null
) pm
on p.pmid = pm.pmid  
GO
