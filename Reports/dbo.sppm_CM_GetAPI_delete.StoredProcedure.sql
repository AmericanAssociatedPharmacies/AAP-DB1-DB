USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_GetAPI_delete]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/11/2015>
-- Description:	Get valid Programs for Communications
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_GetAPI_delete] 
(@affiliates varchar(500),@programs varchar(500) ,@excludeMC varchar(2) ,@excludeML varchar(2))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @SQL varchar(max)
SET @SQL = '';

DECLARE @affCode varchar(max);
DECLARE @proCode varchar(max);
DECLARE @excludeMCCode varchar(max);  
DECLARE @excludeMLCode varchar(max); 



SET @affCode = ' select pmid from  pharmacymaster..pm_groups_xref   where group_id in (' + @affiliates  + ')';
 
SET @proCode =  ' select pmid from pharmacymaster..PM_memberprograms   where programid in (' + @programs  + ') '+
' and startdate is not null and enddate is null ';

SET @excludeMCCode =  (select ExcludeMCCode from CommCode);

SET @excludeMLCode =  (select ExcludeMLCode from CommCode);

-- Now start code for query
SET @SQL = ' SELECT  * from pharmacymaster..v_Address_CommMaster where APIAccountNo is not null and ' +
' APIAccountNo != '''' and 	APIStatus in(''Active'',''Suspended'') and apiaccountno not like ''%-%''  ';

IF(@excludeMC != '0')
	BEGIN
		SET @SQL = @SQL + @excludeMCCode;
	END 

IF(@excludeML != '0')
	BEGIN
		SET @SQL = @SQL + @excludeMLCode;
	END 

-- '0' indciates no affiliates were selected
-- This addidtion to the SQL will pull affiliates and no programs
IF(@affiliates != '0' and @programs = '0')
	BEGIN
		SET @SQL = @SQL + ' and pmid in (' +  @affCode + ')';
	END 
--This will be used when there are programs and no affiiates
IF(@affiliates = '0' and @programs != '0')
	BEGIN
		SET @SQL = @SQL +  ' and pmid in (' + @proCode + ')';
	END 
-- Both Affiliates and Programs were selected
IF(@affiliates != '0' and @programs != '0')
	BEGIN
		SET @SQL = @SQL + ' and pmid in (' + @affCode + ' UNION ' + @proCode + ')';
	END 

 
EXEC (@SQL)
END
 









GO
