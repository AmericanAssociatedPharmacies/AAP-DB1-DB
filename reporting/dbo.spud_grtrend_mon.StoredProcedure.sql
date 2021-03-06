USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_grtrend_mon]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_grtrend_mon]
@reportmo datetime
as
set nocount on
declare @mostart datetime
declare @moend datetime
declare @moindex integer

--report month
set @moindex = 0 
set @mostart = CAST(CAST(YEAR(@reportmo) AS VARCHAR(4)) + '/' + 
                CAST((MONTH(@reportmo)- @moindex) AS VARCHAR(2)) + '/01' AS DATETIME)
set @moend = CAST(CAST(YEAR(@reportmo) AS VARCHAR(4)) + '/' + 
                CAST((MONTH(@reportmo) -@moindex +1) AS VARCHAR(2)) + '/01' AS DATETIME)

--create tmp table
select top 1 ud_acct as acct_no, @reportmo as month, 
sum(rx_vol_amt) as rxvol, 
sum(gen_vol_amt) as genvol, 
sum(submitted_rebate_amt) as submitted_rebate
into tmp_trendReportGR1
from udb_genrebate
where adjustment_dt between @mostart and @moend 
group by ud_acct
order by ud_acct

truncate table tmp_trendReportGR1

--last 6 mo
while @moindex < 7
begin
set @mostart = CAST(CAST(YEAR(@reportmo) AS VARCHAR(4)) + '/' + 
                CAST((MONTH(@reportmo)- @moindex) AS VARCHAR(2)) + '/01' AS DATETIME)
set @moend = CAST(CAST(YEAR(@reportmo) AS VARCHAR(4)) + '/' + 
                CAST((MONTH(@reportmo) -@moindex +1) AS VARCHAR(2)) + '/01' AS DATETIME)

insert into tmp_trendReportGR1 (acct_no,month,rxvol,genvol,submitted_rebate)
select ud_acct as acct_no, @mostart as month, 
sum(rx_vol_amt) as rxvol, 
sum(gen_vol_amt) as genvol, 
sum(submitted_rebate_amt) as submitted_rebate
from udb_genrebate
where adjustment_dt between @mostart and @moend 
group by ud_acct
order by ud_acct

set @moindex = @moindex + 1
end
--end 6 mo loop
--year ago
set @moindex = 12
set @mostart = CAST(CAST(YEAR(@reportmo) AS VARCHAR(4)) + '/' + 
                CAST((MONTH(@reportmo)- @moindex) AS VARCHAR(2)) + '/01' AS DATETIME)
set @moend = CAST(CAST(YEAR(@reportmo) AS VARCHAR(4)) + '/' + 
                CAST((MONTH(@reportmo) -@moindex +1) AS VARCHAR(2)) + '/01' AS DATETIME)

insert into tmp_trendReportGR1 (acct_no,month,rxvol,genvol,submitted_rebate)
select ud_acct as acct_no, @mostart as month, 
sum(rx_vol_amt) as rxvol, 
sum(gen_vol_amt) as genvol, 
sum(submitted_rebate_amt) as submitted_rebate
from udb_genrebate
where adjustment_dt between @mostart and @moend 
group by ud_acct
order by ud_acct

--todo: calendar quarter
set nocount off


GO
