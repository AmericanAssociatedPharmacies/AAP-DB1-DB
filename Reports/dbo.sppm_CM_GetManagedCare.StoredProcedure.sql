USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_GetManagedCare]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/18/2015>
-- Description:	Get Managed Care
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_GetManagedCare]
 (@isNPP varchar(2),@isBashasHQOnly varchar(2)   ,@excludeML varchar(2))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
DECLARE @SQL varchar(max)
SET @SQL = '';

DECLARE @incNPP varchar(max);
DECLARE @noNPP varchar(max);
DECLARE @excludeMLCode varchar(max); 

SET @excludeMLCode =  (select ExcludeMLCode from CommCode);

--SET @noNPP = ' ( ChainCode is not null and
-- mcquitdate is null and aapaccountno is not null and aapaccountno != '''' and aapquitdate is null) ';
SET @noNPP = (SELECT IncludeMCNoNPPCode from CommCode);

--SET @incNPP =  '(' + @noNPP + ' or isnpp = -1 ) ';
SET @incNPP =  (SELECT IncludeMCNPPCode from CommCode);


SET @SQL = 'SELECT  * from pharmacymaster..v_Address_CommMaster where ';

IF(@isNPP = '0')
	BEGIN
		SET @SQL = @SQL + @noNPP;
	END
ELSE
	BEGIN
		SET @SQL = @SQL + @incNPP;
	END

IF(@isBashasHQOnly = '1')
	BEGIN
       SET @SQL = @SQL + ' and pmid not in (select pmid from pharmacymaster..v_pm_allwithaffiliates  where groupno = ''11377'' )';

	   SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-BASHAS''';
	END 

PRINT @SQL
EXEC (@SQL);

END










GO
