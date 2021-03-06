USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_apiCSReport]    Script Date: 12/22/2020 5:26:55 AM ******/
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
with execute as 'devuser'
as

if @type='sum'
BEGIN
select 
* 
from api..apisalesdetail s
left join medispan..v_DrugMaster_ControlledSubstance m
on m.ndc=s.ndc
where dea=4
and invdate >= @datefrom
and invdate <= @datethrough
and WHAccountID=@apiaccountno
END
ELSE
BEGIN
select 
* 
from api..apisalesdetail s
left join medispan..v_DrugMaster_ControlledSubstance m
on m.ndc=s.ndc
where dea=4
and invdate >= @datefrom
and invdate <= @datethrough
and WHAccountID=@apiaccountno
END

GO
