USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_AAPCurrentMemberList]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_AAPCurrentMemberList]
as
select 
PMID,AAPAccountNo,AAPParentNo,APIAccountNo,NCPDP,DEA,
AAPEffectiveDate,
Territory as TM,
AccountName,
City,
State, zip
from v_PM_AllwithAffiliates
where AAPAccountno is not null 
--and AAPEffectivedate is not null
and AAPQuitDate is null
GO
