USE [ODSIntake]
GO
/****** Object:  View [dbo].[vwAPICatalog]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwAPICatalog]

AS


select CASE 
		WHEN PGUFA2 NOT LIKE '%[a-zA-Z0-9]%' THEN NULL 
		ELSE PGUFA2 
		END AS NDC
 , left(PGPRDC,6) AS APIItemNum
 , case 
	when PGPGRP like 'G0%' and PGPGRP <> 'G06' then 1
	ELSE 0 
	end as isTierI
, case 
	when PGPGRP = 'G06' then 1
	ELSE 0 
	end as isTierII
, PGPGRP AS GroupID
, CASE 
	WHEN PGHSTC NOT LIKE '%[a-zA-Z0-9]%' THEN 'ACTIVE'
	ELSE PGHSTC
	END AS ProductHandlingStatusCode
, CASE
	WHEN PGUFA2 NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
	ELSE PGUFA2
	END AS APINDC
from [10.96.0.3].[APIASW].[AX1492BFRX].[SROPRG]

GO
