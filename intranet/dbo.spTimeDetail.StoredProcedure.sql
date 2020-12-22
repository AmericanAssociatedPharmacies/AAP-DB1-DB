USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spTimeDetail]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spTimeDetail]
(
@month int
,@year int --e.g. 2016
) as
select * from intranet..timesheet
where month=@month and year=@year
order by resource,LOB
GO
