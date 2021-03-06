USE [AAP]
GO
/****** Object:  View [dbo].[v_MCMembersUDandAAP]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_MCMembersUDandAAP]
as

select  AAPID, PreviousAcctNo as UDAcct, ParentAAPID as ParentID, 
ncpdp, chaincode, 
storename as store, addr1, addr2, city,state,zip, areacode,phone as phone1,
faxareacode,fax,
OwnerFirst as contact_f,
OwnerLast as contact_l,
'Owner' as contact_title
from aap..aapaccount

union

select '' as AAPID, acct_no as UDAcct, [group] as ParentID, nabp as ncpdp, chain_code as chaincode, 
store, addr1, addr2, city, state, zip, 
areacode,phone1,faxareacode,fax,
contact_F,contact_L,[contact person's title] as contact_title
from reporting..storemember
where quitdate is null
and chain_code is not null
and acct_no not in (select PreviousAcctNo as acct_no from aap..aapaccount)



GO
