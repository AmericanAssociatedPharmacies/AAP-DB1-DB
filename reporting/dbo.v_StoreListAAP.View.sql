USE [reporting]
GO
/****** Object:  View [dbo].[v_StoreListAAP]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_StoreListAAP] 
as
select m.acct_no as udacctno,
s.whaccountid,
a.*

from aap.dbo.aapaccount a
left join v_slxaccount s on a.ncpdp=s.ncpdp
left join storemember m on a.ncpdp=m.nabp
where a.aapid is not null

GO
