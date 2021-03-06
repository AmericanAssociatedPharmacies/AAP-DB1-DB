USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_RxAllyDataClean]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_RxAllyDataClean](
	[affiliation ] [nvarchar](255) NULL,
	[ncpdp ] [float] NULL,
	[company_name ] [nvarchar](255) NULL,
	[first_name ] [nvarchar](255) NULL,
	[last_name ] [nvarchar](255) NULL,
	[Email Address] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL,
	[fax_number] [nvarchar](255) NULL,
	[Bounced Emails] [nvarchar](255) NULL
) ON [PRIMARY]
GO
