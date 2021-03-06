USE [reporting]
GO
/****** Object:  View [dbo].[udb_wholesaler_store]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[udb_wholesaler_store] AS 
SELECT distinct WS_ID,VENDOR_ID,STORE_ID,ACCT_TYPE,ACCT_NUM,DC_NUM,UD_ACCT 
FROM OPENQUERY(UNITEDDB, 'select WS_ID,VENDOR_ID,STORE_ID,ACCT_TYPE,ACCT_NUM,DC_NUM,UD_ACCT from united.wholesaler_store') AS Rowset_1
GO
