USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_baselineReport_anda]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_baselineReport_anda]
as
drop table anda_temp_0405
select a4.[ud#],a4.[total April 2008] as sales0408,a5.sales as sales0508
into anda_temp_0405
--from anda0408 a4 left join anda0508import a5
from anda0408 a4 left join anda_may08 a5
on a4.DEA = a5.[DEA]

GO
