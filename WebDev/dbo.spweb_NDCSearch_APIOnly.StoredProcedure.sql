USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_NDCSearch_APIOnly]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spweb_NDCSearch_APIOnly]
(
@APIAccount varchar(25),
@Drugname varchar(50)
)
as
begin
select distinct
ndc_orig as ndc,itemdescription,APIItemNbr,
case when dtOrders.ndc is null then '' else 'yes' end as ordered
from api..apisalesdetail d
left join
(select distinct ndc from api..apisalesdetail where whaccountid=@APIAccount and ndc_orig is not null 
and ndc_orig<> ''
	and itemdescription like '%' + @Drugname + '%') dtOrders on dtOrders.ndc=d.ndc
where (itemdescription like '%' + @Drugname + '%') -- or dbo.ssFn_convertNDC(@Drugname) = ndc)

order by 2,1
end

GO
