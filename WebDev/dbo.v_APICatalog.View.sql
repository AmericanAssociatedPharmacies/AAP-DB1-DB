USE [WebDev]
GO
/****** Object:  View [dbo].[v_APICatalog]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_APICatalog]
as
select distinct ndc,APIItemNbr,Description
from claims..apiprice
where dateloaded = (select max(dateloaded) from claims..apiprice)
GO
