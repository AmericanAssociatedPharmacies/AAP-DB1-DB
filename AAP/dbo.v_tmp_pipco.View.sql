USE [AAP]
GO
/****** Object:  View [dbo].[v_tmp_pipco]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[v_tmp_pipco]
as

select 'PIPCO' as aff1, a.accountid,a.AAPID,a.PreviousAcctNo as udid  from AAPAccount a left join AAPAccountAffiliateGroup g on a.accountid = g.accountid where (g.affiliategroupid=7
and a.quitdate is null) or a.accountid in (1635,1636,1637)   
union all
select '' as aff1, a.accountid,a.AAPID,a.PreviousAcctNo as udid from AAPAccount a left join AAPAccountAffiliateGroup g on a.accountid = g.accountid where (g.affiliategroupid is null or g.affiliategroupid<>7)
and a.quitdate is null and a.accountid not in (1635,1636,1637)   

GO
