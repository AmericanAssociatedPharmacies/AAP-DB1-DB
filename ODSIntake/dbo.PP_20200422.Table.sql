USE [ODSIntake]
GO
/****** Object:  Table [dbo].[PP_20200422]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_20200422](
	[State] [nvarchar](255) NULL,
	[Sub-Affiliation] [nvarchar](255) NULL,
	[Customer Unique] [nvarchar](255) NULL,
	[L01 Afltn Name] [nvarchar](255) NULL,
	[Distribution Center Number] [float] NULL,
	[Customer Number] [float] NULL,
	[Customer Name] [nvarchar](255) NULL,
	[Corporate Item Number] [float] NULL,
	[Description] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Supplier] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Old Sell] [money] NULL,
	[New Sell] [money] NULL,
	[% Change] [float] NULL,
	[Protection Start Date] [datetime] NULL,
	[Protection End Date] [datetime] NULL,
	[Previous 3 Months Historical Usage] [float] NULL,
	[Average Monthly Usage] [float] NULL,
	[Unit Sell Dlr] [money] NULL,
	[Usage] [float] NULL,
	[Returns] [float] NULL,
	[Total Usage] [float] NULL,
	[Prior Month Usage] [float] NULL,
	[Available From Last Month] [float] NULL,
	[Overage Last Month] [float] NULL,
	[Total Owed] [float] NULL,
	[Usage For Calculation] [float] NULL,
	[Price Protection Due] [money] NULL,
	[Comments] [nvarchar](255) NULL
) ON [PRIMARY]
GO
