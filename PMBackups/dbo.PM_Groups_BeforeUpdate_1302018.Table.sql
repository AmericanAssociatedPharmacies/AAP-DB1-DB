USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_Groups_BeforeUpdate_1302018]    Script Date: 12/22/2020 4:47:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups_BeforeUpdate_1302018](
	[Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [varchar](125) NOT NULL,
	[Group_MailTo_Name] [varchar](200) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactName] [varchar](255) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[BusCls] [varchar](50) NULL,
	[AffiliateID] [int] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY]
GO
