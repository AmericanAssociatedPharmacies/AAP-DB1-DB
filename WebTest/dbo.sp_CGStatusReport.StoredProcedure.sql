USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_CGStatusReport]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vrindha Nair
-- Create date: 10/05/2015
-- Description:	Compliance Guardian Admin Report:CG Status
-- =============================================
CREATE PROCEDURE [dbo].[sp_CGStatusReport]
	(@getme varchar(50), @stores varchar(15) )
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   Declare @value nvarchar(2) 
   Declare @value1 NVARCHAR(2)
    
   SET @value = '1'
   SET @value1 = '0'

-- Compliant

IF @getme = 'Managed Care' AND @stores = 'Compliant'
  BEGIN
            SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreManagedCare = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
            UNION
			SELECT '1234567' as NCPDP, '' AS TM, 'United Drugs' AS [StoreName], 'AZ' AS State, '1' AS EmployeeCheckListStatus, '1' AS EmployeesWithOutAliasNames, '' AS EmployeeLastModifiedDate,
			'' AS [EmployeeLastCreatedDate], '1' AS HIPAAManualStatus, '1' AS FWAManualStatus, '1' AS HIPAATrainingStatus, '1' AS HIPAATrainedEmployees, '1' AS FWATrainingStatus,
			'1' AS FWATrainedEmployees, '1' AS AttestationStatus, '' AS [AttestationDate]
			ORDER BY AttestationDate DESC
  END

IF @getme = 'Non Managed Care' AND @stores = 'Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNonManagedCare = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
 END

IF @getme = 'Compliance Guardian' AND @stores = 'Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreComplianceGuardian = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
            UNION
			SELECT '1234567' as NCPDP, '' AS TM, 'United Drugs' AS [StoreName], 'AZ' AS State, '1' AS EmployeeCheckListStatus, '1' AS EmployeesWithOutAliasNames, '' AS EmployeeLastModifiedDate,
			'' AS [EmployeeLastCreatedDate], '1' AS HIPAAManualStatus, '1' AS FWAManualStatus, '1' AS HIPAATrainingStatus, '1' AS HIPAATrainedEmployees, '1' AS FWATrainingStatus,
			'1' AS FWATrainedEmployees, '1' AS AttestationStatus, '' AS [AttestationDate]
			ORDER BY AttestationDate DESC
  END

IF @getme = 'NPP' AND @stores = 'Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNPP = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
  END

-- NonCompliant

IF @getme = 'Managed Care' AND @stores = 'Non Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreManagedCare = @value AND
			(EmployeeCheckListStatus = @value1 AND HIPAAManualStatus = @value1 AND FWAManualStatus = @value1 AND HIPAATrainingStatus = @value1 AND FWATrainingStatus = @value1 AND AttestationStatus = @value1)
  END

IF @getme = 'Non Managed Care' AND @stores = 'Non Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNonManagedCare = @value AND
			(EmployeeCheckListStatus = @value1 AND HIPAAManualStatus = @value1 AND FWAManualStatus = @value1 AND HIPAATrainingStatus = @value1 AND FWATrainingStatus = @value1 AND AttestationStatus = @value1)
  END


IF @getme = 'Compliance Guardian' AND @stores = 'Non Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreComplianceGuardian = @value AND
			(EmployeeCheckListStatus = @value1 AND HIPAAManualStatus = @value1 AND FWAManualStatus = @value1 AND HIPAATrainingStatus = @value1 AND FWATrainingStatus = @value1 AND AttestationStatus = @value1)
  END

IF @getme = 'NPP' AND @stores = 'Non Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNPP = @value AND
			(EmployeeCheckListStatus = @value1 AND HIPAAManualStatus = @value1 AND FWAManualStatus = @value1 AND HIPAATrainingStatus = @value1 AND FWATrainingStatus = @value1 AND AttestationStatus = @value1)
  END

-- Partially Compliant

IF @getme = 'Managed Care' AND @stores = 'Partially Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreManagedCare = @value AND
			(EmployeeCheckListStatus = @value OR  HIPAAManualStatus = @value OR FWAManualStatus = @value OR HIPAATrainingStatus = @value OR FWATrainingStatus = @value OR AttestationStatus = @value)
			EXCEPT
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreManagedCare = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
  END

IF @getme = 'Non Managed Care' AND @stores = 'Partially Compliant'
  BEGIN
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNonManagedCare = @value   AND
			(EmployeeCheckListStatus = @value OR  HIPAAManualStatus = @value OR FWAManualStatus = @value OR HIPAATrainingStatus = @value OR FWATrainingStatus = @value OR AttestationStatus = @value)
			EXCEPT
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNonManagedCare = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
  END


IF @getme = 'Compliance Guardian' AND @stores = 'Partially Compliant'
  BEGIN
			SELECT   NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreComplianceGuardian = @value   AND
		    (EmployeeCheckListStatus = @value OR  HIPAAManualStatus = @value OR FWAManualStatus = @value OR HIPAATrainingStatus = @value OR FWATrainingStatus = @value OR AttestationStatus = @value)
			EXCEPT
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreComplianceGuardian = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
  END

IF @getme = 'NPP' AND @stores = 'Partially Compliant'
  BEGIN
			SELECT   NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNPP = @value   AND
			(EmployeeCheckListStatus = @value OR  HIPAAManualStatus = @value OR FWAManualStatus = @value OR HIPAATrainingStatus = @value OR FWATrainingStatus = @value OR AttestationStatus = @value)
			EXCEPT
			SELECT  NCPDP, TM, AccountName AS [StoreName], State, EmployeeCheckListStatus, EmployeesWithOutAliasNames, convert(varchar, EmployeeLastModifiedDate, 101)  AS [EmployeeLastModifiedDate],
			convert(varchar, EmployeeLastCreatedDate, 101) AS [EmployeeLastCreatedDate], HIPAAManualStatus, FWAManualStatus, HIPAATrainingStatus, HIPAATrainedEmployees, FWATrainingStatus,
			FWATrainedEmployees, AttestationStatus, convert(varchar, AttestationDate, 101) AS [AttestationDate]
			FROM dbo.v_CA_StoreStatus WHERE  IsStoreNPP = @value AND
			(EmployeeCheckListStatus = @value AND HIPAAManualStatus = @value AND FWAManualStatus = @value AND HIPAATrainingStatus = @value AND FWATrainingStatus = @value AND AttestationStatus = @value)
  END

END
GO
