USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PMIDDefaultWarehouse]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PMIDDefaultWarehouse]
AS
	SELECT p.pmid,p.apiaccountno,p.whsnum,w.location from pm_pharmacy p
	join
	(
		select * from pm_warehouse
	)w
	on p.whsnum =  w.whid  where p.whsnum is not null
GO
