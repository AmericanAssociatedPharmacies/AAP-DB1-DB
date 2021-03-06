USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_FairShare]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spMCenter_FairShare]
(
	@PMID int
)
as
-- Message Center return 'result' field, value 1 to show message else 0
-- 4/1/15 bg
-- added date test 6/9/15
BEGIN
select top 1
case when f.custnum is null then 0 else 1 end as result
from pharmacymaster..pm_pharmacy p 
left join fairshare f on f.custnum=p.apiaccountno
where p.PMID=@PMID and [end date] >= Convert(DateTime, DATEDIFF(DAY, 0, GETDATE()))
END
/*
spMCenter_FairShare 106999
select * from fairshare where custnum='01011671'

*/
GO
