USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[Tmp_DianeList]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tmp_DianeList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[inserted_at] [datetime] NULL,
	[NCPDP] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tmp_DianeList] ADD  DEFAULT (getdate()) FOR [inserted_at]
GO
