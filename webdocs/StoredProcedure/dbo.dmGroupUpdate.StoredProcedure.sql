USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGroupUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGroupUpdate]
		@GroupKey [char](36),
		@GroupName [varchar](256),
		@Description [varchar](1024),
		@GroupLoginMessage [varchar](2048)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmGroup
				SET GroupName = @GroupName,
					[Description] = @Description,
					GroupLoginMessage = @GroupLoginMessage
				WHERE GroupKey = @GroupKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmGroupUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;
		RETURN(0);
	END;
GO
