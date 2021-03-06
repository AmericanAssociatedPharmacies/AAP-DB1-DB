USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_spSpecialty]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spMCenter_spSpecialty]
(
	@PMID int
)
as
-- Message Center return 'result' field, value 1 to show message else 0
-- Specialty Pharmacy participants 11/14
BEGIN
select isnull(isInProgram,0) as result from v_web_programinfo where pmid=@PMID and ProgramID=183
END
GO
