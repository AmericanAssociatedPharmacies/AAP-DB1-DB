USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_QPctChangeByTerritory07081]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_QPctChangeByTerritory07081]
as
set nocount on
begin
SELECT DISTINCT NSTERRITORY, SUM(Q107) AS Q107SUM, SUM(Q108) AS Q108SUM,(1- SUM(Q107)/SUM(Q108) )AS pctChange2
FROM         tmp_trendreport0308 where nsTerritory is not null
Group BY NSTERRITORY Order by NSTERRITORY 
end
set nocount off
GO
