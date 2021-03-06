USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmActivityUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmActivityUpdate]
		@ActivityKey [char](36),
		@DocumentKey [char](36),
		@UserKey [char](36),
		@ActivityDesc [varchar](256)

	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE dmActivity
				SET DocumentKey = @DocumentKey,UserKey = @UserKey, ActivityDesc = @ActivityDesc
				WHERE ActivityKey = @ActivityKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmActivityUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRAN;

		RETURN(0);
	END;
GO
