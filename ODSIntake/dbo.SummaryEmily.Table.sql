USE [ODSIntake]
GO
/****** Object:  Table [dbo].[SummaryEmily]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SummaryEmily](
	[TM] [float] NULL,
	[Name] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[API #] [float] NULL,
	[Status] [nvarchar](255) NULL,
	[App Recd] [datetime] NULL,
	[AAP#] [float] NULL,
	[API Active] [datetime] NULL,
	[Jul ] [money] NULL,
	[Jun ] [money] NULL,
	[May ] [money] NULL,
	[Apr ] [money] NULL,
	[Mar ] [money] NULL,
	[Feb ] [money] NULL,
	[Jan ] [money] NULL,
	[F16] [nvarchar](255) NULL,
	[Jul 1] [float] NULL,
	[Jun 1] [float] NULL,
	[May 1] [float] NULL,
	[Apr 1] [float] NULL,
	[Mar 1] [float] NULL,
	[Feb 1] [float] NULL,
	[Jan 1] [float] NULL,
	[TTL] [float] NULL
) ON [PRIMARY]
GO
