USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_auditMemberProgramsEndDate]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Report Card Volume and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_auditMemberProgramsEndDate]
 (@textToFind varchar(max),@DBName varchar(max))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	SELECT Description,p.PMID,p.aapquitdate as [AAP Quit Date],pm.startdate as [Program Start Date],pm.enddate  as [Program End Date] from pharmacymaster..pm_pharmacy p
	join
	(
	 SELECT pmid,startdate, enddate,programid  from pharmacymaster..pm_memberprograms 
		WHERE enddate is null  
	) pm
	on p.pmid = pm.pmid
	join
	(
	SELECT description,programid from pharmacymaster..pm_programs
	)pp
	on pm.programid = pp.programid
	WHERE  aapquitdate is not null and description != 'ESI'
	GROUP BY description,p.pmid,p.aapquitdate,pm.startdate,pm.enddate 

END










GO
