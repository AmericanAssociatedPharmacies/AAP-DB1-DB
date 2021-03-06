USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[DominoReaders]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DominoReaders](
	[DominoReaderID] [int] IDENTITY(1,1) NOT NULL,
	[DominoReaderFieldGroup] [varchar](20) NOT NULL,
	[DominoReaders] [varchar](8000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DominoReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
