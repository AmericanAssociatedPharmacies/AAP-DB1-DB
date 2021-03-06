USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_web_pm_userprograms_requireChaincode]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[v_web_pm_userprograms_requireChaincode]
as
--show all programs with 0 or 1 for participant
--1. programs table, doesn't include MCare or AAP
select
dt1.pmid,dt2.programid,dt2.description,
case when mp.pmid is null then 0 else
	case when mp.enddate is null and mp.startdate is not null then 1 else 0 end
	end as isInProgram
from
(select distinct pmid from v_pm_allwithaffiliates) dt1
join
(
select distinct programid,description from pm_programs where aap=1
) dt2
on dt1.pmid=dt1.pmid
left join pm_memberprograms mp on mp.pmid=dt1.pmid and mp.programid=dt2.programid

--managed care
union
select distinct pmid, -1 as programid, 'Managed Care' as description,
case when
	(ChainCode IS NOT NULL) AND (MCQuitDate IS NULL) AND (AAPAccountNo IS NOT NULL OR
     AAPAccountNo <> '') OR
    (ChainCode IS NOT NULL) AND (MCQuitDate IS NULL) AND (AAPAccountNo IS NULL) AND (IsNPP = - 1)
	then 1 else 0 end as isInProgram
 from v_pm_allwithaffiliates

--AAP member
union
select distinct pmid, -2 as programid, 'AAP Member' as description,
case when AAPaccountno is not null and AAPquitdate is null then 1 else 0 end as isInProgram
 from v_pm_allwithaffiliates

union
select distinct pmid, -3 as programid, 'API Customer' as description,
case when APIStatus='ACTIVE' then 1 else 0 end as isInProgram
 from v_pm_allwithaffiliates

--order by 1,3

GO
