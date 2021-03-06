USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spAPI_FairShare_Display]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spAPI_FairShare_Display]
(
@apiaccountno varchar(15)
)
as
select 
--[CustNum]
--,
[ProdNum] as [Product No]
,[ProdDesc] as [Product Description]
,[Count]
,[Price]
,[Monthly Qty]
,[Requested Qty]
,convert(varchar,[Start Date],101) as [Start Date]
,convert(varchar,[End Date],101) as [End Date]
,[NDC]
,convert(varchar,[Expiration Date],101) as [Expiration Date]

from fairshare
where CustNum = @apiaccountno
and [End Date] >= DATEADD(Day, 0, DATEDIFF(Day, 0, GetDate()))
order by proddesc

--select DATEADD(Day, 0, DATEDIFF(Day, 0, GetDate())) 
GO
