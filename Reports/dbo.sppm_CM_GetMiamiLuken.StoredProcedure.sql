USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_GetMiamiLuken]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/18/2015>
-- Description:	Get Managed Care
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_GetMiamiLuken]
 (@isMLHQOnly varchar(2)   ,@excludeML varchar(2))

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
 
 
SET @SQL = ' SELECT  * from pharmacymaster..v_Address_CommMaster where   pmid   in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44)';

 

IF(@isMLHQOnly = '1')
	BEGIN
       SET @SQL = ' SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-ML''';
	END 

PRINT @SQL
EXEC (@SQL);

END










GO
