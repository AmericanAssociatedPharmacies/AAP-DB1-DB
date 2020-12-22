USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_RelayLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spud_RelayLoad] 

	--@filename nvarchar(200)--will be file loaded from the site.

AS
DECLARE @SQL varchar(2000)
BEGIN
	
	set @SQL = 'bulk insert RelayData from ''G:\gross_margin_project\Gross Margin Reports\2008\4Q\Caremark90_DEC\Caremark90_DEC_4Q08_ALL.txt' ; --@filename;
	set @SQL = @SQL + ''' with (fieldterminator='';'', firstrow=2, ';
	--set @SQL = @SQL + 'errorfile=''C:\Documents and Settings\jnarayanan\My Documents\Visual Studio 2008\WebSites\Intranet3\Docs\' + @filename + '.err'')';
	SET NOCOUNT ON;
	exec(@SQL);
	SET NOCOUNT OFF
	

END
GO
