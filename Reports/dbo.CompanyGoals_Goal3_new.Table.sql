USE [Reports]
GO
/****** Object:  Table [dbo].[CompanyGoals_Goal3_new]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyGoals_Goal3_new](
	[Year] [int] NULL,
	[Month] [int] NULL,
	[QMemberCount] [int] NULL,
	[RowcreatedDate] [datetime] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyGoals_Goal3_new] ADD  DEFAULT (getdate()) FOR [RowcreatedDate]
GO
