USE [AAP]
GO
/****** Object:  Table [dbo].[Pharmacists]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacists](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AccountID] [int] NOT NULL,
	[PharPrime] [smallint] NULL,
	[PharLastName] [varchar](35) NULL,
	[PharFirstName] [varchar](25) NULL,
	[PharTitle] [varchar](20) NULL,
	[PharState] [varchar](2) NULL,
	[PharLicNo] [varchar](20) NULL,
	[PharExpDate] [datetime] NULL,
	[TS] [timestamp] NULL,
 CONSTRAINT [PK_Pharmacists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
