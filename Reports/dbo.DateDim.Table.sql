USE [Reports]
GO
/****** Object:  Table [dbo].[DateDim]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateDim](
	[DateKey] [int] NOT NULL,
	[TheDate] [smalldatetime] NOT NULL,
	[DayOfMonth] [int] NOT NULL,
	[DayOfYear] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[DayName] [varchar](9) NOT NULL,
	[WeekOfYear] [int] NOT NULL,
	[WeekName] [varchar](7) NOT NULL,
	[MonthOfYear] [int] NOT NULL,
	[MonthName] [varchar](9) NOT NULL,
	[Quarter] [int] NOT NULL,
	[QuarterName] [char](7) NOT NULL,
	[Year] [int] NOT NULL,
	[IsWeekday] [bit] NOT NULL,
	[DayOfQuarter] [int] NOT NULL,
 CONSTRAINT [CPK_DateDim] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
