USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[CM_DistributionList]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_DistributionList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
	[ListType] [nvarchar](50) NOT NULL,
	[Ids] [nvarchar](max) NOT NULL,
	[Exceptions] [nvarchar](max) NULL,
 CONSTRAINT [PK_com_DistributionList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
