USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadCHPHAAPfileTest]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 6/17/2010
-- Description:	load a  cardinal Test CHPH file
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadCHPHAAPfileTest] 
	-- Add the parameters for the stored procedure here
	@filename varchar(1000),
    @monthYear datetime 
AS
DECLARE @SQL varchar(2000)
 

BEGIN
	--SET NOCOUNT ON;
	set @SQL = "bulk insert v_chph_newcol_load_AAP from '" + @filename;
	set @SQL = @SQL + "' with (fieldterminator=';', firstrow=2, "
	set @SQL = @SQL + "errorfile='" + @filename + ".err')"
	exec(@SQL)
 

END

GO
