USE [ODSIntake]
GO
/****** Object:  Table [dbo].[FDA_Products]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FDA_Products](
	[ApplNo] [varchar](500) NULL,
	[ProductNo] [varchar](500) NULL,
	[Form] [varchar](500) NULL,
	[Strength] [varchar](500) NULL,
	[ReferenceDrug] [varchar](500) NULL,
	[DrugName] [varchar](500) NULL,
	[ActiveIngredient] [varchar](500) NULL,
	[ReferenceStandard] [varchar](500) NULL
) ON [PRIMARY]
GO
