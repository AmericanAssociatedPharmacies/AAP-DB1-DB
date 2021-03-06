USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ProgramMCCountDashboard]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/08/2011>
-- Description:	Create Non Satellite Active Member list for Clint - to be run Quarterly
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ProgramMCCountDashboard]

(@in_endDate as varchar(10))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
-- Current

Truncate table DashboardProgramCount;
 
Insert into DashboardProgramCount
	SELECT  cast('Managed Care' as varchar(125)) as Program,count(*) as  Count ,cast('Current' as varchar(50)) as Type from pharmacymaster..v_pm_allwithaffiliates where 
	chaincode is not null and mcquitdate is   null and aapaccountno is not null   and aapquitdate is null

	Union

	SELECT Description as Program,count(CountPM) as  Count,'Current' as Type from
	(
	SELECT  distinct pm.pmid ,count(*) as CountPM, Programid,enddate  from pharmacymaster..pm_memberprograms pm
	join
	(
		SELECT * from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''    and aapquitdate is null
	) p
	on pm.pmid = p.pmid where enddate is null
		group by pm.pmid , Programid  ,enddate 
	)ch
	left outer join 
	(
		SELECT programid,description from pharmacymaster..pm_programs
	)
	pr
	on ch.programid = pr.programid
	group by ch.programid,description 

--Need to do this so the Previous year will get all the same programs even though it may be zero count

Insert into DashboardProgramCount
 

	SELECT Description as Program,0 as  Count,'Previous' as Type from
	(
	SELECT  distinct pm.pmid ,count(*) as CountPM, Programid,enddate  from pharmacymaster..pm_memberprograms pm
	join
	(
		SELECT * from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''    and aapquitdate is null
	) p
	on pm.pmid = p.pmid where enddate is null
		group by pm.pmid , Programid  ,enddate 
	)ch
	left outer join 
	(
		SELECT programid,description from pharmacymaster..pm_programs
	)
	pr
	on ch.programid = pr.programid
	group by ch.programid,description 
 

--Previous Year
Insert into DashboardProgramCount
	SELECT 'Managed Care' as Program,count(*) as  Count ,'Previous' as Type from pharmacymaster..v_pm_allwithaffiliates where chaincode is not null  and
    ( mcquitdate is null or mcquitdate > @in_endDate) and
	 aapaccountno is not null   and ( aapquitdate is null or aapquitdate > @in_endDate) and
	aapeffectivedate <= @in_endDate and 
	reports.dbo.maxdate(mceffectivedate,aapeffectivedate) <= @in_endDate and reports.dbo.maxdate(mceffectivedate,aapeffectivedate)
	is not null;

    --UNION 
--	SELECT Description as Program,count(CountPM) as CurrentCount,'Previous' as Type from
--	(
--	SELECT  distinct pm.pmid ,count(*) as CountPM, Programid,enddate  from pharmacymaster..pm_memberprograms pm
--	join
--	(
--		SELECT * from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''    and ( aapquitdate is null or aapquitdate > '10/31/2011')
-- 
--	) p
--	on pm.pmid = p.pmid where (reports.dbo.mindate(enddate,aapquitdate) > '10/31/2011' or reports.dbo.mindate(enddate,aapquitdate) is null)   and startdate <= '10/31/2011'
--		group by pm.pmid , Programid  ,enddate  
--	)ch
--	left outer join 
--	(
--		SELECT programid,description from pharmacymaster..pm_programs
--	)
--	pr
--	on ch.programid = pr.programid
--	group by ch.programid,description  

	UPDATE  su  set 
			Count = ch.CurrentCount  
	   FROM DashboardProgramCount   su 
		inner join 
			( 

				SELECT Description as Program,count(CountPM) as CurrentCount,'Previous' as Type from
				(
				SELECT  distinct pm.pmid ,count(*) as CountPM, Programid,enddate  from pharmacymaster..pm_memberprograms pm
				join
				(
					SELECT * from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''    and ( aapquitdate is null or aapquitdate > @in_endDate)
			 
				) p
				on pm.pmid = p.pmid where (reports.dbo.mindate(enddate,aapquitdate) > @in_endDate or reports.dbo.mindate(enddate,aapquitdate) is null)   and startdate <= @in_endDate
					group by pm.pmid , Programid  ,enddate  
				)ch
				left outer join 
				(
					SELECT programid,description from pharmacymaster..pm_programs
				)
				pr
				on ch.programid = pr.programid
				group by ch.programid,description  

 ) ch
	   on su.Program = ch.Program    where su.Type = 'Previous'


select * from DashboardProgramCount order by Type desc,Program asc
 
END








GO
