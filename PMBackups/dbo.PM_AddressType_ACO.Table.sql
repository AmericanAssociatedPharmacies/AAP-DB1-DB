USE [PMBackups]
GO
/****** Object:  Table [dbo].[PM_AddressType_ACO]    Script Date: 12/22/2020 4:47:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AddressType_ACO](
	[address_type_id] [int] IDENTITY(1,1) NOT NULL,
	[address_type_description] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
