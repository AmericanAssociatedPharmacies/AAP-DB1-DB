USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_SmartD_Donna]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SmartD_Donna](
	[Chain Code] [float] NULL,
	[State] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[AAP#] [nvarchar](255) NULL,
	[NCPDP] [nvarchar](255) NULL,
	[NPI] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[FedID] [nvarchar](255) NULL,
	[DEA] [nvarchar](255) NULL,
	[StateLicNo] [nvarchar](255) NULL,
	[StateMedicaidNo] [nvarchar](255) NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL
) ON [PRIMARY]
GO
