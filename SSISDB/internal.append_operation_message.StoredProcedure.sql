USE [SSISDB]
GO
/****** Object:  StoredProcedure [internal].[append_operation_message]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [internal].[append_operation_message]
        @operation_id       bigint,                             
        @message_type       int,                                
        @message_time          datetimeoffset,                     
        @message_source     smallint,                           
        @message            nvarchar(max),                      
        @extended_info_id   bigint = NULL
AS
SET NOCOUNT ON
                   

    IF [internal].[check_permission] 
    (
        4,
        @operation_id,
        2
    ) = 0
    BEGIN
        RAISERROR(27143, 16, 5, @operation_id) WITH NOWAIT;
        RETURN 1;      
    END

   INSERT INTO [internal].[operation_messages] 
           ([operation_id], 
            [message_type], 
            [message_time],
            [message_source_type], 
            [message], 
            [extended_info_id])
        VALUES(
            @operation_id,  
            @message_type,
            @message_time,
            @message_source,
            @message,
            @extended_info_id)
    RETURN 0
GO
