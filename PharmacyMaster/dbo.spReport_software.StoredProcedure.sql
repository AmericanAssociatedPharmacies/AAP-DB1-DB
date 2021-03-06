USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spReport_software]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spReport_software]
as
begin
/*
software counts with parent grouping and detail, AAP+MC
*/
select [type],name,count(PMID) as [count],convert(varchar(255),cast(count(PMID)*100.0/sum(count(PMID)) over() as decimal(10,1))) + '%' as pct 
	,convert(varchar(255),STUFF((    SELECT ', ' + software + ' ' + cast([count] as varchar) AS [text()]
		FROM 
			(
			select s.software,s.parent,count(p.pmid) as [count]
			from 
			pharmacymaster..v_test p left join pharmacymaster..software s on s.id=p.computersoftware
			where (p.isAAP=1 or p.isMCorNPP=1)
			group by s.software,s.parent
			) dt2
		WHERE
		dt2.parent=dt.name
		FOR XML PATH('') 
		), 1, 1, '' ))
	AS [Detail]
from
(
select 
p.PMID
,case when parent is null then 'software' else 'parent' end as [type]

,case when parent is null then software else parent end as name
from 
pharmacymaster..v_test p left join pharmacymaster..software s on s.id=p.computersoftware
where (p.isAAP=1 or p.isMCorNPP=1)  --v_test used for accurate isAAP and isMC
) dt
group by [type],name
order by [count] desc
end
GO
