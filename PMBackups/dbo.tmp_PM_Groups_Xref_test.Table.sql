USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_PM_Groups_Xref_test]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PM_Groups_Xref_test](
	[Grpxref_ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NOT NULL,
	[Group_ID] [int] NOT NULL,
	[Source] [varchar](5) NULL,
 CONSTRAINT [PK_pm_groups_xref] PRIMARY KEY CLUSTERED 
(
	[Grpxref_ID] ASC,
	[PMID] ASC,
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tmp_PM_Groups_Xref_test]  WITH NOCHECK ADD  CONSTRAINT [FK_pm_groups_xref_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tmp_PM_Groups_Xref_test] CHECK CONSTRAINT [FK_pm_groups_xref_PM_Pharmacy]
GO
