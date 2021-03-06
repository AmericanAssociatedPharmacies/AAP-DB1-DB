USE [WebDev]
GO
/****** Object:  Table [dbo].[ScoreCardAnthem_Temp]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreCardAnthem_Temp](
	[NABP#] [float] NULL,
	[Corporate Name] [nvarchar](255) NULL,
	[Pharmacy Name#] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Current: Mean Score] [float] NULL,
	[Previous: Mean Score] [nvarchar](255) NULL,
	[Baseline: Mean Score] [float] NULL,
	[Total # of Patients_(Sample Size, N)] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)] [float] NULL,
	[Current Plan Star  Equivalent] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)] [nvarchar](255) NULL,
	[Previous Quarter Plan Star Equivalent] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)1] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)1] [float] NULL,
	[Current Plan Star  Equivalent1] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars1] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)1] [float] NULL,
	[Previous Quarter Plan Star Equivalent1] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)2] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)2] [float] NULL,
	[Current Plan Star  Equivalent2] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars2] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)2] [float] NULL,
	[Previous Quarter Plan Star Equivalent2] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)3] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)3] [float] NULL,
	[Current Plan Star  Equivalent3] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars3] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)3] [float] NULL,
	[Previous Quarter Plan Star Equivalent3] [nvarchar](255) NULL,
	[Total # of Patients_(Sample Size, N)4] [float] NULL,
	[EQuIPP Raw Score_(% of Patients)4] [float] NULL,
	[Current Plan Star  Equivalent4] [nvarchar](255) NULL,
	[# of Patients for Intervention to Reach 5 Stars4] [float] NULL,
	[EQuIPP Raw Score from Previous Quarter_(% of Patients)4] [float] NULL,
	[Previous Quarter Plan Star Equivalent4] [nvarchar](255) NULL,
	[Improvement Value] [float] NULL,
	[Client] [nvarchar](255) NOT NULL,
	[File_Date] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScoreCardAnthem_Temp] ADD  CONSTRAINT [DF__'ScoreCar__Clien__3EC8DC05]  DEFAULT ('ANTHEM') FOR [Client]
GO
ALTER TABLE [dbo].[ScoreCardAnthem_Temp] ADD  CONSTRAINT [DF__'ScoreCar__File___3FBD003E]  DEFAULT (getdate()) FOR [File_Date]
GO
