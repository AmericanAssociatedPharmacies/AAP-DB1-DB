USE [TempTables]
GO
/****** Object:  View [dbo].[v_delete_SLXAPIAAP]    Script Date: 12/22/2020 9:41:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_delete_SLXAPIAAP]
as
select ACCOUNTID,APIACCOUNTNO,'' as AAPACCOUNTNO from Saleslogix_Prod.sysdba.APIACCOUNT
union
select ACCOUNTID, '' as APIACCOUNTNO, AAPACCOUNTNO from Saleslogix_Prod.sysdba.AAPACCOUNT
GO
