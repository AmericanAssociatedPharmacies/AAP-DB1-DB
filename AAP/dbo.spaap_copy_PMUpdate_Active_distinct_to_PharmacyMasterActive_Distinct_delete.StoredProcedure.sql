USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_copy_PMUpdate_Active_distinct_to_PharmacyMasterActive_Distinct_delete]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Temporarily Copy the PMUpdate_All to PharmacyMaster
-- =============================================
Create PROCEDURE [dbo].[spaap_copy_PMUpdate_Active_distinct_to_PharmacyMasterActive_Distinct_delete]

AS
	BEGIN
 
       IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PharmacyMasterActive_Distinct')
          DROP TABLE PharmacyMasterActive_Distinct

	   Select * into PharmacyMasterActive_Distinct from PMUpdate_Active_distinct

    END









GO
