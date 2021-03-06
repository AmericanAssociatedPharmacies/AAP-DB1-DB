USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_RebuildIdx_VendorVolumeRebate]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Vrindha Nair>
-- Create date: <05/19/2015>
-- Description:	Rebuild Indexes for VendorVolumeRebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_RebuildIdx_VendorVolumeRebate]

AS
	BEGIN

/****** Object:  Index [idx_AccruedEnddt]    Script Date: 05/19/2015 13:53:31 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idx_AccruedEnddt')
DROP INDEX [idx_AccruedEnddt] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )


/****** Object:  Index [idx_AccruedStartdt]    Script Date: 05/19/2015 13:54:03 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idx_AccruedStartdt')
DROP INDEX [idx_AccruedStartdt] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [idx_FileID]    Script Date: 05/19/2015 13:54:24 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idx_FileID')
DROP INDEX [idx_FileID] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )


/****** Object:  Index [idx_PMID]    Script Date: 05/19/2015 13:55:09 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idx_PMID')
DROP INDEX [idx_PMID] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [idx_TranID]    Script Date: 05/19/2015 13:55:38 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idx_TranID')
DROP INDEX [idx_TranID] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [idx_UDNo]    Script Date: 05/19/2015 13:56:01 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idx_UDNo')
DROP INDEX [idx_UDNo] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [idx_VendorID]    Script Date: 05/19/2015 13:56:41 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idx_VendorID')
DROP INDEX [idx_VendorID] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [idxAffiliate]    Script Date: 05/19/2015 13:56:56 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idxAffiliate')
DROP INDEX [idxAffiliate] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [idxstorename]    Script Date: 05/19/2015 13:57:23 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idxstorename')
DROP INDEX [idxstorename] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [idxStorePaidDt]    Script Date: 05/19/2015 13:57:48 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'idxStorePaidDt')
DROP INDEX [idxStorePaidDt] ON [dbo].[VendorVolumeRebate] WITH ( ONLINE = OFF )

/****** Object:  Index [PK_VendorVolumeRebate]    Script Date: 05/19/2015 13:58:20 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[VendorVolumeRebate]') AND name = N'PK_VendorVolumeRebate')
ALTER TABLE [dbo].[VendorVolumeRebate] DROP CONSTRAINT [PK_VendorVolumeRebate]

------------------------------------------------------------------------------------------------------------------------------------------------------

/****** Object:  Index [idx_AccruedEnddt]    Script Date: 05/19/2015 13:35:25 ******/
CREATE NONCLUSTERED INDEX [idx_AccruedEnddt] ON [dbo].[VendorVolumeRebate] 
(
	[AccruedEnddt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idx_AccruedStartdt]    Script Date: 05/19/2015 13:35:40 ******/
CREATE NONCLUSTERED INDEX [idx_AccruedStartdt] ON [dbo].[VendorVolumeRebate] 
(
	[AccruedStartdt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idx_FileID]    Script Date: 05/19/2015 13:36:45 ******/
CREATE NONCLUSTERED INDEX [idx_FileID] ON [dbo].[VendorVolumeRebate] 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idx_PMID]    Script Date: 05/19/2015 13:38:55 ******/
CREATE NONCLUSTERED INDEX [idx_PMID] ON [dbo].[VendorVolumeRebate] 
(
	[PMID] DESC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idx_TranID]    Script Date: 05/19/2015 13:39:38 ******/
CREATE NONCLUSTERED INDEX [idx_TranID] ON [dbo].[VendorVolumeRebate] 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idx_UDNo]    Script Date: 05/19/2015 13:40:38 ******/
CREATE NONCLUSTERED INDEX [idx_UDNo] ON [dbo].[VendorVolumeRebate] 
(
	[UDNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idx_VendorID]    Script Date: 05/19/2015 13:41:48 ******/
CREATE NONCLUSTERED INDEX [idx_VendorID] ON [dbo].[VendorVolumeRebate] 
(
	[VendorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idxAffiliate]    Script Date: 05/19/2015 13:42:31 ******/
CREATE NONCLUSTERED INDEX [idxAffiliate] ON [dbo].[VendorVolumeRebate] 
(
	[Affiliate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idxstorename]    Script Date: 05/19/2015 13:43:14 ******/
CREATE NONCLUSTERED INDEX [idxstorename] ON [dbo].[VendorVolumeRebate] 
(
	[StoreName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [idxStorePaidDt]    Script Date: 05/19/2015 13:43:41 ******/
CREATE NONCLUSTERED INDEX [idxStorePaidDt] ON [dbo].[VendorVolumeRebate] 
(
	[StorePaidDt] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [PK_VendorVolumeRebate]    Script Date: 05/19/2015 13:44:22 ******/
ALTER TABLE [dbo].[VendorVolumeRebate] ADD  CONSTRAINT [PK_VendorVolumeRebate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

END
GO
