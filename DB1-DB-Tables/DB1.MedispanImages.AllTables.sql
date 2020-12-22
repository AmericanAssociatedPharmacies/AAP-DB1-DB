USE [MedispanImages]
GO
/****** Object:  Table [Archive].[IM2DMFG_M]    Script Date: 12/22/2020 2:58:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[IM2DMFG_M](
	[Manufacturer_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Manufacturer_Name] [nvarchar](30) NULL,
	[Reserve] [nvarchar](39) NULL,
PRIMARY KEY CLUSTERED 
(
	[Manufacturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[IM2IMG_N]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[IM2IMG_N](
	[Image_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Image_Filename] [nvarchar](20) NULL,
	[Reserve] [nvarchar](17) NULL,
PRIMARY KEY CLUSTERED 
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[IM2SUM_A]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[IM2SUM_A](
	[Record_Type] [varchar](3) NOT NULL,
	[Reserve_1] [nvarchar](1) NULL,
	[Sequence_Number] [int] NOT NULL,
	[Reserve_2] [nvarchar](1) NULL,
	[Comment_Marker] [nvarchar](1) NULL,
	[Data_or_Comment] [nvarchar](87) NULL,
PRIMARY KEY CLUSTERED 
(
	[Record_Type] ASC,
	[Sequence_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[IM2UDIJ_L]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[IM2UDIJ_L](
	[Unique_Drug_ID] [numeric](19, 0) NOT NULL,
	[Start_Date] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Stop_Date] [bigint] NULL,
	[Image_ID] [bigint] NULL,
	[Reserve] [nvarchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[Unique_Drug_ID] ASC,
	[Start_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[IM2UDRUG_K]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[IM2UDRUG_K](
	[Unique_Drug_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Dosage_Form_ID] [int] NULL,
	[External_Drug_ID] [nvarchar](20) NULL,
	[Manufacturer_ID] [bigint] NULL,
	[Reserve] [nvarchar](26) NULL,
PRIMARY KEY CLUSTERED 
(
	[Unique_Drug_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[IM2VAL_D]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[IM2VAL_D](
	[Field_Identifier] [varchar](4) NOT NULL,
	[Field_Value] [varchar](15) NOT NULL,
	[Language_Code] [int] NOT NULL,
	[Value_Description] [nvarchar](40) NULL,
	[Value_Abbreviation] [nvarchar](15) NULL,
	[Reserve] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Field_Identifier] ASC,
	[Field_Value] ASC,
	[Language_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IM2DMFG_M]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2DMFG_M](
	[Manufacturer_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Manufacturer_Name] [nvarchar](30) NULL,
	[Reserve] [nvarchar](39) NULL,
PRIMARY KEY CLUSTERED 
(
	[Manufacturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IM2IMG_N]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2IMG_N](
	[Image_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Image_Filename] [nvarchar](20) NULL,
	[Reserve] [nvarchar](17) NULL,
PRIMARY KEY CLUSTERED 
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IM2SUM_A]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2SUM_A](
	[Record_Type] [varchar](3) NOT NULL,
	[Reserve_1] [nvarchar](1) NULL,
	[Sequence_Number] [int] NOT NULL,
	[Reserve_2] [nvarchar](1) NULL,
	[Comment_Marker] [nvarchar](1) NULL,
	[Data_or_Comment] [nvarchar](87) NULL,
PRIMARY KEY CLUSTERED 
(
	[Record_Type] ASC,
	[Sequence_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IM2UDIJ_L]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2UDIJ_L](
	[Unique_Drug_ID] [numeric](19, 0) NOT NULL,
	[Start_Date] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Stop_Date] [bigint] NULL,
	[Image_ID] [bigint] NULL,
	[Reserve] [nvarchar](35) NULL,
PRIMARY KEY CLUSTERED 
(
	[Unique_Drug_ID] ASC,
	[Start_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IM2UDRUG_K]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2UDRUG_K](
	[Unique_Drug_ID] [numeric](19, 0) NOT NULL,
	[Transaction_Code] [nvarchar](1) NULL,
	[Dosage_Form_ID] [int] NULL,
	[External_Drug_ID] [nvarchar](20) NULL,
	[Manufacturer_ID] [bigint] NULL,
	[Reserve] [nvarchar](26) NULL,
PRIMARY KEY CLUSTERED 
(
	[Unique_Drug_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IM2VAL_D]    Script Date: 12/22/2020 2:58:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IM2VAL_D](
	[Field_Identifier] [varchar](4) NOT NULL,
	[Field_Value] [varchar](15) NOT NULL,
	[Language_Code] [int] NOT NULL,
	[Value_Description] [nvarchar](40) NULL,
	[Value_Abbreviation] [nvarchar](15) NULL,
	[Reserve] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Field_Identifier] ASC,
	[Field_Value] ASC,
	[Language_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
