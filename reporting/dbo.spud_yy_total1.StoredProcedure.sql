USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_yy_total1]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_yy_total1]
@dtstart as datetime,
@dtthrough as datetime
as
begin
select vendor_id,sum(volume) as total from udb_nvolume2
where dt >= @dtstart and dt <= @dtthrough
group by vendor_id
order by vendor_id
end

GO
