USE [WebTest]
GO
/****** Object:  Table [dbo].[ScanScore2014Q4]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScanScore2014Q4](
	[NABP#] [nvarchar](255) NULL,
	[Corporate Name] [nvarchar](255) NULL,
	[Pharmacy Name#] [nvarchar](255) NULL,
	[CBSA] [nvarchar](255) NULL,
	[Current: Mean Score] [float] NULL,
	[Previous: Mean Score] [float] NULL,
	[Total # of Patients_(Sample Size, N)] [float] NULL,
	[Current Value _(% of Patients)] [float] NULL,
	[Current Rating Equivalent] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars] [float] NULL,
	[Value from Previous Quarter_(% of Patients)] [float] NULL,
	[Previous Quarter Rating Equivalent] [float] NULL,
	[ Current Network Average] [float] NULL,
	[CBSA Average] [float] NULL,
	[Total # of Patients_(Sample Size, N)1] [float] NULL,
	[Current Value _(% of Patients)1] [float] NULL,
	[Current Rating Equivalent1] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars1] [float] NULL,
	[Value from Previous Quarter_(% of Patients)1] [float] NULL,
	[Previous Quarter Rating Equivalent1] [float] NULL,
	[ Current Network Average1] [float] NULL,
	[CBSA Average1] [float] NULL,
	[Total # of Patients_(Sample Size, N)2] [float] NULL,
	[Current Value _(% of Patients)2] [float] NULL,
	[Predicted % of Adherent Patients ] [float] NULL,
	[Current Rating Equivalent2] [nvarchar](255) NULL,
	[Performance Relative to Predicted  ] [float] NULL,
	[# of Patients for Intervention to Reach 5 Stars2] [float] NULL,
	[Value from Previous Quarter_(% of Patients)2] [float] NULL,
	[Previous Quarter Rating Equivalent2] [float] NULL,
	[Total # of Patients_(Sample Size, N)3] [float] NULL,
	[Current Value _(% of Patients)3] [float] NULL,
	[Predicted % of Adherent Patients 1] [float] NULL,
	[Current Rating Equivalent3] [nvarchar](255) NULL,
	[Performance Relative to Predicted  1] [float] NULL,
	[# of Patients for Intervention to Reach 5 Stars3] [float] NULL,
	[Value from Previous Quarter_(% of Patients)3] [float] NULL,
	[Previous Quarter Rating Equivalent3] [float] NULL,
	[Total # of Patients_(Sample Size, N)4] [float] NULL,
	[Current Value _(% of Patients)4] [float] NULL,
	[Predicted % of Adherent Patients 2] [float] NULL,
	[Current Rating Equivalent4] [nvarchar](255) NULL,
	[Performance Relative to Predicted  2] [float] NULL,
	[# of Patients for Intervention to Reach 5 Stars4] [float] NULL,
	[Value from Previous Quarter_(% of Patients)4] [float] NULL,
	[Previous Quarter Rating Equivalent4] [float] NULL,
	[file_date] [smalldatetime] NULL
) ON [PRIMARY]
GO
