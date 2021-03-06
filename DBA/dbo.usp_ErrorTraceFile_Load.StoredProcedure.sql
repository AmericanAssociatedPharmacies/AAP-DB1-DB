USE [DBA]
GO
/****** Object:  StoredProcedure [dbo].[usp_ErrorTraceFile_Load]    Script Date: 12/22/2020 4:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_ErrorTraceFile_Load]

AS

SET NOCOUNT ON;

BEGIN


DECLARE @Trace NVARCHAR(255)
, @RowCount INT
, @varTraceID INT

	SET @Trace = 'E:\DBA\Trace\ErrorTrace\ErrorOnlyTrace.trc'

	--Get row count for trace
	SELECT @RowCount = COUNT(*)
	FROM(SELECT TraceID, Property, TRY_CONVERT(VARCHAR(255),Value) AS Value
			FROM sys.fn_trace_getinfo(0)
			) AS dt 
	WHERE Value LIKE '%ErrorOnlyTrace.trc'

IF @RowCount = 0
BEGIN

	RETURN

END

ELSE IF @RowCount > 0

BEGIN
BEGIN TRY

	--Get the TraceID
	SELECT  @varTraceID = dt.TraceID
	FROM(SELECT TraceID, Property, TRY_CONVERT(VARCHAR(255),Value) AS Value
			FROM sys.fn_trace_getinfo(0)
			) AS dt 
	WHERE Value LIKE '%ErrorOnlyTrace.trc'

	--Stop the trace
	EXEC sp_trace_setstatus @traceid = @varTraceID, @status = 0

	--Load trace results
	INSERT INTO DBA.dbo.ErrorTrace([TextData], [BinaryData], [DatabaseID], [TransactionID], [LineNumber], [NTUserName], [NTDomainName], [HostName], [ClientProcessID]
									, [ApplicationName], [LoginName], [SPID], [Duration], [StartTime], [EndTime], [Reads], [Writes], [CPU], [Permissions], [Severity]
									, [EventSubClass], [ObjectID], [Success], [IndexID], [IntegerData], [ServerName], [EventClass], [ObjectType], [NestLevel], [State]
									, [Error], [Mode], [Handle], [ObjectName], [DatabaseName], [FileName], [OwnerName], [RoleName], [TargetUserName], [DBUserName]
									, [LoginSid], [TargetLoginName], [TargetLoginSid], [ColumnPermissions], [LinkedServerName], [ProviderName], [MethodName], [RowCounts]
									, [RequestID], [XactSequence], [EventSequence], [BigintData1], [BigintData2], [GUID], [IntegerData2], [ObjectID2], [Type], [OwnerID]
									, [ParentName], [IsSystem], [Offset], [SourceDatabaseID], [SqlHandle], [SessionLoginName], [PlanHandle], [GroupID]
									)
	SELECT dt.[TextData], dt.[BinaryData], dt.[DatabaseID], dt.[TransactionID], dt.[LineNumber], dt.[NTUserName], dt.[NTDomainName], dt.[HostName], dt.[ClientProcessID]
	, dt.[ApplicationName], dt.[LoginName], dt.[SPID], dt.[Duration], dt.[StartTime], dt.[EndTime], dt.[Reads], dt.[Writes], dt.[CPU], dt.[Permissions], dt.[Severity]
	, dt.[EventSubClass], dt.[ObjectID], dt.[Success], dt.[IndexID], dt.[IntegerData], dt.[ServerName], dt.[EventClass], dt.[ObjectType], dt.[NestLevel], dt.[State]
	, dt.[Error], dt.[Mode], dt.[Handle], dt.[ObjectName], dt.[DatabaseName], dt.[FileName], dt.[OwnerName], dt.[RoleName], dt.[TargetUserName], dt.[DBUserName]
	, dt.[LoginSid], dt.[TargetLoginName], dt.[TargetLoginSid], dt.[ColumnPermissions], dt.[LinkedServerName], dt.[ProviderName], dt.[MethodName], dt.[RowCounts]
	, dt.[RequestID], dt.[XactSequence], dt.[EventSequence], dt.[BigintData1], dt.[BigintData2], dt.[GUID], dt.[IntegerData2], dt.[ObjectID2], dt.[Type], dt.[OwnerID]
	, dt.[ParentName], dt.[IsSystem], dt.[Offset], dt.[SourceDatabaseID], dt.[SqlHandle], dt.[SessionLoginName], dt.[PlanHandle], dt.[GroupID]
	FROM(SELECT [TextData], [BinaryData], [DatabaseID], [TransactionID], [LineNumber], [NTUserName], [NTDomainName], [HostName], [ClientProcessID]
									, [ApplicationName], [LoginName], [SPID], [Duration], [StartTime], [EndTime], [Reads], [Writes], [CPU], [Permissions], [Severity]
									, [EventSubClass], [ObjectID], [Success], [IndexID], [IntegerData], [ServerName], [EventClass], [ObjectType], [NestLevel], [State]
									, [Error], [Mode], [Handle], [ObjectName], [DatabaseName], [FileName], [OwnerName], [RoleName], [TargetUserName], [DBUserName]
									, [LoginSid], [TargetLoginName], [TargetLoginSid], [ColumnPermissions], [LinkedServerName], [ProviderName], [MethodName], [RowCounts]
									, [RequestID], [XactSequence], [EventSequence], [BigintData1], [BigintData2], [GUID], [IntegerData2], [ObjectID2], [Type], [OwnerID]
									, [ParentName], [IsSystem], [Offset], [SourceDatabaseID], [SqlHandle], [SessionLoginName], [PlanHandle], [GroupID]
		FROM sys.fn_trace_gettable(@Trace, default) -- this loads the orginal trace and all roll over files
		) AS dt
	ORDER BY StartTime ASC

	--Closes the trace and delete the definition from the server. This does not delete the trace files from the server. They must be removed before this same trace can be restarted.
	EXEC sp_trace_setstatus @traceid = @varTraceID, @status = 2

END TRY
BEGIN CATCH

	DECLARE @ErrorMessage NVARCHAR(4000)
        , @ErrorNumber INT
        , @ErrorSeverity INT
        , @ErrorState INT
        , @ErrorLine INT
        , @ErrorProcedure NVARCHAR(200)

		SELECT 
        @ErrorNumber = ERROR_NUMBER()
        , @ErrorSeverity = ERROR_SEVERITY()
        , @ErrorState = ERROR_STATE()
        , @ErrorLine = ERROR_LINE()
        , @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-')
		, @ErrorMessage = ERROR_MESSAGE();

		RAISERROR 
        (@ErrorMessage 
        , @ErrorSeverity, 1               
        , @ErrorNumber    -- parameter: original error number.
        , @ErrorSeverity  -- parameter: original error severity.
        , @ErrorState     -- parameter: original error state.
        , @ErrorProcedure -- parameter: original error procedure name.
        , @ErrorLine       -- parameter: original error line number.
        );

END CATCH


END

END
GO
