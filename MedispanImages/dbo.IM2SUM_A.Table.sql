USE [MedispanImages]
GO
/****** Object:  Table [dbo].[IM2SUM_A]    Script Date: 12/22/2020 4:40:29 AM ******/
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
