USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spweb_apiCSReport]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spweb_apiCSReport]
(
	@apiaccountno varchar(50),
	@datefrom datetime,
	@datethrough datetime,
	@type varchar(10)
)
with execute as 'webdevaap'
as
if @type='sum'
begin
select s.NDC, 
replace(replace(ItemDescription,'!',''),'*','') as [Description / Size],
sum(Qty) as [Qty shipped]
from api..apisalesdetail s
where (ItemDescription like '!%' or ItemDescription like '*%')
and invdate >= @datefrom
and invdate <= @datethrough
and WHAccountID=@apiaccountno
group by s.NDC,Itemdescription
order by s.NDC
end
ELSE
begin
select
CONVERT(VARCHAR(8), InvDate, 1) as [Invoice Date],
'' as [Blank#],
Type,
InvNbr as [Inv#],
s.NDC,
APIItemNbr as [Item#],
replace(replace(ItemDescription,'!',''),'*','') as [Description / Size],
--UnitAmount,-- as [Size],
'' as FM,
'' as PK,
'' Cls,
--DEA,
Qty as [Qty shipped]

from api..apisalesdetail s
--left join api..v_DrugMaster_ControlledSubstance m
--left join api..tmp_DrugMaster_ControlledSubstance m
--on m.ndc=s.ndc
--where isnull(dea,0) > 0
where (ItemDescription like '!%' or ItemDescription like '*%')
and invdate >= @datefrom
and invdate <= @datethrough
and WHAccountID=@apiaccountno
order by InvDate,InvNbr
COLLATE database_default
end
GO
