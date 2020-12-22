USE [reporting]
GO
/****** Object:  View [dbo].[udb_genrebate_chdata]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[udb_genrebate_chdata]
AS
SELECT     UD_ACCT, VENDOR_ID, APPLY_DT, RX_VOL_AMT, GEN_VOL_AMT

FROM         OPENQUERY(UNITEDDB, 'select UD_ACCT, VENDOR_ID, APPLY_DT, RX_VOL_AMT, GEN_VOL_AMT from united.indexing_gen_rebate where vendor_id=69')
AS Rowset_1

GO
