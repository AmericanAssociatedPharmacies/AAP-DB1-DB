USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_MCQuitdateButNoEffectiveDate]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MCQuitdateButNoEffectiveDate](
	[NCPDP] [varchar](7) NULL,
	[PAYEE_ID] [int] NULL,
	[Total_Paid_In90Days] [float] NULL,
	[LAST_PAID] [datetime] NULL,
	[CHECK_NAME] [varchar](50) NULL,
	[ACTIVE_PAYEE] [int] NULL,
	[PMID] [int] NULL,
	[MCare] [int] NULL,
	[NPP] [varchar](3) NOT NULL,
	[AAP] [varchar](30) NULL,
	[MCEffectiveDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[AccountName] [varchar](65) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactFullName] [varchar](255) NULL,
	[TM] [varchar](2) NULL,
	[TMName] [varchar](71) NULL
) ON [PRIMARY]
GO
