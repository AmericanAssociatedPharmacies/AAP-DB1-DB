USE [RJSReportDelivery]
GO
/****** Object:  Table [dbo].[iFormsRuntimeParameters]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iFormsRuntimeParameters](
	[RuntimeKey] [varchar](32) NOT NULL,
	[RuntimeValue] [varchar](512) NOT NULL,
	[DestinationId] [int] NOT NULL
) ON [PRIMARY]
GO
