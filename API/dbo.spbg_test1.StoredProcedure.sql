USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spbg_test1]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--spbg_test1 4045,'2012-07-31','2012-07-31'
CREATE proc [dbo].[spbg_test1]
(
@payee_id int,
@dtstart varchar(12),
@dtend varchar(12)
)
as
begin
declare @s nvarchar(4000)
set @s = '
select * into delete_test1
from openquery(uniteddb, ''select 
pc.pclaim_key,
pc.rx_num,
pc.fill_dt,
pc.BILL_AMT,
pc.PAID_AMT,
pc.REJECT_AMT, 
pc.INGRED_BILL_AMT,
pc.INGRED_PD_AMT,
pc.COPAY_AMT,
pc.CONTRACT_FEE_AMT,
pc.MISC_FEE_AMT as pc_MISC_FEE_AMT,
pc.REFILLS_QTY,
pc.CLAIM_TYPE,
pc.SUBMIT_CLARIF_CODE,
pc.GROUP_ID,
pc.PAYEE_ID as pc_payee_id,
pc.NPI,
pc.NDC,
r.plan_id, r.feed_id as r_feed_id, r.plan_cycle_dt, 
li.* 
from accounting.cp_lineitem li
left join accounting.cp_receipt r on r.receipt_id=li.receipt_id
left join truescript.plan_claim pc on pc.feed_id = r.feed_id and pc.payee_id = li.payee_id
where 
li.payee_id=' + cast(@payee_id as varchar(10)) + '
and 
--rowno < 2 and 
li.paid_dt between ''''' + @dtstart + ''''' and ''''' + @dtend + ''''''')
'
--select @s
exec sp_executesql @s
end
GO
