USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [Staging].[usp_PM_Pharmacy_BulkInsert]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_PM_Pharmacy_BulkInsert]

AS


SET NOCOUNT ON;

BEGIN

	TRUNCATE TABLE PharmacyMaster.Staging.PM_Pharmacy;

	
	BULK INSERT PharmacyMaster.Staging.PM_Pharmacy
		FROM '\\fs1.aap.local\Server\IT Department\Dynamics\PharmacyMasterDB1\PharmacyMaster.dat'
		WITH (
				DATAFILETYPE = 'char'
				, FIELDTERMINATOR = '|'
				, ROWTERMINATOR = '\n'  
			);





END
GO
