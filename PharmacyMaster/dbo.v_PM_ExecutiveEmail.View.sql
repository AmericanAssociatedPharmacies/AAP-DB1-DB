USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_ExecutiveEmail]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_ExecutiveEmail]
AS

select PMID,Email, address_type_id
from pm_addressmaster 
where address_type_id =9

 
 
GO
