USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_RebuildIndexes_APISalesDetail]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/15/2012>
-- Description:	Rebuild Indexes for APISalesDetail
-- =============================================
CREATE PROCEDURE [dbo].[spapi_RebuildIndexes_APISalesDetail]

AS
	BEGIN
 
 
/****** Object:  Index [IDX_WHAccountID_API]    Script Date: 02/15/2012 09:29:42 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[APISalesDetail]') AND name = N'IDX_WHAccountID_API')
DROP INDEX [IDX_WHAccountID_API] ON [dbo].[APISalesDetail] WITH ( ONLINE = OFF )

 
/****** Object:  Index [IDX_NDC_API]    Script Date: 02/15/2012 09:29:54 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[APISalesDetail]') AND name = N'IDX_NDC_API')
DROP INDEX [IDX_NDC_API] ON [dbo].[APISalesDetail] WITH ( ONLINE = OFF )
 
/****** Object:  Index [IDX_INVDATE_API]    Script Date: 02/15/2012 09:30:19 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[APISalesDetail]') AND name = N'IDX_INVDATE_API')
DROP INDEX [IDX_INVDATE_API] ON [dbo].[APISalesDetail] WITH ( ONLINE = OFF )

 
/****** Object:  Index [IDX_WHAccountID_API]    Script Date: 02/15/2012 12:54:08 ******/
CREATE NONCLUSTERED INDEX [IDX_WHAccountID_API] ON [dbo].[APISalesDetail] 
(
	[WHAccountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
/****** Object:  Index [IDX_NDC_API]    Script Date: 02/15/2012 12:54:30 ******/
CREATE NONCLUSTERED INDEX [IDX_NDC_API] ON [dbo].[APISalesDetail] 
(
	[NDC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


/****** Object:  Index [IDX_INVDATE_API]    Script Date: 02/15/2012 12:54:48 ******/
CREATE NONCLUSTERED INDEX [IDX_INVDATE_API] ON [dbo].[APISalesDetail] 
(
	[InvDate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
  
END








GO
