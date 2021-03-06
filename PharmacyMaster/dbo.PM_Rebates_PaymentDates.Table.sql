USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Rebates_PaymentDates]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PaymentDates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RebateMonth] [datetime] NOT NULL,
	[RebateType] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NULL,
 CONSTRAINT [CPK_PM_Rebates_PaymentDates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
