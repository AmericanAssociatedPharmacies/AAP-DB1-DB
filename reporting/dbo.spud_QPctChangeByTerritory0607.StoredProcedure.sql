USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_QPctChangeByTerritory0607]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spud_QPctChangeByTerritory0607]
as
set nocount on
begin
SELECT DISTINCT NSTERRITORY, SUM(Q406) AS Q406SUM, SUM(Q407) AS Q407SUM,(1- SUM(Q406)/SUM(Q407) )AS pctChange
FROM         tmp_trendreport0208 where nsTerritory is not null
Group BY NSTERRITORY Order by NSTERRITORY 
end
set nocount off

GO
