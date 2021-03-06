USE [reporting]
GO
/****** Object:  View [dbo].[v_VolumeNorm]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_VolumeNorm] as
select acct_no, convert(datetime,'1/1/' + fy_end) as dt, vendor_id,vendor,reports, january as volume from newvolume
union
select acct_no, convert(datetime,'2/1/' + fy_end) as dt,  vendor_id,vendor,reports, february as volume from newvolume
union
select acct_no, convert(datetime,'3/1/' + fy_end) as dt, vendor_id,vendor,reports, march as volume from newvolume
union
select acct_no, convert(datetime,'4/1/' + fy_end) as dt, vendor_id,vendor,reports, april as volume from newvolume
union
select acct_no, convert(datetime,'5/1/' + fy_end) as dt, vendor_id,vendor,reports, may as volume from newvolume
union
select acct_no, convert(datetime,'6/1/' + str(fy_end - 1)) as dt, vendor_id,vendor,reports, june as volume from newvolume
union
select acct_no, convert(datetime,'7/1/' + str(fy_end - 1)) as dt, vendor_id,vendor,reports, july as volume from newvolume
union
select acct_no, convert(datetime,'8/1/' + str(fy_end - 1)) as dt, vendor_id,vendor,reports, august as volume from newvolume
union
select acct_no, convert(datetime,'9/1/' + str(fy_end - 1)) as dt, vendor_id,vendor,reports, september as volume from newvolume
union
select acct_no, convert(datetime,'10/1/' + str(fy_end - 1)) as dt, vendor_id,vendor,reports, october as volume from newvolume
union
select acct_no, convert(datetime,'11/1/' + str(fy_end - 1)) as dt, vendor_id,vendor,reports, november as volume from newvolume
union
select acct_no, convert(datetime,'12/1/' + str(fy_end - 1)) as dt, vendor_id,vendor,reports, december as volume from newvolume



GO
