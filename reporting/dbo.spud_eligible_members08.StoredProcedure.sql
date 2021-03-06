USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_eligible_members08]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_eligible_members08]
AS
-- B.Grant 8/08. snapshot eligible members at end of fy08
-- based on the view udb_active_members and on spud_update_membertype

begin
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='tmp_delete') DROP TABLE tmp_delete

SELECT DISTINCT ACCT_NO, NCPDP, STORE, CITY, STATE, NSTERRITORY, EFFECTIVE, QUITDATE
into tmp_delete
FROM         OPENQUERY(UNITEDDB, 'select acct_no, nabp as ncpdp, store, city, state, nsterritory,effective,quitdate  from united.store_member where (quitdate is null or quitdate > ''2008-05-31'') and (effective is not null and effective < ''2008-06-01'')') AS derived1

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='report_baselineFY2008_members') DROP TABLE report_baselineFY2008_members

SELECT     m.acct_no, m.ncpdp, m.store, m.city, m.state, m.nsterritory as terr, 
m.effective, m.quitdate, t.type, t.primaryws
into report_baselineFY2008_members
FROM dbo.tmp_delete AS m LEFT JOIN
dbo.membertype AS t ON m.ACCT_NO = t.acct_no

drop table tmp_delete
end

GO
