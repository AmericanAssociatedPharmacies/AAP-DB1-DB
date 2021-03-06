USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spweb_apiCSReport_v1]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spweb_apiCSReport_v1]
(
	@apiaccountno varchar(50),
	@datefrom datetime,
	@datethrough datetime
)
with execute as 'devuser'
as
begin
select
CONVERT(VARCHAR(8), InvDate, 1) as [Invoice Date],
'' as [Blank#],
Type,
InvNbr as [Inv#],
s.NDC,
APIItemNbr as [Item#],
ItemDescription as [Description],
UnitAmount,-- as [Size],
'' as FM,
'' as PK,
'' Cls,
DEA,
Qty as [Qty shipped]

from api..apisalesdetail s
--left join api..v_DrugMaster_ControlledSubstance m
left join api..tmp_DrugMaster_ControlledSubstance m
on m.ndc=s.ndc
where isnull(dea,0) > 0
and invdate >= @datefrom
and invdate <= @datethrough
and WHAccountID=@apiaccountno
order by InvDate,InvNbr
COLLATE database_default
end
grant execute on spweb_apiCSReport to webdevuser
grant execute on spweb_apiCSReport to devuser
exec spweb_apiCSReport '05192134','3/1/13','3/31/13'

select * into tmp_DrugMaster_ControlledSubstance
from v_DrugMaster_ControlledSubstance

GO
