USE [RJSReportDelivery]
GO
/****** Object:  StoredProcedure [dbo].[LogSearchDESC]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[LogSearchDESC]
					@start [int],
					@pagesize [int],
					@fieldname [varchar](50),
					@searchvalue [varchar](50)
				AS
				BEGIN
					SELECT b.[LogID]
						  ,b.[ThreadID]
						  ,b.[DateTime]
						  ,b.[TypeOfStatus]
						  ,b.[Destination]
						  ,b.[TypeOfFile]
						  ,b.[SpoolFileQueue]
						  ,b.[SpoolFileLibrary]
						  ,b.[SpoolFileName]
						  ,b.[SpoolFileUserData]
						  ,b.[SpoolFileFormType]
						  ,b.[SpoolFileUserDefinedData]
						  ,b.[SpoolFileJobName]
						  ,b.[SpoolFileJobUser]
						  ,b.[SpoolFileJobNumber]
						  ,b.[SpoolFileNumber]
						  ,b.[PCFilePath]
						  ,b.[PCFileName]
						  ,b.[FileDate]
						  ,b.[Description]
					FROM (SELECT [LogID], 
							ROW_NUMBER() OVER(ORDER BY [LogID] DESC) as RowNum 
						  FROM [LOG]) as a   
					INNER JOIN [LOG] b ON a.LogID = b.LogID 
					WHERE RowNum BETWEEN @start AND (@start + @pageSize)
					AND @fieldname = @searchvalue
				END
			
GO
