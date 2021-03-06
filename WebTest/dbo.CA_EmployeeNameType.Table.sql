USE [WebTest]
GO
/****** Object:  Table [dbo].[CA_EmployeeNameType]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_EmployeeNameType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeNameType] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CA_EmployeeNameType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
