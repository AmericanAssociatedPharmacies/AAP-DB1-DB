USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

		CREATE PROCEDURE [dbo].[dmDocumentUpdate]
			@DocumentKey [char](36),
			@DocumentTitle varchar(256),
			@DocTypeKey [char](36),
			@LocationKey [char](36),
			@InsertDate datetime,
			@LastChangedDate datetime,
			@CheckoutUserKey [char](36),
			@FullTextIndexStatus varchar(256),
			@NeedsKeyIndex int,
			@NeedsFullTextIndex int,
			@FolderKey [char](36),
			@ExpireDate datetime,
			@UserDefinedTitle [varchar](256) = '',
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
			@UserDefined30 [varchar](256) = ''
		WITH EXECUTE AS CALLER
		AS
		BEGIN
			BEGIN TRAN;
				SET NOCOUNT ON;

				UPDATE dmDocument
					SET DocumentTitle = @DocumentTitle, DocTypeKey = @DocTypeKey, LocationKey = @LocationKey,
						InsertDate =@InsertDate,ChangeDate = @LastChangedDate, CheckoutUserKey = @CheckoutUserKey,
						FullTextIndexStatus = @FullTextIndexStatus,NeedsKeyIndex = @NeedsKeyIndex,NeedsFullTextIndex = @NeedsFullTextIndex,FolderKey = @FolderKey,[ExpireDate]=@ExpireDate,
						UserDefined1 = @UserDefined1,UserDefined2 = @UserDefined2, UserDefined3 = @UserDefined3,UserDefined4 = @UserDefined4,
						UserDefined5 = @UserDefined5,UserDefined6 = @UserDefined6,UserDefined7 = @UserDefined7,UserDefined8 = @UserDefined8,
						UserDefined9 = @UserDefined9,UserDefined10 = @UserDefined10,UserDefined11 = @UserDefined11,UserDefined12 = @UserDefined12,
						UserDefined13 = @UserDefined13,UserDefined14 = @UserDefined14,UserDefined15 = @UserDefined15,UserDefined16 = @UserDefined16,
						UserDefined17 = @UserDefined17,UserDefined18 = @UserDefined18,UserDefined19 = @UserDefined19,UserDefined20 = @UserDefined20,
						UserDefined21 = @UserDefined21,UserDefined22 = @UserDefined22,UserDefined23 = @UserDefined23,UserDefined24 = @UserDefined24,
						UserDefined25 = @UserDefined25,UserDefined26 = @UserDefined26,UserDefined27 = @UserDefined27,UserDefined28 = @UserDefined28,
						UserDefined29 = @UserDefined29,UserDefined30 = @UserDefined30
					WHERE DocumentKey = @DocumentKey;

				IF (@@error!=0)
				BEGIN
					RAISERROR ('dmDocumentUpdate : Cannot update record. ',100,1);
					ROLLBACK TRAN;
					RETURN(1);
				END;
			COMMIT TRAN;

			RETURN(0);
		END;
			
GO
