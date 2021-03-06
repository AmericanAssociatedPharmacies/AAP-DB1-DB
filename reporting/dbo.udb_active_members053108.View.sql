USE [reporting]
GO
/****** Object:  View [dbo].[udb_active_members053108]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[udb_active_members053108]
AS
SELECT DISTINCT ACCT_NO, NCPDP, STORE, CITY, STATE, NSTERRITORY, EFFECTIVE,QUITDATE
FROM         OPENQUERY(UNITEDDB, 'select acct_no, nabp as ncpdp, store, city, state, nsterritory,effective,quitdate 
from united.store_member where (quitdate IS NULL or quitdate > ''2008-05-31'') and (effective is not null and effective < ''2008-06-01'')') 
                      AS derivedtbl_1

GO
