USE [WebDev]
GO
/****** Object:  Table [dbo].[CA_EmployeeType]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_EmployeeType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeType] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_CA_EmployeeType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
