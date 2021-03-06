USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RxAlly]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/10/2010>
-- Description:	Create table for compare to get listing of RxAlly
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RxAlly]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

DECLARE @date varchar(100);
DECLARE @dateTable varchar(100);
DECLARE @SQL varchar(200);

SET @date =  GetDate();
SET @dateTable =  replace(@date,' ','');
SET @dateTable =  replace(@dateTable,':','');

SET @SQL = 'SELECT * into tmp_RxAlly' + @dateTable + ' from tmp_RxAlly';
EXEC(@SQL);

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_RxAlly')
	BEGIN
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_RxAlly_bkp')
		 BEGIN
          DROP TABLE tmp_RxAlly_bkp
         END
 
     SELECT * into  tmp_RxAlly_bkp from tmp_RxAlly
     DROP TABLE tmp_RxAlly
    END
   
-- We need to truncate report table from last run
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_RxAlly_Report')
          Truncate TABLE tmp_RxAlly_Report;

   SELECT * into tmp_RxAlly from (
      SELECT PMID,cast('' as varchar(6)) as IdentificationID,
	NCPDP,NPI,
	cast(OwnerName as varchar(30)) as [Owner/Officer] ,
	cast(AccountName as varchar(20)) as Name,
	cast(pharmacymaster.dbo.csfn_splitAddress(addr1,addr2,1) as varchar(7)) as StreetNumber,

	cast(pharmacymaster.dbo.csfn_splitAddress(addr1,addr2,2) as varchar(30)) as StreetName1,

	cast(pharmacymaster.dbo.csfn_splitAddress(addr1,addr2,3) as varchar(30)) as StreetName2,

	cast(City  as varchar(15))as CityName,
	State,
	SUBSTRING(Zip,1,5) as ZipCode,
	cast(email as varchar(30)) as [Owner/Officer email],
	cast(replace(Fax,'-','') as varchar(10)) as [Fax number] ,
    cast (Affiliate as varchar(30)) as Affiliate,
     cast('' as varchar(255)) as Notes

    -- !!!!!!!!!!!Uncomment this after testing!!!!!!!!!!!!!!!!!!!!!
	 from pharmacymaster..v_PM_AllWithAffiliates
   -- from reports..v_PM_Test
	--where ((affiliate != 'Pipco' 
	--and affiliate != 'PFOA'
	--and affiliate not like '%Keystone%' and affiliate not like '%LEGEND%' ) or affiliate is null)
	where aapaccountno is not null and aapquitdate is null
) ch
END








GO
