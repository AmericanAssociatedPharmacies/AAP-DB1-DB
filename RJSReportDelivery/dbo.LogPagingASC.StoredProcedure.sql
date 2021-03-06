USE [RJSReportDelivery]
GO
/****** Object:  StoredProcedure [dbo].[LogPagingASC]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[LogPagingASC]
					@start int, 
					@pagesize int
				AS
				BEGIN
					SET NOCOUNT ON
						
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
							ROW_NUMBER() OVER(ORDER BY [LogID] ASC) as RowNum 
							FROM [LOG]) As a   
					INNER JOIN [LOG] b 
					ON a.LogID = b.LogID 
					WHERE a.RowNum BETWEEN @start AND (@start + @pageSize)
				END
			
GO
