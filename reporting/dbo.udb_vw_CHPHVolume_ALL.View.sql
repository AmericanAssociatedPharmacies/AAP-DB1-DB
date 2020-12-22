USE [reporting]
GO
/****** Object:  View [dbo].[udb_vw_CHPHVolume_ALL]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[udb_vw_CHPHVolume_ALL] AS SELECT DISTINCT ch.STORE, ExtCost, januarySUM, februarySUM, marchSUM,
 aprilSUM, maySUM, juneSUM, julySUM, augustSUM, septemberSUM, octoberSUM, novemberSUM, decemberSUM, montotSUM,
 FY_END FROM (SELECT STORE, SUM(EXT_COST) AS ExtCost FROM CHPH_1
 WHERE (STORE IS NOT NULL) GROUP BY STORE)
 AS ch INNER JOIN (SELECT ACCT_NO, VENDOR_ID, SUM(JANUARY) AS januarySUM, SUM(FEBRUARY) AS februarySUM,
 SUM(MARCH) AS marchSUM, SUM(APRIL) AS aprilSUM, SUM(MAY) AS maySUM, SUM(JUNE) AS juneSUM,
 SUM(JULY) AS julySUM, SUM(AUGUST) AS augustSUM, SUM(SEPTEMBER) AS septemberSUM, SUM(OCTOBER) AS octoberSUM,
 SUM(NOVEMBER) AS novemberSUM, SUM(DECEMBER) AS decemberSUM, SUM(MONTOT) AS montotSUM, FY_END
 FROM udVolume WHERE (ACCT_NO IS NOT NULL) GROUP BY ACCT_NO, VENDOR_ID, FY_END) AS v 
ON ch.STORE = v.ACCT_NO WHERE v.VENDOR_ID = 65
GO
