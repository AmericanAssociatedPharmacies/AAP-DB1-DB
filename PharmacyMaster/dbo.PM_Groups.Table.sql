USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Groups]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Groups](
	[Group_ID] [int] IDENTITY(1,1) NOT NULL,
	[Group_Name] [varchar](125) NOT NULL,
	[Group_MailTo_Name] [varchar](200) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[ContactName] [varchar](255) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](255) NULL,
	[BusCls] [varchar](50) NULL,
	[AffiliateID] [int] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL,
 CONSTRAINT [PK_PM_Groups] PRIMARY KEY CLUSTERED 
(
	[Group_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_Groups] ADD  CONSTRAINT [DF__PM_Groups__Creat__308412F8]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PM_Groups] ADD  CONSTRAINT [DF__PM_Groups__Modif__31783731]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[PM_Groups] ADD  CONSTRAINT [DF__PM_Groups__RowVe__326C5B6A]  DEFAULT ((1)) FOR [RowVersion]
GO
