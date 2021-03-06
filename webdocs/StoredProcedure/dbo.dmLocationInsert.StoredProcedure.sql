USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmLocationInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmLocationInsert]
		@Path [varchar](255),
		@PathFTP [varchar](255),
		@PathUNC [varchar](255),
		@AutoSynch [bit],
		@LocationKey [char](36) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			SET @LocationKey = NEWID()

			INSERT INTO dmLocation
				(LocationKey,Path,PathFTP,PathUNC,AutoSynch)
				VALUES (@LocationKey,@Path,@PathFTP,@PathUNC,@AutoSynch);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmLocationInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
