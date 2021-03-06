USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentInsert]
		@DocumentKey [char](36) OUTPUT,
		@ChangeDate [datetime] = NULL,
		@DocumentTitle [varchar](200),
		@FileName [varchar](255) = '',
		@DocTypeKey [char](36),
		@LocationKey [char](36),
		@LastVerified [datetime] = NULL,
		@UserDefined1 [varchar](256) = '',
		@UserDefined2 [varchar](256) = '',
		@UserDefined3 [varchar](256) = '',
		@UserDefined4 [varchar](256) = '',
		@UserDefined5 [varchar](256) = '',
		@UserDefined6 [varchar](256) = '',
		@UserDefined7 [varchar](256) = '',
		@UserDefined8 [varchar](256) = '',
		@UserDefined9 [varchar](256) = '',
		@UserDefined10 [varchar](256) = '',
		@UserDefined11 [varchar](256) = '',
		@UserDefined12 [varchar](256) = '',
		@UserDefined13 [varchar](256) = '',
		@UserDefined14 [varchar](256) = '',
		@UserDefined15 [varchar](256) = '',
		@UserDefined16 [varchar](256) = '',
		@UserDefined17 [varchar](256) = '',
		@UserDefined18 [varchar](256) = '',
		@UserDefined19 [varchar](256) = '',
		@UserDefined20 [varchar](256) = '',
		@UserDefined21 [varchar](256) = '',
		@UserDefined22 [varchar](256) = '',
		@UserDefined23 [varchar](256) = '',
		@UserDefined24 [varchar](256) = '',
		@UserDefined25 [varchar](256) = '',
		@UserDefined26 [varchar](256) = '',
		@UserDefined27 [varchar](256) = '',
		@UserDefined28 [varchar](256) = '',
		@UserDefined29 [varchar](256) = '',
		@UserDefined30 [varchar](256) = '',
		@InsertDate [datetime] = NULL,
		@CheckoutUserKey [char](36) = '',
		@LocationInsertDate [datetime] = NULL,
		@ExpireDate [datetime] = NULL,
		@FullTextIndexStatus [varchar](255) = '',
		@NeedsKeyIndex [bit] = 1,
		@NeedsFullTextIndex [bit] = 1,
		@FolderKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			IF @ChangeDate IS NULL
				SET @ChangeDate = GETDATE();

			IF @LastVerified IS NULL
				SET @LastVerified = GETDATE();

			IF @InsertDate IS NULL
				SET @InsertDate = GETDATE();

			IF @LocationInsertDate IS NULL
				SET @LocationInsertDate = GETDATE();

			IF @ExpireDate IS NULL
				SET @ExpireDate = DATEADD(year, 1, GETDATE());

			SET @DocumentKey = NEWID();

			INSERT INTO [dbo].[dmDocument]
				(
				[DocumentKey],[ChangeDate],[DocumentTitle],[FileName],[DocTypeKey],[LocationKey],[LastVerified]
				,[UserDefined1],[UserDefined2],[UserDefined3],[UserDefined4],[UserDefined5]
				,[UserDefined6],[UserDefined7],[UserDefined8],[UserDefined9],[UserDefined10]
				,[UserDefined11],[UserDefined12],[UserDefined13],[UserDefined14],[UserDefined15]
				,[UserDefined16],[UserDefined17],[UserDefined18],[UserDefined19],[UserDefined20]
				,[UserDefined21],[UserDefined22],[UserDefined23],[UserDefined24],[UserDefined25]
				,[UserDefined26],[UserDefined27],[UserDefined28],[UserDefined29],[UserDefined30]
				,[InsertDate],[CheckoutUserKey],[LocationInsertDate],[ExpireDate],[FullTextIndexStatus],[NeedsKeyIndex],[NeedsFullTextIndex],[FolderKey]
				)
			VALUES
				(
				@DocumentKey,@ChangeDate,@DocumentTitle,@FileName,@DocTypeKey,@LocationKey,@LastVerified
				,@UserDefined1,@UserDefined2,@UserDefined3,@UserDefined4,@UserDefined5
				,@UserDefined6,@UserDefined7,@UserDefined8,@UserDefined9,@UserDefined10
				,@UserDefined11,@UserDefined12,@UserDefined13,@UserDefined14,@UserDefined15
				,@UserDefined16,@UserDefined17,@UserDefined18,@UserDefined19,@UserDefined20
				,@UserDefined21,@UserDefined22,@UserDefined23,@UserDefined24,@UserDefined25
				,@UserDefined26,@UserDefined27,@UserDefined28,@UserDefined29,@UserDefined30
				,@InsertDate,@CheckoutUserKey,@LocationInsertDate,@ExpireDate,@FullTextIndexStatus,@NeedsKeyIndex,@NeedsFullTextIndex,@FolderKey
				)

			IF @@ERROR <> 0
				BEGIN
					RAISERROR('dmDocumentInsert : Cannot insert record.', 15,1);
					ROLLBACK TRAN;
					RETURN(1);
				END;

		COMMIT TRANSACTION;

		SELECT 0;
	END;
GO
