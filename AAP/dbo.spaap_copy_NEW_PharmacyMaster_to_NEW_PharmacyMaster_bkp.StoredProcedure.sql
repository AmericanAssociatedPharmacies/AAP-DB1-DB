USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_copy_NEW_PharmacyMaster_to_NEW_PharmacyMaster_bkp]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Temporarily Copy the PMUpdate_All to PharmacyMaster
-- =============================================
Create PROCEDURE [dbo].[spaap_copy_NEW_PharmacyMaster_to_NEW_PharmacyMaster_bkp]

AS
	BEGIN
 
       IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'NEW_PharmacyMaster_bkp')
          DROP TABLE NEW_PharmacyMaster_bkp

	   SELECT * into NEW_PharmacyMaster_bkp from NEW_PharmacyMaster

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
