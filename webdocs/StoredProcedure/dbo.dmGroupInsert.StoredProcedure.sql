USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGroupInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGroupInsert]
		@GroupName [varchar](256),
		@Description [varchar](1024),
		@GroupLoginMessage [varchar](2048),
		@GroupKey [char](36) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;

		SET NOCOUNT ON;

		SET @GroupKey = NEWID();

		INSERT INTO dmGroup
			(GroupKey, GroupName,[Description],GroupLoginMessage)
			VALUES (@GroupKey, @GroupName,@Description,@GroupLoginMessage);

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmGroupInsert : Cannot insert record. ',15,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		COMMIT TRAN;
		RETURN(0);
	END;
GO
