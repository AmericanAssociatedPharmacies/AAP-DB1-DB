USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_Address_Mailing_Rebates]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Address_Mailing_Rebates]
AS

	select   v.pmid,CASE when v.address_type_id = '3' then t.AccountName 
          when p.corporatename is null then p.accountname else p.corporatename END as [account name],
v.address,isnull(v.address2,'') as address2,v.city,v.state,v.zip,v.contactfullname as contact from v_Address_Mailing_Financials v
left outer join PM_Pharmacy p on p.pmid = v.pmid
left outer join pmbackups..tmp_API_Finance_Mail t on p.apiaccountno = t.apiaccountno
GO
