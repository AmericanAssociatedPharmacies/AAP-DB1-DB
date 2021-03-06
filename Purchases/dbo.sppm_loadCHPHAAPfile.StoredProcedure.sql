USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadCHPHAAPfile]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		Joni Wilson
-- Create date: 6/17/2010
-- Description:	load a  cardinal CHPH file
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadCHPHAAPfile] 
	-- Add the parameters for the stored procedure here
	@filename varchar(1000),
    @monthYear datetime 
AS

SET NOCOUNT ON;

DECLARE @SQL varchar(2000)

IF NOT EXISTS(SELECT  filename 
				FROM  CHPH_loadlog 
				WHERE filename = @filename +"_AAP"
				)

BEGIN
	--SET NOCOUNT ON;
	set @SQL = "bulk insert dbo.v_chph_load_AAP from '" + @filename;
	set @SQL = @SQL + "' with (fieldterminator=';', firstrow=2, "
	set @SQL = @SQL + "errorfile='" + @filename + ".err')"
	exec(@SQL)

	set @SQL = "insert into CHPH_loadlog (filename,date_loaded) values('" + @filename + "_AAP',getdate())"
	exec(@SQL)


END


GO
