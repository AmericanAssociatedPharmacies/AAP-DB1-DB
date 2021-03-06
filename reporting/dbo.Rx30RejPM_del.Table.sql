USE [reporting]
GO
/****** Object:  Table [dbo].[Rx30RejPM_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rx30RejPM_del](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[RxNbr] [nvarchar](20) NOT NULL,
	[NCPDP] [nvarchar](15) NULL,
	[NDC] [nvarchar](20) NULL,
	[Fill_dt] [smalldatetime] NULL,
	[Bill_code] [nvarchar](20) NULL,
	[Drug_Name] [nvarchar](100) NULL,
	[Reject_Code] [nvarchar](10) NULL,
	[Reject_Text] [nvarchar](200) NULL,
	[RPH] [nvarchar](5) NULL,
	[Recovered_Amt] [numeric](10, 2) NULL,
	[Reject_Amt] [numeric](10, 2) NULL,
	[Recovery_Text] [nvarchar](300) NULL,
	[Complete] [int] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Complete_Dt] [smalldatetime] NULL,
	[UploadedOn] [datetime] NULL,
 CONSTRAINT [PK_Rx30RejPM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rx30RejPM_del] ADD  CONSTRAINT [DF_Rx30RejPM_Complete]  DEFAULT ((0)) FOR [Complete]
GO
