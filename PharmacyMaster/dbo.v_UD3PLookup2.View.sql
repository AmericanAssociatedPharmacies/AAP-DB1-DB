USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_UD3PLookup2]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_UD3PLookup2]
as

select distinct 'UD' as type, 
a.CAAccountNo as CHAccountNo,
UDAccountNo as StoreAccountNo
 from
PM_CHAccounts a left join PM_Pharmacy p 
	on a.DEA=p.DEA 
	or cast(a.CAAccountNo as varchar(50))=p.WholesalerAccountNo
where AAPAccountNo is null and UDAccountNo is not null and (UDQuitdate is null 
	or UDQuitdate > '10/1/09')

union

select distinct 'AAP' as type, 
a.CAAccountNo as CHAccountNo,
AAPAccountNo as StoreAccountNo
 from
PM_CHAccounts a left join PM_Pharmacy p 
	on a.DEA=p.DEA 
	or cast(a.CAAccountNo as varchar(50))=p.WholesalerAccountNo
where AAPAccountNo is not null

union

select distinct 'API' as type, 
a.CAAccountNo as CHAccountNo,
'API_' + APIAccountNo as StoreAccountNo
 from
PM_CHAccounts a left join PM_Pharmacy p 
	on a.DEA=p.DEA 
	or cast(a.CAAccountNo as varchar(50))=p.WholesalerAccountNo
where AAPAccountNo is null and UDAccountNo is null
and APIAccountNo is not null



GO
