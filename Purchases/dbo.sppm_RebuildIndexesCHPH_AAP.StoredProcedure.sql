USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[sppm_RebuildIndexesCHPH_AAP]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/15/2012>
-- Description:	Rebuild Indexes on the CHPH_AAP table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_RebuildIndexesCHPH_AAP]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/****** Object:  Index [IDX_STORE_CHPH_AAP]    Script Date: 02/15/2012 09:16:45 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CHPH_AAP]') AND name = N'IDX_STORE_CHPH_AAP')
DROP INDEX [IDX_STORE_CHPH_AAP] ON [dbo].[CHPH_AAP] WITH ( ONLINE = OFF )

 
/****** Object:  Index [IDX_PMID_CHPH_AAP]    Script Date: 02/15/2012 09:16:57 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CHPH_AAP]') AND name = N'IDX_PMID_CHPH_AAP')
DROP INDEX [IDX_PMID_CHPH_AAP] ON [dbo].[CHPH_AAP] WITH ( ONLINE = OFF )
 
/****** Object:  Index [IDX_NDC_CHPH_AAP]    Script Date: 02/15/2012 09:17:31 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CHPH_AAP]') AND name = N'IDX_NDC_CHPH_AAP')
DROP INDEX [IDX_NDC_CHPH_AAP] ON [dbo].[CHPH_AAP] WITH ( ONLINE = OFF )

 
/****** Object:  Index [IDX_INVDATE_CHPH_AAP]    Script Date: 02/15/2012 09:17:47 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CHPH_AAP]') AND name = N'IDX_INVDATE_CHPH_AAP')
DROP INDEX [IDX_INVDATE_CHPH_AAP] ON [dbo].[CHPH_AAP] WITH ( ONLINE = OFF )

 
/****** Object:  Index [IDX_STORE_CHPH_AAP]    Script Date: 02/15/2012 09:18:43 ******/
CREATE NONCLUSTERED INDEX [IDX_STORE_CHPH_AAP] ON [dbo].[CHPH_AAP] 
(
	[STORE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
/****** Object:  Index [IDX_PMID_CHPH_AAP]    Script Date: 02/15/2012 09:19:18 ******/
CREATE NONCLUSTERED INDEX [IDX_PMID_CHPH_AAP] ON [dbo].[CHPH_AAP] 
(
	[PMID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
/****** Object:  Index [IDX_NDC_CHPH_AAP]    Script Date: 02/15/2012 09:19:49 ******/
CREATE NONCLUSTERED INDEX [IDX_NDC_CHPH_AAP] ON [dbo].[CHPH_AAP] 
(
	[NDC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
/****** Object:  Index [IDX_INVDATE_CHPH_AAP]    Script Date: 02/15/2012 09:20:13 ******/
CREATE NONCLUSTERED INDEX [IDX_INVDATE_CHPH_AAP] ON [dbo].[CHPH_AAP] 
(
	[INV_DATE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
 
END








GO
