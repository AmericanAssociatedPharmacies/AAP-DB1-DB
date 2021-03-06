USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_NDCSearch_APIOnly_v1]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_NDCSearch_APIOnly_v1]
(
@APIAccount varchar(25),
@Drugname varchar(50)
)
as
begin
select distinct 'yes' as ordered,
ndc_orig as ndc,itemdescription,APIItemNbr 
from api..apisalesdetail 
where whaccountid=@APIAccount
	and (itemdescription like '%' + @Drugname + '%') -- or dbo.ssFn_convertNDC(@Drugname) = ndc)
union
select distinct '' as ordered,
ndc_orig as ndc,itemdescription,APIItemNbr 
from api..apisalesdetail 
where whaccountid <> @APIAccount
	and (itemdescription like '%' + @Drugname + '%') -- or dbo.ssFn_convertNDC(@Drugname) = ndc) 
order by 3
end
GO
