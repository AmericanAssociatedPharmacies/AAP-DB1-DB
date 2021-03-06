USE [PharmacyMaster]
GO
/****** Object:  Table [SSAS_ControlledSubstance].[MyTime]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SSAS_ControlledSubstance].[MyTime](
	[PK_Date] [datetime] NOT NULL,
	[Date_Name] [nvarchar](50) NULL,
	[Year] [datetime] NULL,
	[Year_Name] [nvarchar](50) NULL,
	[Quarter] [datetime] NULL,
	[Quarter_Name] [nvarchar](50) NULL,
	[Month] [datetime] NULL,
	[Month_Name] [nvarchar](50) NULL,
	[Day_Of_Year] [int] NULL,
	[Day_Of_Year_Name] [nvarchar](50) NULL,
	[Day_Of_Quarter] [int] NULL,
	[Day_Of_Quarter_Name] [nvarchar](50) NULL,
	[Day_Of_Month] [int] NULL,
	[Day_Of_Month_Name] [nvarchar](50) NULL,
	[Month_Of_Year] [int] NULL,
	[Month_Of_Year_Name] [nvarchar](50) NULL,
	[Month_Of_Quarter] [int] NULL,
	[Month_Of_Quarter_Name] [nvarchar](50) NULL,
	[Quarter_Of_Year] [int] NULL,
	[Quarter_Of_Year_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MyTime] PRIMARY KEY CLUSTERED 
(
	[PK_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'PK_Date'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Date_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Day_Of_Month_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Day_Of_Month_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Month_Of_Quarter_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Month_Of_Quarter_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVColumn', @value=N'Quarter_Of_Year_Name' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'COLUMN',@level2name=N'Quarter_Of_Year_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime', @level2type=N'CONSTRAINT',@level2name=N'PK_MyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowGen', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'DSVTable', @value=N'MyTime' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Project', @value=N'83e4c51d-f934-4d64-9727-105b086e0921' , @level0type=N'SCHEMA',@level0name=N'SSAS_ControlledSubstance', @level1type=N'TABLE',@level1name=N'MyTime'
GO
