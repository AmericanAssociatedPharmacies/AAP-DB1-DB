USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Error].[usp_ErrorInsert_ManagedErrorLog]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Error].[usp_ErrorInsert_ManagedErrorLog]
		
			@Process VARCHAR(1000)
			, @Message VARCHAR(8000) = NULL
			, @StackTrace VARCHAR(1000) = NULL
			, @Source VARCHAR(1000) = NULL
			, @Procedure VARCHAR(1000) = NULL
			, @LineNumber INT = NULL
			, @InnerException VARCHAR(8000) = NULL
			, @Number INT = NULL
			, @State INT = NULL
			, @TargetSite VARCHAR(1000) = NULL
			, @HelpLink VARCHAR(8000) = NULL
			, @SQLErrorCode INT = NULL
			, @SQLSeverity INT = NULL
			, @Data VARCHAR(8000) = NULL
			, @Server VARCHAR(1000) = NULL
			, @ExceptionType VARCHAR(1000) = NULL

AS


SET NOCOUNT ON;

BEGIN


	INSERT INTO Error.ManagedErrorLog(Process
									, [Message]
									, StackTrace 
									, [Source] 
									, [Procedure] 
									, LineNumber 
									, InnerException 
									, Number 
									, [State] 
									, TargetSite 
									, HelpLink 
									, SQLErrorCode 
									, SQLSeverity 
									, Data 
									, [Server] 
									, ExceptionType 
									)

		VALUES(@Process
				, @Message 
				, @StackTrace 
				, @Source 
				, @Procedure 
				, @LineNumber 
				, @InnerException 
				, @Number 
				, @State 
				, @TargetSite 
				, @HelpLink 
				, @SQLErrorCode 
				, @SQLSeverity 
				, @Data 
				, @Server 
				, @ExceptionType 	
				)





END
GO
