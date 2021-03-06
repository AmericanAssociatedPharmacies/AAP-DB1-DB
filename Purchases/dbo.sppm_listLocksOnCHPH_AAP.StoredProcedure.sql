USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_listLocksOnCHPH_AAP]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 6/04/2013
-- Description:	Get locks on CHPH_AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_listLocksOnCHPH_AAP] 
	
AS
 

BEGIN

SELECT * from (
SELECT         program_name,login_name,login_time,context_info,total_scheduled_time,total_elapsed_time,text,
  CASE
           WHEN resource_type = 'OBJECT'
               THEN OBJECT_NAME(resource_associated_entity_id)
           ELSE OBJECT_NAME(OBJECT_ID)
       END AS ObjectName
   from
	sys.dm_tran_locks l
	left  JOIN sys.dm_exec_sessions ES ON ES.session_id = L.request_session_id
	left JOIN sys.dm_exec_connections CN ON CN.session_id = ES.session_id
LEFT JOIN sys.partitions ON partitions.hobt_id = resource_associated_entity_id
	CROSS APPLY sys.dm_exec_sql_text(CN.most_recent_sql_handle) AS ST
	where resource_type = 'OBJECT'
	and resource_database_id = DB_ID() and 
	DB_NAME(resource_database_id)= 'Purchases'
)ch where ObjectName = 'CHPH_AAP'


--SELECT   program_name,login_name,login_time,context_info,total_scheduled_time,total_elapsed_time,text FROM
-- 
--	sys.dm_tran_locks l
--	left  JOIN sys.dm_exec_sessions ES ON ES.session_id = L.request_session_id
--	left JOIN sys.dm_exec_connections CN ON CN.session_id = ES.session_id
--	CROSS APPLY sys.dm_exec_sql_text(CN.most_recent_sql_handle) AS ST
--	where resource_type = 'OBJECT'
--	and resource_database_id = DB_ID()-- and 
----	cast(object_name(resource_associated_entity_id) as varchar(255)) = 'chph_aap'

END

GO
