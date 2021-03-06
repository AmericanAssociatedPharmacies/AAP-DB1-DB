USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spTime_currentMonthPivot]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spTime_currentMonthPivot]
(
@month int
,@year int --e.g. 2016
) as
SELECT *
FROM (
    SELECT 
       resource,LOB,isnull(total+contractor,0.0) as total
    FROM timesheet
    where month=@month and year=@year
) as s
PIVOT
(
    SUM(total)
    --FOR [LOB] IN ([AAP],[API],[CP],[IT],[MC],[Sales],[Sick/Vacation],[UD],[Merger],[Website])
    --FOR [LOB] IN ([AAP],[API],[Arete-Integration],[CP],[HR],[IT],[MC],[Sales],[Sick/Vacation],[UD],[UDOther],[Website])
    FOR [LOB] IN ([AAP],[API],[Arete],[Arete-Integration],[CP],[HR],[IT],[MC],[Sales],[Sick/Vacation],[Website-AAP],[Website-Arete])
)AS result
order by resource
GO
