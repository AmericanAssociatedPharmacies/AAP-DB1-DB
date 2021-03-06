USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_compare_APIBIA_DEABIA]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and Truncate AddressMaster to recreate
-- Modified : Added the Replace T with blank when comparing ASW field 02/11/2011
-- =============================================
CREATE PROCEDURE [dbo].[sppm_compare_APIBIA_DEABIA]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_CompareAPIBIA')
          DROP TABLE tmp_CompareAPIBIA
 

SELECT  * into tmp_CompareAPIBIA from (
	SELECT PMID,AccountName,AAPAccountNo,AAPEffectiveDate,AAPQuitDate,
		APIAccountno,APIStatus,DEA from pharmacymaster..pm_pharmacy where dea like '%BIA%' and apiaccountno not like '%BIA%' 
		and apiaccountno is not null and apiaccountno != '' and
		(apistatus = 'Active' or apistatus = 'Suspended')
)tmp

SELECT  * from tmp_CompareAPIBIA 
END








GO
