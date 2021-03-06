USE [WebDev]
GO
/****** Object:  Table [dbo].[DocumentAgreement]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentAgreement](
	[DocumentAgreementID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentAgreementTypeID] [int] NOT NULL,
	[PMID] [int] NOT NULL,
	[DateAcknowledged] [datetime2](7) NOT NULL,
	[LoggedInAs] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DocumentAgreement] PRIMARY KEY CLUSTERED 
(
	[DocumentAgreementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocumentAgreement]  WITH CHECK ADD  CONSTRAINT [FK_DocumentAgreement_DocumentAgreementType] FOREIGN KEY([DocumentAgreementTypeID])
REFERENCES [dbo].[DocumentAgreementType] ([DocumentAgreementTypeID])
GO
ALTER TABLE [dbo].[DocumentAgreement] CHECK CONSTRAINT [FK_DocumentAgreement_DocumentAgreementType]
GO
