USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](150) NOT NULL,
	[RebateReportDisplayName] [varchar](255) NULL,
	[PPVendorID] [int] NULL,
	[Active] [bit] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[ParticipationReportActive] [int] NOT NULL,
	[ParticipationReportRank] [int] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT ((0)) FOR [ParticipationReportActive]
GO
ALTER TABLE [dbo].[Partners] ADD  DEFAULT ((0)) FOR [ParticipationReportRank]
GO
ALTER TABLE [dbo].[Partners]  WITH NOCHECK ADD  CONSTRAINT [FK_Partners_Webpartners_PPVendorID] FOREIGN KEY([PPVendorID])
REFERENCES [dbo].[webpartners] ([PARTNER_ID])
GO
ALTER TABLE [dbo].[Partners] CHECK CONSTRAINT [FK_Partners_Webpartners_PPVendorID]
GO
