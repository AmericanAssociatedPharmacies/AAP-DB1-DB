USE [reporting]
GO
/****** Object:  View [dbo].[udb_nvolume2]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[udb_nvolume2] as
select acct_no, convert(datetime,'1/1/' + fy_end) as dt, vendor_id, january as volume from udb_volume
union
select acct_no, convert(datetime,'2/1/' + fy_end) as dt, vendor_id, february as volume from udb_volume
union
select acct_no, convert(datetime,'3/1/' + fy_end) as dt, vendor_id, march as volume from udb_volume
union
select acct_no, convert(datetime,'4/1/' + fy_end) as dt, vendor_id, april as volume from udb_volume
union
select acct_no, convert(datetime,'5/1/' + fy_end) as dt, vendor_id, may as volume from udb_volume
union
select acct_no, convert(datetime,'6/1/' + str(fy_end - 1)) as dt, vendor_id, june as volume from udb_volume
union
select acct_no, convert(datetime,'7/1/' + str(fy_end - 1)) as dt, vendor_id, july as volume from udb_volume
union
select acct_no, convert(datetime,'8/1/' + str(fy_end - 1)) as dt, vendor_id, august as volume from udb_volume
union
select acct_no, convert(datetime,'9/1/' + str(fy_end - 1)) as dt, vendor_id, september as volume from udb_volume
union
select acct_no, convert(datetime,'10/1/' + str(fy_end - 1)) as dt, vendor_id, october as volume from udb_volume
union
select acct_no, convert(datetime,'11/1/' + str(fy_end - 1)) as dt, vendor_id, november as volume from udb_volume
union
select acct_no, convert(datetime,'12/1/' + str(fy_end - 1)) as dt, vendor_id, december as volume from udb_volume



GO
