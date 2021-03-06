USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_LookupOIG_SAM_List]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =========================================================
-- Author:	Chandni Lyla
-- Create date: 7/14/2016
-- Description:Lookup Employee names with  OIG and SAM Lists 
-- =========================================================
CREATE PROCEDURE [dbo].[sp_LookupOIG_SAM_List] 	
@NCPDP nvarchar(7),
@Month varchar(2),
@Year varchar(4)

AS
BEGIN

declare @PMID varchar(10),@accountname varchar(65)
set @PMID=(select pmid from pharmacymaster..pm_pharmacy where ncpdp=@NCPDP)
set @accountname=(select accountname from pharmacymaster..pm_pharmacy where ncpdp=@NCPDP)


TRUNCATE TABLE  CA_StoreEmployee_Temp

--Get the month as next month and year as next year(year as next year if selected month==December)
--Procedure compares employees whose creation date is less than 1st of next month with OIG and SAM lists

declare @nextmonth varchar(2),@nextyear varchar(4)
declare @month_number int,@year_number int

set @month_number=Convert(int,@month)
set @year_number=convert(int,@Year)

if (@month_number <12)
 set @month_number=@month_number+1

else
 begin
    set @month_number=1
	set @year_number=@year_number+1
  end

 set @nextmonth= Convert(varchar(5),@month_number)
 set @nextyear=Convert(varchar(5),@year_number)

--Populating temp table with Employees of the selected Pharmacy

INSERT INTO CA_StoreEmployee_Temp select Username,NCPDP,PMID,FirstName,MiddleName,LastName,ModifiedDate,CreatedDate,IsActive,Email,InActiveDate,EmployeeNameType,EmployeeType,IsHIPPATrained,IsFWATrained,0,0,Datename(MONTH,Convert(datetime,@Month+'-01-2000')),@Year,'','','','','','','',''
from WebDev..CA_StoreEmployee where NCPDP=@NCPDP and createddate< Convert(datetime,@nextmonth+'-01-'+@nextyear) and (isActive=1 or inactivedate>=Convert(datetime,@nextmonth+'-01-'+@nextyear))order by username 
--Clean FirstName,MiddleName,LastName Columns of SamTable to remove ""

UPDATE CA_SAM_TEMP SET FirstName = REPLACE(FirstName, '""', '')

UPDATE CA_SAM_TEMP SET MiddleName = REPLACE(MiddleName, '""', '')

UPDATE CA_SAM_TEMP SET LastName = REPLACE(LastName, '""', '')


--Lookup with OIG List--

--FirstName Strategy
UPDATE CA_StoreEmployee_Temp SET IsOIGListed=1 where 
FirstName in (select emp.FirstName from CA_StoreEmployee_Temp emp inner join CA_OIG_TEMP oig on emp.FirstName=oig.FirstName where emp.FirstName !='')

--MiddleName Strategy
UPDATE CA_StoreEmployee_Temp SET IsOIGListed=1 where 
MiddleName in (select emp.MiddleName from CA_StoreEmployee_Temp emp inner join CA_OIG_TEMP oig on emp.MiddleName=oig.MiddleName where emp.MiddleName !='')

--LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsOIGListed=1 where 
LastName in (select emp.LastName from CA_StoreEmployee_Temp emp inner join CA_OIG_TEMP oig on emp.LastName=oig.LastName where emp.LastName !='') 

--FirstName_LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsOIGListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_OIG_TEMP oig on emp.FirstName=oig.FirstName and emp.LastName=oig.LastName where (emp.FirstName!=''or emp.LastName!=''))

--FirstName_MiddleName Strategy
UPDATE CA_StoreEmployee_Temp SET IsOIGListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_OIG_TEMP oig on emp.FirstName=oig.FirstName and emp.MiddleName=oig.MiddleName where (emp.FirstName!=''or emp.MiddleName!=''))

--FirstName_MiddleName_LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsOIGListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_OIG_TEMP oig on emp.FirstName=oig.FirstName and emp.MiddleName=oig.MiddleName and emp.LastName=oig.LastName where (emp.FirstName!=''or emp.MiddleName!='' or emp.LastName!=''))

--MiddleName_LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsOIGListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_OIG_TEMP oig on emp.MiddleName=oig.MiddleName and emp.LastName=oig.LastName where (emp.MiddleName!='' or emp.LastName!=''))


--Lookup with SAM List--


--FirstName Strategy
UPDATE CA_StoreEmployee_Temp SET IsSAMListed=1 where 
FirstName in (select emp.FirstName from CA_StoreEmployee_Temp emp inner join CA_SAM_TEMP sam on emp.FirstName=sam.FirstName where emp.FirstName !='')

--MiddleName Strategy
UPDATE CA_StoreEmployee_Temp SET IsSAMListed=1 where 
MiddleName in (select emp.MiddleName from CA_StoreEmployee_Temp emp inner join CA_SAM_TEMP sam on emp.MiddleName=sam.MiddleName where emp.MiddleName !='')

--LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsSAMListed=1 where 
LastName in (select emp.LastName from CA_StoreEmployee_Temp emp inner join CA_SAM_TEMP sam on emp.LastName=sam.LastName where emp.LastName !='')

--FirstName_LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsSAMListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_SAM_TEMP sam on emp.FirstName=sam.FirstName and emp.LastName=sam.LastName where (emp.FirstName!=''or emp.LastName!=''))

--FirstName_MiddleName Strategy
UPDATE CA_StoreEmployee_Temp SET IsSAMListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_SAM_TEMP sam on emp.FirstName=sam.FirstName and emp.MiddleName=sam.MiddleName where (emp.FirstName!=''or emp.MiddleName!=''))

--FirstName_MiddleName_LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsSAMListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_SAM_TEMP sam on emp.FirstName=sam.FirstName and emp.MiddleName=sam.MiddleName and emp.LastName=sam.LastName where (emp.FirstName!=''or emp.MiddleName!='' or emp.LastName!=''))

--MiddleName_LastName Strategy
UPDATE CA_StoreEmployee_Temp SET IsSAMListed=1 where 
ID in (select emp.ID from CA_StoreEmployee_Temp emp inner join CA_SAM_TEMP sam on emp.MiddleName=sam.MiddleName and emp.LastName=sam.LastName where(emp.MiddleName!='' or emp.LastName!=''))

--Update Addresses

update CA_StoreEmployee_Temp  set address = ISNULL(t2.address,CA_StoreEmployee_Temp.address),address2 = ISNULL(t2.address2,CA_StoreEmployee_Temp.address2),city = ISNULL(t2.city,CA_StoreEmployee_Temp.city),state = ISNULL(t2.state,CA_StoreEmployee_Temp.state),zip = ISNULL(t2.zip,CA_StoreEmployee_Temp.zip),
phone = ISNULL(t2.phone,CA_StoreEmployee_Temp.phone),fax = ISNULL(t2.fax,CA_StoreEmployee_Temp.fax)from  pharmacymaster..pm_addressmaster t2 where t2.pmid =@PMID

--update accountname
update CA_StoreEmployee_Temp  set accountname = @accountname

END


GO
