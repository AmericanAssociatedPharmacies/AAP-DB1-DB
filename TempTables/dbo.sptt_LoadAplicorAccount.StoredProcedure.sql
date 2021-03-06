USE [TempTables]
GO
/****** Object:  StoredProcedure [dbo].[sptt_LoadAplicorAccount]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Joni Wilson
-- Create date: 06/11/2014
-- Description:	Load Aplicor Account table
-- =============================================
CREATE PROCEDURE [dbo].[sptt_LoadAplicorAccount] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
--FIRST STEP - LOAD Temp table with your queries
 -- Drop temp table if it exists
IF EXISTS(SELECT name FROM sys.tables
 WHERE name = 'tmp_Account')
BEGIN
DROP TABLE tmp_Account;
END
 
--Now Populate the temp table
SELECT * into tmp_Account from (
SELECT
            a.ACCOUNTID AS [SL Account No], a.ACCOUNT AS	[Account Name],
        CAST( '' as varchar(256)) AS PMID,
        CAST( '' as varchar(256)) AS [Account Code], 
       Vrindha_sandbox.dbo.RemovePhoneChar(a.MAINPHONE) AS [Phone] ,Vrindha_sandbox.dbo.RemovePhoneChar(a.ALTERNATEPHONE) AS [Phone2], 
       Vrindha_sandbox.dbo.RemovePhoneChar(a.FAX) AS [Fax] ,a.WEBADDRESS AS [Website],
       u.username    AS [Sales Person],
       a.TYPE AS [Type], a.SUBTYPE AS [Sub Type],a.STATUS AS [Status],
       a.BUSINESSDESCRIPTION  AS [Business Description], 
       ad.DESCRIPTION AS [Description],cast('True' as varchar(256) )AS [Primary Address], ad.ADDRESS1 AS [Street 1], 
        ad.ADDRESS2 AS [Street 2] ,
       ad.CITY AS [City] , ad.STATE AS [State], ad.POSTALCODE AS [Zip],   
       CAST( 'United States' as varchar(256)) AS [Country],
       ac.CORPORATENAME AS [Corporate Name], ac.TERRITORY AS [Sales Territory], ac.LASTSALESCALL AS [Last Sales Call], 
       ac.PVAAPIMOVOLAVG AS [Avg Comb Vol], ac.DEA AS [DEA], 
       ac.Storetype AS [MC Network], p.COMPLIANCEGUARDIAN AS [Featured Program Compliance Guardian],
       aap.AAPACCOUNTNO AS [AAP Account No], 
       api.APIACCOUNTNO AS [API Account No]
FROM Saleslogix_Prod.sysdba.ACCOUNT a
LEFT JOIN
(
	SELECT * FROM ( 
		SELECT * , Rank() OVER (Partition BY entityid order by isprimary desc) as Rank
	FROM ( SELECT * from Saleslogix_Prod.sysdba.address where isprimary in ('Y','T') or isprimary is null     ) pm 
	) tmp where   Rank = 1  
)ad
ON a.ACCOUNTID = ad.ENTITYID
LEFT JOIN 
     Saleslogix_Prod.sysdba.ACCOUNT2 ac
ON  a.ACCOUNTID = ac.ACCOUNTID
LEFT JOIN
     Saleslogix_Prod.sysdba.AAPACCOUNT aap 
ON a.ACCOUNTID = aap.ACCOUNTID
LEFT JOIN
     Saleslogix_Prod.sysdba.APIACCOUNT api
ON a.ACCOUNTID = api.ACCOUNTID
LEFT JOIN
     Saleslogix_Prod.sysdba.PROGRAMS p
ON a.ACCOUNTID = p.ACCOUNTID
LEFT JOIN
 
	 Saleslogix_Prod.sysdba.userinfo u 
ON u.userid = a.accountmanagerid
 
)tmp

--SECOND STEP - Remove Special Characters
	  -- Drop table it it exists
	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_Account_Command')
	 BEGIN
	  DROP TABLE tmp_Account_Command;
	 END
	  -- Create table to hold commands
	CREATE TABLE [dbo].[tmp_Account_Command](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[Command] [varchar](1500) NULL
	) ON [PRIMARY]
	 
	-- Create commands and load into table
	INSERT into  tmp_Account_Command 
	SELECT ' UPDATE tmp_Account SET [' + COLUMN_NAME + '] =
	 reports.dbo.RemoveSpecialChar( [' + COLUMN_NAME + ']) ' 
	FROM INFORMATION_SCHEMA.COLUMNS  WHERE TABLE_NAME = 'tmp_Account'  
 

	-- Execute each command on the table where the data is

	DECLARE @comm varchar(1500);
	DECLARE @RowCount INT;
	DECLARE @I INT;
	SET @I = 1;
	SET @RowCount = (SELECT COUNT(*) FROM  tmp_Account_Command);
	WHILE (@I <= @RowCount)
		BEGIN
			SET @comm = (select command from tmp_Account_Command where ID = @I);
			EXEC (@comm);
			--PRINT @I;
			SET @I = @I  + 1;
		END

-- Third step - Update PMID field 
 
   -- Update by AAP Account No
	UPDATE  t  set 
		t.pmid = sp.pmid  
	FROM tmp_Account   t 
	inner join 
		(
			select distinct  accountid,pmid,p.aapaccountno  from pharmacymaster..pm_pharmacy p
			join
			(
				select  aapaccountno ,accountid from Saleslogix_Prod.sysdba.AAPACCOUNT where aapaccountno is
				not null and aapaccountno !=''
			) s on p.aapaccountno = s.aapaccountno  
		) sp
	on t.[SL Account No] = sp.accountid   

	-- Update using API Account No 

	UPDATE  t  set 
		t.pmid = sp.pmid  
	FROM tmp_Account   t 
	inner join 
		(
			select distinct  accountid,pmid, p.apiaccountno  from pharmacymaster..pm_pharmacy p
			join
			(
				select  apiaccountno  ,accountid from Saleslogix_Prod.sysdba.APIACCOUNT where apiaccountno is
				not null and apiaccountno !=''
			) s on p.apiaccountno = s.apiaccountno  
		) sp
	on t.[SL Account No] = sp.accountid   where t.pmid ='' or t.pmid is null

  SELECT * from tmp_Account

END
GO
