USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Account_Test]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Account_Test](
	[SL Account No] [char](12) NOT NULL,
	[Account Name] [varchar](128) NULL,
	[PMID] [varchar](256) NULL,
	[Phone] [varchar](32) NULL,
	[Phone2] [varchar](32) NULL,
	[Fax] [varchar](32) NULL,
	[Website] [varchar](128) NULL,
	[Sales Person] [varchar](256) NULL,
	[Type] [varchar](64) NULL,
	[Sub Type] [varchar](64) NULL,
	[Status] [varchar](64) NULL,
	[Business Description] [varchar](2000) NULL,
	[Description] [varchar](64) NULL,
	[Primary Address] [varchar](64) NULL,
	[Street 1] [varchar](64) NULL,
	[City] [varchar](32) NULL,
	[State] [varchar](32) NULL,
	[Zip] [varchar](24) NULL,
	[Country] [varchar](64) NULL,
	[Corporate Name] [varchar](80) NULL,
	[Sales Territory] [varchar](32) NULL,
	[Last Sales Call] [datetime] NULL,
	[Avg Comb Vol] [varchar](20) NULL,
	[DEA] [varchar](15) NULL,
	[MC Network] [varchar](256) NULL,
	[Featured Program Compliance Guardian] [varchar](1) NULL,
	[AAP Account No] [varchar](32) NULL,
	[API Account Number] [varchar](32) NULL
) ON [PRIMARY]
GO
