USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spbg_ServicesSurveySummary]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbg_ServicesSurveySummary]
as
DECLARE @query varchar(max)
SELECT @query = 
(SELECT
'select top 1 ''' + column_name + ''' as [item], (select count(' + column_name 
+ ') from pm_servicessurvey where ' + column_name + '=0) as [No],(select count(' + column_name 
+ ') from pm_servicessurvey where ' + column_name + '=1) as [Yes]  from pm_servicessurvey union '
         FROM information_schema.columns
         WHERE table_name = 'pm_servicessurvey'
		and column_name not in ('pmid','created','modified','rowversion','contracted340bexplain','immunizationsotherexplain','pk_servicessurvey')
for xml path(''))
select @query = left(@query,len(@query)-6) --remove last 'union'
--print(@query)
exec(@query)
GO
