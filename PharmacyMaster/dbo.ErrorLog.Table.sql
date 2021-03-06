USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorNumber] [int] NULL,
	[ErrorLine] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorProcedure] [nvarchar](500) NULL,
	[ErrorMessage] [nvarchar](4000) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
