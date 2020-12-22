USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_RxAlly]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Select statement that is called after creating table for RxAlly
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_RxAlly]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
	DECLARE @SQL varchar(max);

--      IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'tmp_RxAllyNotes')
--          DROP TABLE tmp_RxAllyNotes;
--
--	SET @SQL = 'SELECT * into tmp_RxAllyNotes from tmp_RxAlly';
--	EXEC(@SQL);
    SET @SQL = 'SELECT   IdentificationID,NCPDP,NPI,[Owner/Officer] ,Name,StreetNumber,StreetName1,StreetName2,CityName,State,ZipCode,[Owner/Officer email],[Fax number] ,Affiliate,Notes '+
		' from tmp_RxAlly_Report';
    EXEC(@SQL);
 

END










GO
