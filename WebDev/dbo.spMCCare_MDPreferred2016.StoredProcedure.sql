USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCCare_MDPreferred2016]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spMCCare_MDPreferred2016]
as
SELECT 
case when [Plan Data Sheet ID] is null then 'n/a' else 
--'<a href="/PDS/3pdata.html?PLAN_ID=' + cast([Plan Data Sheet ID] as varchar) + '">Data Sheet ' + cast([Plan Data Sheet ID] as varchar) + '</a>' 
'<a href="/PDS/3pdata.html?PLAN_ID=' + cast([Plan Data Sheet ID] as varchar) + '">Data Sheet </a>' 
end as [Plan Data Sheet]
      ,convert(varchar,[Effective Date],101) as [Effective Date]
      ,[PLAN_NAME] as [Plan Name]
      ,[CMS Name]
      ,[UD Chain Code Contracted]
      ,[Plan Year 2015]
      ,[Plan Year 2016]
      ,[BIN]
      ,[PCN]
      ,[Quality Performance Incentive Program]
  FROM [WebDev].[dbo].MCCare_MDPreferred2016
--grant exec on spMCCare_MDPreferred2016 to webdevuser
GO
