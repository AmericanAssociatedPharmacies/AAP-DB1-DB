USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[fnIsInProgram]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnIsInProgram]
(
	@PMID int
	,@ProgramID int
) RETURNS int
as
begin
return case when exists (select 1 from pm_memberprograms where programid=@ProgramID and pmid=@PMID and enddate is null)
			then 1 else 0 end
end
GO
