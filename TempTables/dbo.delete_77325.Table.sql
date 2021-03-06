USE [TempTables]
GO
/****** Object:  Table [dbo].[delete_77325]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_77325](
	[Tran ID] [float] NULL,
	[Line] [float] NULL,
	[ST] [float] NULL,
	[Payee ID] [float] NULL,
	[Payee Name] [nvarchar](255) NULL,
	[RxNumber] [float] NULL,
	[DateClaim] [float] NULL,
	[DateService] [nvarchar](255) NULL,
	[DateReceived] [nvarchar](255) NULL,
	[Type] [float] NULL,
	[paid] [float] NULL,
	[submitted] [float] NULL,
	[adjustments] [float] NULL,
	[patientpaid] [float] NULL,
	[dispfee] [float] NULL,
	[NDC] [float] NULL,
	[F17] [nvarchar](255) NULL,
	[balanced] [nvarchar](255) NULL
) ON [PRIMARY]
GO
