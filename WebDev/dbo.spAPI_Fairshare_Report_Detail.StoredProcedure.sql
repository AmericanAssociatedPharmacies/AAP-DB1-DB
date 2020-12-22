USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spAPI_Fairshare_Report_Detail]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc
[dbo].[spAPI_Fairshare_Report_Detail]
as
select t.* 
,p.pmid,p.accountname,p.city,p.state
from FairShare t
left join pharmacymaster..v_test p on p.apiaccountno=t.custnum
where [requested qty] is not null and [requested qty] > 0
order by p.apiaccountno


GO
