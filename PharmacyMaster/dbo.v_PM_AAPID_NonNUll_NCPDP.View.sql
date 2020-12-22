USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PM_AAPID_NonNUll_NCPDP]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_AAPID_NonNUll_NCPDP]
AS

SELECT cast (aapaccountno as varchar(32))as AAPID,cast (NCPDP as varchar(32)) as NCPDP from pm_pharmacy where aapaccountno is not null 
and aapaccountno != ''and ncpdp  is not null 
GO
