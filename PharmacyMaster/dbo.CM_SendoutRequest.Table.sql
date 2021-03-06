USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[CM_SendoutRequest]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CM_SendoutRequest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GeneratedQuery] [nvarchar](max) NULL,
	[RequestedOptionIds] [nvarchar](500) NULL,
	[RequestedOptionQueries] [nvarchar](1000) NULL,
	[OtherText] [nvarchar](200) NULL,
	[DateToSendRequest] [datetime] NULL,
	[Title] [nvarchar](100) NULL,
	[RequestUser] [nvarchar](150) NULL,
	[RequestEmail] [nvarchar](250) NULL,
	[CreatedTime] [timestamp] NULL,
	[Comments] [nvarchar](max) NULL,
	[Files] [nvarchar](max) NULL,
	[SubmittedBy] [nvarchar](150) NULL,
	[SubmittedTime] [datetime] NULL,
	[MarketingApprovalBy] [nvarchar](150) NULL,
	[MarketingApprovalTime] [datetime] NULL,
	[FinalApprovalBy] [nvarchar](150) NULL,
	[FinalApprovalTime] [datetime] NULL,
	[SentByUser] [nvarchar](150) NULL,
	[SentByTime] [datetime] NULL,
	[SaleApprovalBy] [nvarchar](150) NULL,
	[SaleApprovalTime] [datetime] NULL,
	[isActive] [bit] NULL,
	[ExternalFaxLstOther] [nvarchar](max) NULL,
	[ExternalEmailLstOther] [nvarchar](max) NULL,
	[InternalEmailLstOther] [nvarchar](max) NULL,
	[ContentApprovalBy] [nvarchar](150) NULL,
	[PMAndCorpIdRecipients] [nvarchar](max) NULL,
	[RequestHistories] [nvarchar](max) NULL,
 CONSTRAINT [PK_com_RequestSentOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CM_SendoutRequest] ADD  CONSTRAINT [DF_com_SendoutRequest_isActive]  DEFAULT ((1)) FOR [isActive]
GO
