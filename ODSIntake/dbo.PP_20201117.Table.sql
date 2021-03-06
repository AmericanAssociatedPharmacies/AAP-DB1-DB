USE [ODSIntake]
GO
/****** Object:  Table [dbo].[PP_20201117]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20201117](
	[L01 Afltn Number] [varchar](500) NULL,
	[Distribution Center Number] [varchar](500) NULL,
	[Customer Number] [varchar](500) NULL,
	[Corporate Item Number] [varchar](500) NULL,
	[Description] [varchar](500) NULL,
	[Size] [varchar](500) NULL,
	[Old Sell] [varchar](500) NULL,
	[New Sell] [varchar](500) NULL,
	[Protection Start Date] [varchar](500) NULL,
	[Protection End Date] [varchar](500) NULL,
	[Average Monthly Usage] [varchar](500) NULL,
	[Unit Sell Dlr] [varchar](500) NULL,
	[Total Usage] [varchar](500) NULL,
	[Prior Month Usage] [varchar](500) NULL,
	[Available From Last Month] [varchar](500) NULL,
	[Usage For Calculation] [varchar](500) NULL,
	[ Price Protection Due ] [varchar](500) NULL
) ON [PRIMARY]
GO
