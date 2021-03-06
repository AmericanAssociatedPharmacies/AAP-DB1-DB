USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_AddressMaster_BCO]    Script Date: 12/22/2020 4:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressMaster_BCO](
	[PK_AddressMaster] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Address_Type_Id] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](100) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactFirst] [varchar](50) NULL,
	[ContactLast] [varchar](50) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Fax] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[AlternatePhone] [varchar](12) NULL
) ON [PRIMARY]
GO
