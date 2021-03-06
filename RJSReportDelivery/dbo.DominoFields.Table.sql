USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[DominoFields]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DominoFields](
	[DominoFieldID] [int] IDENTITY(1,1) NOT NULL,
	[DominoFieldGroup] [varchar](20) NOT NULL,
	[DominoFieldPageNumber] [int] NOT NULL,
	[DominoFieldPageLine] [int] NOT NULL,
	[DominoFieldStartPageCol] [int] NOT NULL,
	[DominoFieldEndPageCol] [int] NOT NULL,
	[DominoFieldName] [varchar](50) NOT NULL,
	[DominoFieldUseHardCodedReplace] [varchar](3) NOT NULL,
	[DominoFieldHardCodedReplaceVal] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DominoFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
