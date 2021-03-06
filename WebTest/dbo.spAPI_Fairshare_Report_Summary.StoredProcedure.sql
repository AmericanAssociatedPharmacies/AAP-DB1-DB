USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spAPI_Fairshare_Report_Summary]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spAPI_Fairshare_Report_Summary]
as
select dt.*,p.pmid,p.accountname,p.city,p.state,p.TM from
(
select custnum,count(prodnum) as products,sum([Requested Qty]) as [Requested Qty], sum([Requested Qty]*Price) as Extended_Price
from webdev..fairshare f 
where [requested qty] > 0
group by custnum
) dt
left join pharmacymaster..v_test p on p.apiaccountno=dt.custnum
order by custnum
GO
