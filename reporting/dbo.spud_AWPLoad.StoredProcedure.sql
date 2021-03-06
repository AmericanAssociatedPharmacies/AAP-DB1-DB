USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_AWPLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spud_AWPLoad] 
	-- in this case the filename = the table name
	@strContractRate nvarchar(5),
	@strDFee nvarchar(10),
	@filename nvarchar(200)

AS
DECLARE @SQL varchar(2000)
BEGIN
	
	set @SQL = 'bulk insert AWPSettle from ''C:\Documents and Settings\jnarayanan\My Documents\Visual Studio 2008\WebSites\Intranet3\Docs\' + @filename;
	set @SQL = @SQL + ''' with (fieldterminator='';'', firstrow=2, ';
	set @SQL = @SQL + 'errorfile=''C:\Documents and Settings\jnarayanan\My Documents\Visual Studio 2008\WebSites\Intranet3\Docs\' + @filename + '.err'')';
	SET NOCOUNT ON;
	exec(@SQL);
	SET NOCOUNT OFF
	

END
GO
