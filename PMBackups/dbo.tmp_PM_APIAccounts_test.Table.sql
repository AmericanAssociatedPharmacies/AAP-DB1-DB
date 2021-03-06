USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_PM_APIAccounts_test]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PM_APIAccounts_test](
	[APIAccountNo] [varchar](20) NOT NULL,
	[PMID] [int] NULL,
	[DEA] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Status] [varchar](32) NULL,
 CONSTRAINT [PK_PM_APIAccount] PRIMARY KEY CLUSTERED 
(
	[APIAccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tmp_PM_APIAccounts_test]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_APIAccounts_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tmp_PM_APIAccounts_test] CHECK CONSTRAINT [FK_PM_APIAccounts_PM_Pharmacy]
GO
