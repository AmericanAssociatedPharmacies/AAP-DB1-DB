USE [TempTables]
GO
/****** Object:  Table [dbo].[import_AAPAV1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_AAPAV1](
	[pmid] [float] NULL,
	[AAPID] [float] NULL,
	[accountname] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[AAPExtended0210] [float] NULL,
	[AAPExtended0310] [float] NULL,
	[AAPExtended0410] [float] NULL,
	[AAPExtendedTotal] [float] NULL,
	[AAPGQ0210] [float] NULL,
	[AAPGQ0310] [float] NULL,
	[AAPGQ0410] [float] NULL,
	[AAPGQTotal] [float] NULL,
	[AAPGE0210] [float] NULL,
	[AAPGE0310] [float] NULL,
	[AAPGE0410] [float] NULL,
	[AAPGETotal] [float] NULL,
	[AAPBrand0210] [float] NULL,
	[AAPBrand0310] [float] NULL,
	[AAPBrand0410] [float] NULL,
	[AAPBrandTotal] [float] NULL,
	[AAPAdminFee0210] [float] NULL,
	[AAPAdminFee0310] [float] NULL,
	[AAPAdminFee0410] [float] NULL,
	[AAPAdminFeeTotal] [float] NULL
) ON [PRIMARY]
GO
