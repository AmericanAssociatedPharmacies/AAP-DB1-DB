USE [Purchases]
GO
/****** Object:  View [dbo].[v_CHPH_GenericPurchases]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[v_CHPH_GenericPurchases] as 

--this view is used in the API and CAH Units and $ by Customer # report
--For generics only, it sums the total ship_qty from the cardinal purchases table and groups
--the sums by PMID and Inv_Date

select PMID, DATEADD(mm, DATEDIFF(mm, 0, inv_date), 0) as date, sum(ship_qty) as ship_qty
from purchases..chph_aap
where ContractNo in (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245) and 
	year(inv_date) in (year(getdate())-1,year(getdate()))
group by PMID, DATEADD(mm, DATEDIFF(mm, 0, inv_date), 0)



GO
