USE [RJSReportDelivery]
GO
/****** Object:  StoredProcedure [dbo].[LogClear]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[LogClear]
				AS
				BEGIN			
					IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[LOG]') AND type in (N'U'))
					DROP TABLE [LOG]
				
					CREATE TABLE [LOG](
						[LogID] [int] IDENTITY(1,1) NOT NULL,
						[ThreadID] [varchar](255) NOT NULL,
						[DateTime] [datetime] NOT NULL,
						[TypeOfStatus] [varchar](20) NOT NULL,
						[Destination] [varchar](255) NOT NULL,
						[TypeOfFile] [varchar](10) NOT NULL,
						[SpoolFileQueue] [varchar](10) NOT NULL,
						[SpoolFileLibrary] [varchar](10) NOT NULL,
						[SpoolFileName] [varchar](10) NOT NULL,
						[SpoolFileUserData] [varchar](10) NOT NULL,
						[SpoolFileFormType] [varchar](10) NOT NULL,
						[SpoolFileUserDefinedData] [varchar](256) NOT NULL,
						[SpoolFileJobName] [varchar](10) NOT NULL,
						[SpoolFileJobUser] [varchar](10) NOT NULL,
						[SpoolFileJobNumber] [varchar](10) NOT NULL,
						[SpoolFileNumber] [varchar](10) NOT NULL,
						[PCFilePath] [varchar](255) NOT NULL,
						[PCFileName] [varchar](255) NOT NULL,
						[FileDate] [datetime] NOT NULL,
						[Description] [varchar](1024) NOT NULL,
						CONSTRAINT [PK_LOG] PRIMARY KEY CLUSTERED 
						(
							[LogID] ASC
						) WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
					) ON [PRIMARY]
				END
			
GO
