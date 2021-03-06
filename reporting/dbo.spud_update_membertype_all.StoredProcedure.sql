USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_update_membertype_all]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_update_membertype_all]
-- create temp table with member type and primary wholesaler
-- B.Grant 7/08
as
set nocount on
begin
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'membertype_all')
          DROP TABLE membertype_all
 

--one row per member
select acct_no, cast('' as varchar(15)) as type, cast(NULL as int) as primaryws,cast('' as varchar(15)) as primarywsname,
effective,quitdate,resigned
,chain_code --added 1/09
into membertype_all from udb_store_member


--Bashas member type
update membertype_all set type='Bashas' where membertype_all.acct_no in 
(select * from openquery(uniteddb,'select distinct account_id from united.payee where ftp_acct=''ccci'''))

--CH primary wholesaler
--Changed ud_acct to store_id - jmw
update membertype_all set primaryws=65,primarywsname='CH' where membertype_all.acct_no in
(select * from openquery(uniteddb,'select distinct lfill(store_id,''0'',4)   from united.wholesaler_store where vendor_id = 65 
and acct_type in (''PRIMARY'',''RX'',''OTC'',''POA'')'))
--and acct_type=''PRIMARY'' fails for bashas, many others

--Pipco type and wholesaler
update membertype_all set type='Pipco',primaryws=86,primarywsname='CH' where membertype_all.acct_no in
(select * from openquery(uniteddb,'select distinct lfill(store_id,''0'',4)   from united.wholesaler_store where vendor_id = 86'))
--and acct_type=''PRIMARY'' fails on POA accounts

--ML type and wholesaler
update membertype_all set type='ML',primaryws=79,primarywsname='ML' where membertype_all.acct_no in
(select * from openquery(uniteddb,'select distinct lfill(store_id,''0'',4)   from united.wholesaler_store where vendor_id = 79 and acct_type=''PRIMARY'''))

--IPC type and wholesaler
update membertype_all set type='IPC', primaryws=76,primarywsname='IPC'  where membertype_all.acct_no in
(select * from openquery(uniteddb,'select distinct lfill(store_id,''0'',4)   from united.wholesaler_store where vendor_id = 76 and acct_type=''PRIMARY'''))

--NPP type (no wholesaler)
update membertype_all set type='NPP' where membertype_all.acct_no in
(select * from openquery(uniteddb,'select acct_no from united.store_member where npp_mbr=-1'))

--default to UD type
update membertype_all set type='UD' where type=''

--hack records with a null entry in u.w-s to use CH
--update membertype_all set primaryws=65 where primaryws is null --and type<>'NPP'

--set primary ws to 0 otherwise, includes ABC
update membertype_all set primaryws=0,primarywsname='' where primaryws is null

end

--return summary recordset
select 'membertype_all' as grouping, type,count(type) as count from membertype_all
group by type
union
select 'membertype_all' as grouping, 'total' as type,count(*) as count from membertype_all
union
select 'primaryws' as grouping, cast(primarywsname as varchar(15)) as primaryws,count(primarywsname) as count from membertype_all
group by primarywsname
union
select 'primaryws' as grouping, 'total' as type,count(*) as count from membertype_all

set nocount off

GO
