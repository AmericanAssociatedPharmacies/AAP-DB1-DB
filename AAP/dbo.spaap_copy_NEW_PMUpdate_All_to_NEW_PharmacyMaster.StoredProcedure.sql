USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_copy_NEW_PMUpdate_All_to_NEW_PharmacyMaster]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Temporarily Copy the PMUpdate_All to PharmacyMaster
-- =============================================
CREATE PROCEDURE [dbo].[spaap_copy_NEW_PMUpdate_All_to_NEW_PharmacyMaster]

AS
	BEGIN
 
       IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'NEW_PharmacyMaster')
          DROP TABLE NEW_PharmacyMaster

	   SELECT * into NEW_PharmacyMaster from NEW_PMUpdate_All

       UPDATE NEW_PharmacyMaster set FedID = substring(FedID,1,2) + '-' + substring(FedID,3,7) where charindex('-',FedID) = 0; -- add in dash if missing in FedID

       -- THis is temporary remove once Betty gets the input changed 

--	update  aap..pharmacymaster set CAHStatus = 'ACTIVE' where apiaccountno = '32122997'
--	update  aap..pharmacymaster set CardinalDC = 'BOSTON' where apiaccountno = '32122997'
--	update  aap..pharmacymaster set PrimaryCAAccountNo = '632299' where apiaccountno = '32122997'

--
--
--	update  aap..pharmacymaster set CAHStatus = 'ACTIVE' where apiaccountno = '32196544'
--	update  aap..pharmacymaster set CardinalDC = 'BOSTON' where apiaccountno = '32196544'
--	update  aap..pharmacymaster set PrimaryCAAccountNo = '631541' where apiaccountno = '32196544'

    END









GO
