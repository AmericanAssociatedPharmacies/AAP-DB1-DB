USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmActivityCodeInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmActivityCodeInsert]
		@ActivityCode [int],
		@ActivityDesc [varchar](256)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			INSERT INTO dmActivityCode
				(ActivityCode, ActivityDesc)
				VALUES (@ActivityCode, @ActivityDesc);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmActivityCodeInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
