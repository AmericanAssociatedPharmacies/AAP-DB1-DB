USE [WebTest]
GO
/****** Object:  Table [dbo].[QC_DDI_backup]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QC_DDI_backup](
	[PharmID] [varchar](10) NULL,
	[PatID] [varchar](50) NULL,
	[DrugName] [varchar](200) NULL,
	[RxNbr] [varchar](50) NULL,
	[RfNbr] [int] NULL,
	[DDIDrugName] [varchar](200) NULL,
	[DDIRxNbr] [varchar](50) NULL,
	[hide] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DDIRfNbr] [int] NULL,
	[Rx Date] [datetime] NULL,
	[DDIRxDate] [datetime] NULL,
	[Day Supply] [int] NULL,
	[DDIDS] [int] NULL
) ON [PRIMARY]
GO
