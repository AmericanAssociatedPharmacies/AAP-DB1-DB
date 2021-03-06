USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[VendorTransaction]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorTransaction](
	[TransactionID] [int] IDENTITY(1001,1) NOT NULL,
	[PaidDt] [smalldatetime] NULL,
	[VendorID] [int] NULL,
 CONSTRAINT [PK_VendorTransaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VendorTransaction]  WITH NOCHECK ADD  CONSTRAINT [FK_VendorTransaction_VendorID] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Partners] ([VendorID])
GO
ALTER TABLE [dbo].[VendorTransaction] CHECK CONSTRAINT [FK_VendorTransaction_VendorID]
GO
