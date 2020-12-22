USE [API]
GO
/****** Object:  Table [dbo].[tmp_DrugMaster_ControlledSubstance]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_DrugMaster_ControlledSubstance](
	[NDC] [varchar](11) NOT NULL,
	[PS] [numeric](8, 3) NULL,
	[DrugName] [varchar](25) NULL,
	[DEA] [int] NOT NULL
) ON [PRIMARY]
GO
