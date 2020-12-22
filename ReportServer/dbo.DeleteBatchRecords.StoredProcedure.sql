USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBatchRecords]    Script Date: 12/22/2020 5:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteBatchRecords]
@BatchID uniqueidentifier
AS
SET NOCOUNT OFF
DELETE
FROM [Batch]
WHERE BatchID = @BatchID
GO
