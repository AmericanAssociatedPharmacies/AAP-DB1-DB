USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_DemoExamples_deprecated]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRLGL_DemoExamples_deprecated]
(
--find some rlgl tests
--deprecated 2/2015 by spRLGLDemoValues bg

	@ncpdp varchar(10),
	@results int
)
as
begin
SET ROWCOUNT @results

DECLARE @LastMonday datetime;
set @LastMonday = DATEADD(DAY, 1-DATEPART(WEEKDAY, getdate()), getdate());
set @LastMonday = Convert(DateTime, DATEDIFF(DAY, 0, @LastMonday)) --truncate time
set @LastMonday = DATEADD(HOUR,12,@LastMonday); -- noon

select 
dbo.fnRLGL_test1([Pharm ID],[rx nbr],[rx date]) as RLGL,
c.[pharm id],
c.[rx nbr],
c.[rx date],
c.[total price],
c.[cost submitted],
c.UpdatedOn,
case when (c.UpdatedOn >= @LastMonday) then 1 else 0 end as IsDaily,
s.[status],
s.[source],
s.[result]
from Rx30Latest c
	left join
	upstatus s on s.pharmid=c.[Pharm ID]
	and s.rxnbr = c.[rx nbr]
	and s.rxdate=c.[rx date]
--where s.pharmid is not null
where s.pharmid=@ncpdp
order by [UpdatedOn] desc
end
GO
