USE [reporting]
GO
/****** Object:  Table [TestAS].[Time]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TestAS].[Time](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Day_of_Year] [int] NULL,
	[Day_of_Year_Name] [nvarchar](50) NULL,
	[Day_of_Quarter] [int] NULL,
	[Day_of_Quarter_Name] [nvarchar](50) NULL,
	[Day_of_Month] [int] NULL,
	[Day_of_Month_Name] [nvarchar](50) NULL,
	[Month_of_Year] [int] NULL,
	[Month_of_Year_Name] [nvarchar](50) NULL,
	[Month_of_Quarter] [int] NULL,
	[Month_of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_of_Year] [int] NULL,
	[Quarter_of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Year] [datetime] NULL,
	[Fiscal_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Quarter] [datetime] NULL,
	[Fiscal_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Month] [datetime] NULL,
	[Fiscal_Month_Name] [nvarchar](50) NULL,
	[Fiscal_Day] [datetime] NULL,
	[Fiscal_Day_Name] [nvarchar](50) NULL,
	[Fiscal_Day_of_Year] [int] NULL,
	[Fiscal_Day_of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Day_of_Quarter] [int] NULL,
	[Fiscal_Day_of_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Day_of_Month] [int] NULL,
	[Fiscal_Day_of_Month_Name] [nvarchar](50) NULL,
	[Fiscal_Month_of_Year] [int] NULL,
	[Fiscal_Month_of_Year_Name] [nvarchar](50) NULL,
	[Fiscal_Month_of_Quarter] [int] NULL,
	[Fiscal_Month_of_Quarter_Name] [nvarchar](50) NULL,
	[Fiscal_Quarter_of_Year] [int] NULL,
	[Fiscal_Quarter_of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Month' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Day_of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Day_of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Quarter' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Month_of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Month_of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter_of_Year' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Fiscal_Quarter_of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'COLUMN',@level2name=N'Fiscal_Quarter_of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time', @level2type=N'CONSTRAINT',@level2name=N'PK_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'Time' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'6ecd20aa-52ac-497b-a142-20ceac4f731b' , @level0type=N'SCHEMA',@level0name=N'TestAS', @level1type=N'TABLE',@level1name=N'Time'
GO
