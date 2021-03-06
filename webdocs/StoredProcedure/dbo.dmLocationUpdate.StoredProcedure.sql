USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmLocationUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmLocationUpdate]
		@LocationKey [char](36),
		@Path [varchar](255),
		@PathFTP [varchar](255),
		@PathUNC [varchar](255),
		@AutoSynch [bit]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmLocation
				SET Path = @Path,PathFTP = @PathFTP,PathUNC = @PathUNC,AutoSynch = @AutoSynch
				WHERE LocationKey = @LocationKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmLocationUpdate : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRAN;
		RETURN(0);
	END;
GO
