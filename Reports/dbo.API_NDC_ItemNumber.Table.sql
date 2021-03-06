USE [Reports]
GO
/****** Object:  Table [dbo].[API_NDC_ItemNumber]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_NDC_ItemNumber](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[API_ItemNumber] [varchar](25) NULL,
	[NDC] [varchar](12) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_API_NDC_ItemNumber] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[API_NDC_ItemNumber] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
