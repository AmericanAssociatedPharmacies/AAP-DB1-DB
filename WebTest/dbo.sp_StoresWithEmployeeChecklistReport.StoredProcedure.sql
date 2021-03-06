USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_StoresWithEmployeeChecklistReport]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vrindha Nair
-- Create date: 09/16/2015
-- Description:	Compliance Guardian Admin Report:Employee Checlist Status
-- =============================================
CREATE PROCEDURE [dbo].[sp_StoresWithEmployeeChecklistReport]
	(@getme varchar(50), @stores varchar(15) )
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Declare @value nvarchar(2) 
    
   SET @value = '1'

-- GenerateStoresWithEmployeeChecklist

IF @getme = 'Managed Care' AND @stores = 'With'
  BEGIN
           SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax, Employees, convert(varchar, EmployeeLastModifiedDate, 101)  AS [LastModifiedDate],
           convert(varchar, EmployeeLastCreatedDate, 101) AS [LastAddedDate], convert(varchar, ExclusionLastFoundDate, 101) AS [LastExclusionFoundDate], Exclusions 
           FROM dbo.v_CA_StoreStatus WHERE Employees > 0 AND IsStoreManagedCare = @value 
           UNION
		   SELECT '1234567' as NCPDP,'' AS TM, 'United Drugs' AS [StoreName], 'AZ' AS State, '302-678-1179' AS Phone, 'ComplianceGUARDIAN@uniteddrugs.com' AS Email, '' AS Fax, 
		   '56' AS Employees, '' AS [LastModifiedDate],'' AS [LastAddedDate], '' AS [LastExclusionFoundDate], '0' AS Exclusions 
		   ORDER BY Employees ASC
  END

IF @getme = 'Non Managed Care' AND @stores = 'With'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax, Employees, convert(varchar, EmployeeLastModifiedDate, 101)  AS [LastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [LastAddedDate], convert(varchar, ExclusionLastFoundDate, 101) AS [LastExclusionFoundDate], Exclusions 
			FROM dbo.v_CA_StoreStatus WHERE Employees > 0 AND IsStoreNonManagedCare = @value
 END

IF @getme = 'AAP' AND @stores = 'With'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax, Employees, convert(varchar, EmployeeLastModifiedDate, 101)  AS [LastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [LastAddedDate], convert(varchar, ExclusionLastFoundDate, 101) AS [LastExclusionFoundDate], Exclusions 
			FROM dbo.v_CA_StoreStatus WHERE Employees > 0 AND IsStoreAAP = @value
  END

IF @getme = 'Compliance Guardian' AND @stores = 'With'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax, Employees, convert(varchar, EmployeeLastModifiedDate, 101)  AS [LastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [LastAddedDate], convert(varchar, ExclusionLastFoundDate, 101) AS [LastExclusionFoundDate], Exclusions 
			FROM dbo.v_CA_StoreStatus WHERE Employees > 0 AND IsStoreComplianceGuardian = @value
			UNION
		    SELECT '1234567' as NCPDP,'' AS TM, 'United Drugs' AS [StoreName], 'AZ' AS State, '302-678-1179' AS Phone, 'ComplianceGUARDIAN@uniteddrugs.com' AS Email, '' AS Fax, 
		    '56' AS Employees, '' AS [LastModifiedDate],'' AS [LastAddedDate], '' AS [LastExclusionFoundDate], '0' AS Exclusions 
		    ORDER BY Employees ASC
  END

IF @getme = 'NPP' AND @stores = 'With'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax, Employees, convert(varchar, EmployeeLastModifiedDate, 101)  AS [LastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [LastAddedDate], convert(varchar, ExclusionLastFoundDate, 101) AS [LastExclusionFoundDate], Exclusions 
			FROM dbo.v_CA_StoreStatus WHERE Employees > 0 AND IsStoreNPP = @value
  END

-- GenerateStoresWithoutEmployeeChecklist

IF @getme = 'Managed Care' AND @stores = 'Without'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax
			FROM dbo.v_CA_StoreStatus WHERE (Employees = 0 or Employees is NULL) AND IsStoreManagedCare = @value
  END

IF @getme = 'Non Managed Care' AND @stores = 'Without'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax
 			FROM dbo.v_CA_StoreStatus WHERE(Employees = 0 or Employees is NULL) AND IsStoreNonManagedCare = @value
  END

IF @getme = 'AAP' AND @stores = 'Without'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax
			FROM dbo.v_CA_StoreStatus WHERE (Employees = 0 or Employees is NULL) AND IsStoreAAP = @value
  END

IF @getme = 'Compliance Guardian' AND @stores = 'Without'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax
			FROM dbo.v_CA_StoreStatus WHERE (Employees = 0 or Employees is NULL) AND IsStoreComplianceGuardian = @value
  END

IF @getme = 'NPP' AND @stores = 'Without'
  BEGIN
			SELECT NCPDP, TM, AccountName AS [StoreName], State, Phone, Email, Fax
			FROM dbo.v_CA_StoreStatus WHERE (Employees = 0 or Employees is NULL) AND IsStoreNPP = @value
  END

END
GO
