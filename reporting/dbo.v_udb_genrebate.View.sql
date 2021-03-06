USE [reporting]
GO
/****** Object:  View [dbo].[v_udb_genrebate]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_udb_genrebate]
AS
SELECT     UD_ACCT, VENDOR_ID, APPLY_DT, RX_VOL_AMT as RxVol, GEN_VOL_AMT as GenVol

FROM         OPENQUERY(UNITEDDB, 'select UD_ACCT, VENDOR_ID, APPLY_DT, RX_VOL_AMT, GEN_VOL_AMT from united.indexing_gen_rebate where vendor_id=69')
AS Rowset_1
GO
