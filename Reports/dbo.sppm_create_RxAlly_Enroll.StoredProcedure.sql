USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RxAlly_Enroll]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/10/2010>
-- Description:	Create table for compare to get listing of RxAlly
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RxAlly_Enroll]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  --TODO!!!!!!!!!!********** Uncomment pm_memberprograms below when going LIVE
	   --- Drop the previous runs table

DECLARE @date varchar(100);
DECLARE @dateTable varchar(100);
DECLARE @SQL varchar(200);

SET @date =  GetDate();
SET @dateTable =  replace(@date,' ','');
SET @dateTable =  replace(@dateTable,':','');

SET @SQL = 'SELECT * into tmp_RxAlly_Enroll' + @dateTable + ' from tmp_RxAlly_Enroll';
EXEC(@SQL);

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_RxAlly_Enroll')
	BEGIN
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RxAlly_Enroll_bkp')
		 BEGIN
          DROP TABLE tmp_RxAlly_Enroll_bkp
         END
 
     SELECT * into  tmp_RxAlly_Enroll_bkp from tmp_RxAlly_Enroll
     DROP TABLE tmp_RxAlly_Enroll
    END
   
-- We need to truncate report table from last run
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_RxAlly_Enroll_Report')
          Truncate TABLE tmp_RxAlly_Enroll_Report;

   SELECT * into tmp_RxAlly_Enroll from (
      SELECT v.PMID,AccountName,NCPDP,OwnerName,Email,Phone,Fax,'' as OtherInformation,StartDate from pharmacymaster..v_PM_AllWithAffiliates  v
	join
	(
	 
		SELECT * from pharmacymaster..pm_memberprograms where programid = 188
			--SELECT * from memberprograms_test where programid = 188
		and enddate is null 
	) m
	on v.PMID = m.PMID 
) ch
END








GO
