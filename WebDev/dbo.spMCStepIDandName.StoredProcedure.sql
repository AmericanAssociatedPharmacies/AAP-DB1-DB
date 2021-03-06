USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCStepIDandName]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spMCStepIDandName]
(
	@pmid int
)
AS
BEGIN
	select
	m.ProgramStepID, p.StepName
	from pharmacymaster..pm_programstepmember m 
	left join pharmacymaster..pm_programstep p on p.programid=m.programid and p.programstepid=m.programstepid
	where m.programid = 183
	and m.PMID = @PMID
END
GO
