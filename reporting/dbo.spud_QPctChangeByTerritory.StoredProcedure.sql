USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_QPctChangeByTerritory]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_QPctChangeByTerritory]
as
set nocount on
begin
SELECT DISTINCT x.NSTERRITORY, x.Q406SUM, x.Q407SUM, x.pctChange, y.Q107SUM, y.Q108SUM, y.pctChange2
FROM         (SELECT     NSTERRITORY, SUM(Q406) AS Q406SUM, SUM(Q407) AS Q407SUM, round(( 1 - SUM(Q406) / SUM(Q407))*100,2) AS pctChange
                       FROM          tmp_trendreport0208
                       WHERE      (NSTERRITORY IS NOT NULL)
                       GROUP BY NSTERRITORY) AS x INNER JOIN
              (SELECT     NSTERRITORY, SUM(Q107) AS Q107SUM, SUM(Q108) AS Q108SUM, round((1 - SUM(Q107) / SUM(Q108))*100,2) AS pctChange2
                            FROM          tmp_trendreport0308
                            WHERE      (NSTERRITORY IS NOT NULL)
                            GROUP BY NSTERRITORY) AS y ON x.NSTERRITORY = y.NSTERRITORY 
end
set nocount off

GO
