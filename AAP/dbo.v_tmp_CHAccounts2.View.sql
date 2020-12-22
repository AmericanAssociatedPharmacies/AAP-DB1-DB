USE [AAP]
GO
/****** Object:  View [dbo].[v_tmp_CHAccounts2]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_tmp_CHAccounts2]
as
select pmid, aapaccountno, udaccountno, apiaccountno, WholesalerAccountNo,PrimaryCAAccountNo 
,aap.dbo.CHAcctNo2(pmid) as CHAcctNoFn
from aap.dbo.newpharmacymasterfortest
where aapaccountno is not null --and WholesalerAccountNo is null
GO
