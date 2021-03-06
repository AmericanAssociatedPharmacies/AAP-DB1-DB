USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_NDCSearch_All]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_NDCSearch_All]
(
@APIAccount varchar(25),
@Drugname varchar(50)
)
as
-- look up NDCs for a description, or the description from an NDC
-- check against API catalog, and against dtOrders for the account
-- B.Grant 8/12
begin
select distinct
top 1000 
v.ndc,v.drugname,v.mfg,
case when cat.ndc is null then  
	case when dtOrders.APIItemNbr is null then '' else dtOrders.APIItemNbr + '*' end
	else cat.APIItemNbr end as APIItemNbr,
case when dtOrders.ndc is null then '' else 'yes' end as ordered
from api..web_NDCList v --medispan..v_drugmaster v
left join
--v_APICatalog cat on cat.ndc=v.ndc
api..web_APICatalog cat on cat.ndc=v.ndc
left join
(select distinct ndc,APIItemNbr from api..apisalesdetail a
where whaccountid=@APIAccount) dtOrders on dtOrders.ndc=v.ndc
--where v.obsdtec is null
--and APIItemNbr is not null
where(drugname like '%' + @Drugname + '%') -- or dt.Description like '%' + @Drugname + '%')
or dbo.ssFn_convertNDC(@Drugname) = v.NDC
order by ordered desc,drugname,ndc
end
GO
