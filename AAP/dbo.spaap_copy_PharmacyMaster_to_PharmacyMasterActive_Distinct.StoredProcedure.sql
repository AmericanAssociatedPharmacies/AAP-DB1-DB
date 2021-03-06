USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_copy_PharmacyMaster_to_PharmacyMasterActive_Distinct]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Temporarily Copy the PMUpdate_All to PharmacyMaster
-- =============================================
CREATE PROCEDURE [dbo].[spaap_copy_PharmacyMaster_to_PharmacyMasterActive_Distinct]

AS
	BEGIN
 
       IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PharmacyMasterActive_Distinct')
          DROP TABLE PharmacyMasterActive_Distinct

	   SELECT * into PharmacyMasterActive_Distinct from
		(
			SELECT * from PharmacyMaster where status = 'active'  and
			 (
				 (  businessclass != 'SDFT'   or businessclass is null) 
					 and ( Territory != 'XX' or Territory is null) 
					 and ((apiaccountNo !=  '_CREATIVE' and apiaccountNo != 'SECRETARY' and apiaccountNo != '00APSLLC' ) or apiaccountNo is null) 
					and (udnonpharmacy != 'C' or udnonpharmacy is null)
			 )
		) tmp

    END









GO
