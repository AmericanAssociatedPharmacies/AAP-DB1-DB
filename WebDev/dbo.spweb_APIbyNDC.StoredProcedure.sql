USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_APIbyNDC]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_APIbyNDC]
(
	@accountno varchar(32),
	@ndc varchar(15)
)
as
--enter full ndc with no dashes
begin
declare @dt90 as datetime
set @dt90 = dateadd(m,-3,getdate())
select 
--top 10  
OrderNbr as [Order #],
InvNbr as [Invoice #],
convert(varchar(10),InvDate,1) as [Invoice date],
APIItemNbr as [API Item#],
Qty,UnitAmount as [Unit Amount],
LineAmt as [Line Amount],
ExtSales as [Total],
NDC_orig as NDC
from api..apisalesdetail 
where whaccountid = @accountno 
and invdate >= @dt90
and (ndc = dbo.ssFn_convertNDC(@ndc) or APIItemNbr=@ndc)

order by invdate desc  
end
GO
