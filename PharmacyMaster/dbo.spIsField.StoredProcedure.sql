USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spIsField]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spIsField]
@field varchar(128)
as
select t.name + '.' + c.column_name from sys.tables t 
left join INFORMATION_SCHEMA.COLUMNS c on t.name=c.table_name
where (t.name like 'PM%' or t.name like 'v_PM%') and t.name not like '%_bkp%' and t.name not like '%bak%' and t.name not like '%_before%'
and c.column_name like '%' + @field + '%'
order by t.name,c.column_name
GO
