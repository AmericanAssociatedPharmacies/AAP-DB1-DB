USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_copy_PMUpdate_All_to_PharmacyMaster]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Temporarily Copy the PMUpdate_All to PharmacyMaster
-- =============================================
CREATE PROCEDURE [dbo].[spaap_copy_PMUpdate_All_to_PharmacyMaster]

AS
	BEGIN
 
       IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PharmacyMaster')
          DROP TABLE PharmacyMaster

	   SELECT * into PharmacyMaster from PMUpdate_All

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
