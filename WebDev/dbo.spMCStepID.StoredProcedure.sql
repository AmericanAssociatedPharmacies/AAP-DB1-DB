USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCStepID]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spMCStepID]
(
	@pmid int
)
AS
BEGIN
	select ProgramStepID from pharmacymaster..PM_ProgramStepMember where programid=183 and PMID=@pmid
END
GO
