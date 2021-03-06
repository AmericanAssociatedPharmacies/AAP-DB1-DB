USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_LoadOIG_SAM_List]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Chandni Lyla
-- Create date: 7/12/2016
-- Description:Load OIG and SAM Lists to Tables
-- =============================================
CREATE PROCEDURE [dbo].[sp_LoadOIG_SAM_List] 	
@OIGfileName nvarchar(100),
@SAMfileName nvarchar(100)

AS
BEGIN

DECLARE @sql NVARCHAR(4000)
DECLARE @delNPI BINARY
DECLARE @delCAGE BINARY

--Load to OIG Staging Table

select LASTNAME,FIRSTNAME,MIDDLENAME,BUSNAME,GENERAL,SPECIALTY,UPIN,NPI,DOB,ADDRESS,CITY,STATE,ZIP,EXCLTYPE,EXCLDATE,REINDATE,WAIVERDATE,WVRSTATE into #CA_OIG_Staging from CA_OIG_TEMP where 1=2

set @sql = 'BULK INSERT #CA_OIG_Staging FROM ''' + @OIGfileName + ''' WITH ( FIELDTERMINATOR ='','', ROWTERMINATOR =''\n'',FIRSTROW=2,KEEPNULLS)';
EXEC(@sql);

--Load to SAM Staging Table

select Classification,Name,Prefix,FirstName,MiddleName,LastName,Suffix,Address1,Address2,Address3,Address4,City,StateOrProvince,Country,ZipCode,DUNS,ExclusionProgram,ExcludingAgency,CTCode,ExclusionType,AdditionalComments,ActiveDate,TerminationDate,RecordStatus,CrossReference,SAMNumber,CAGE,NPI into #CA_SAM_Staging from CA_SAM_TEMP where 1=2

--Checking if CAGE,NPI columns exist(CAGE added in July 2015,NPI added in November 2015)

  IF convert(int,LEFT(RIGHT(@SAMfileName,9),2))<7

   Begin
     alter table #CA_SAM_Staging drop column CAGE
	 alter table #CA_SAM_Staging drop column NPI
	 set  @delNPI=1
	 set @delCAGE=1
   End

  ELSE

    Begin

	  IF convert(int,LEFT(RIGHT(@SAMfileName,9),2))<11
	      Begin
		   alter table #CA_SAM_Staging drop column NPI
		   set @delNPI=1
		  End
    End

set @sql = 'BULK INSERT #CA_SAM_Staging FROM ''' + @SAMfileName + ''' WITH ( FIELDTERMINATOR ='','', ROWTERMINATOR =''\n'',FIRSTROW=2,KEEPNULLS )';
--EXEC(@sql);

--Add back CAGE,NPI Columns to SAM Staging table
if(@delCAGE=1)
  alter table #CA_SAM_Staging add CAGE nvarchar(256)
if(@delNPI=1)
 alter table #CA_SAM_Staging add NPI nvarchar(64)
 

--Populate CA_OIG_TEMP,CA_SAM_TEMP

Truncate table CA_OIG_TEMP
insert into CA_OIG_TEMP select LASTNAME,FIRSTNAME,MIDDLENAME,BUSNAME,GENERAL,SPECIALTY,UPIN,NPI,DOB,ADDRESS,CITY,STATE,ZIP,EXCLTYPE,EXCLDATE,REINDATE,WAIVERDATE,WVRSTATE,getdate(),getdate() from #CA_OIG_Staging 

--Truncate table CA_SAM_TEMP
--insert into CA_SAM_TEMP select Classification,Name,Prefix,FirstName,MiddleName,LastName,Suffix,Address1,Address2,Address3,Address4,City,StateOrProvince,Country,ZipCode,DUNS,ExclusionProgram,ExcludingAgency,CTCode,ExclusionType,AdditionalComments,ActiveDate,TerminationDate,RecordStatus,CrossReference,SAMNumber,getdate(),getdate(),CAGE,NPI from #CA_SAM_Staging 


END




GO
