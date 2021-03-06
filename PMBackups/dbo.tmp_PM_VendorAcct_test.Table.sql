USE [PMBackups]
GO
/****** Object:  Table [dbo].[tmp_PM_VendorAcct_test]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PM_VendorAcct_test](
	[PMID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[isPrimary] [int] NOT NULL,
	[VendAcctNum] [varchar](32) NOT NULL,
	[PVA] [varchar](30) NULL,
	[PaymentTerms] [varchar](50) NULL,
	[Source] [varchar](3) NOT NULL,
	[PVAEffectiveDate] [datetime] NULL,
 CONSTRAINT [PK_PM_VendorAccts] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[VendorID] ASC,
	[VendAcctNum] ASC,
	[Source] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tmp_PM_VendorAcct_test]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_VendorAccts_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tmp_PM_VendorAcct_test] CHECK CONSTRAINT [FK_PM_VendorAccts_PM_Pharmacy]
GO
