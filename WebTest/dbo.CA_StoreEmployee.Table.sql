USE [WebTest]
GO
/****** Object:  Table [dbo].[CA_StoreEmployee]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CA_StoreEmployee](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NULL,
	[NCPDP] [nvarchar](7) NOT NULL,
	[PMID] [int] NOT NULL,
	[FirstName] [nvarchar](64) NULL,
	[MiddleName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [int] NULL,
	[Email] [nvarchar](128) NULL,
	[InActiveDate] [datetime] NULL,
	[EmployeeNameType] [int] NULL,
	[EmployeeType] [int] NULL,
	[IsHIPPATrained] [int] NULL,
	[IsFWATrained] [int] NULL,
 CONSTRAINT [PK_CA_StoreEmployee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_IsHIPPATrained]  DEFAULT ((0)) FOR [IsHIPPATrained]
GO
ALTER TABLE [dbo].[CA_StoreEmployee] ADD  CONSTRAINT [DF_CA_StoreEmployee_IsFWATrained]  DEFAULT ((0)) FOR [IsFWATrained]
GO
