USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_loadCHPHfile]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Bruce Grant
-- Create date: 4/30/2008
-- Description:	load a cardinal CHPH file
-- =============================================
CREATE PROCEDURE [dbo].[spud_loadCHPHfile] 
	-- Add the parameters for the stored procedure here
	@filename varchar(1000),
    @monthYear datetime 
AS
DECLARE @SQL varchar(2000)
IF NOT EXISTS(SELECT  filename FROM CHPH_1_loadlog WHERE filename = @filename)

BEGIN
	--SET NOCOUNT ON;
	set @SQL = "bulk insert udb_vw_chph_1 from '" + @filename;
	set @SQL = @SQL + "' with (fieldterminator=';', firstrow=2, "
	set @SQL = @SQL + "errorfile='" + @filename + ".err')"
	exec(@SQL)

	set @SQL = "insert into CHPH_1_loadlog (filename,date_loaded) values('" + @filename + "',getdate())"
	exec(@SQL)

END

GO
