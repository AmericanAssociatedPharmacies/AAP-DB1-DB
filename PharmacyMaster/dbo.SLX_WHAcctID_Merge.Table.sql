USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[SLX_WHAcctID_Merge]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SLX_WHAcctID_Merge](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WHAccountIDOld] [varchar](50) NULL,
	[WHAccountIDNew] [varchar](50) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_SLX_WHAcctID_Merge] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
