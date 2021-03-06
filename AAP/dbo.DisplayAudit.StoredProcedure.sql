USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[DisplayAudit]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 12-20-09
-- Description:	display user performance against the audit log table
-- =============================================
CREATE PROCEDURE [dbo].[DisplayAudit]
	
AS
BEGIN
WITH unq_primary AS ( select distinct primarykey,sysuser,tablename from dbo.audit ), 
unq_users AS ( select distinct primarykey,sysuser from dbo.audit ),
unq_tables as ( select distinct primarykey,sysuser,tablename from dbo.audit),
unq_primary_today as ( select distinct primarykey,sysuser,tablename from dbo.audit where CAST(CONVERT(varchar, auditdate, 101) AS DateTime) = CAST(CONVERT(varchar, GetDate(), 101) AS DateTime)),
unq_primary_yesterday as ( select distinct primarykey,sysuser,tablename from dbo.audit where CAST(CONVERT(varchar, auditdate, 101) AS DateTime) = CAST(CONVERT(varchar, GetDate()-1, 101) AS DateTime))


--perform tally analysis

select p.sysuser , tbl.tablename, (select count(sysuser) from unq_primary where sysuser = p.sysuser and tablename = tbl.tablename ) as 'Number of Transactions Total',
(select count(sysuser) from unq_primary_today where sysuser = p.sysuser and tablename = tbl.tablename ) as 'Number of Transactions Today',
(select count(sysuser) from unq_primary_yesterday where sysuser = p.sysuser and tablename = tbl.tablename ) as 'Number of Transactions Yesterday'
from unq_primary p inner join unq_tables tbl on p.tablename = tbl.tablename
group by p.sysuser,tbl.tablename
order by tbl.tablename,p.sysuser

--perform operation type and time query

select distinct sysuser,tablename,operation,primarykey,substring(convert(varchar, auditdate,108),1,5) as [timevalue]
from dbo.audit a
where CAST(CONVERT(varchar, auditdate, 101) AS DateTime) = CAST(CONVERT(varchar, GetDate(), 101) AS DateTime)
group by  sysuser,tablename,operation,primarykey, substring(convert(varchar, auditdate,108),1,5)
order by timevalue,sysuser

END
GO
