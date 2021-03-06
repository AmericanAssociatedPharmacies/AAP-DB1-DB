USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmFolderInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmFolderInsert]
		@FolderTitle [varchar](256),
		@ParentFolder [char](36) = NULL,
		@FolderKey [char](36) OUTPUT,
		@ErrorMessage [varchar](255) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		SET NOCOUNT ON;

		-- Declare module level vars
		DECLARE @ParentHi INT; -- High value of parent
		DECLARE @SetLo INT; -- High value of parent
		DECLARE @SetHi INT; -- High value of parent
		DECLARE @RecCount INT; -- Used to store results of record count

		-- See if we got a parent key
		IF @ParentFolder IS NULL
		BEGIN
			-- Use the highert value found. This will place the new folder in the highest level of the tree
			SET @ParentHi = (SELECT Max(SetHi) FROM dmFolder);
			IF @ParentHi Is Null
				SET @ParentHi = 1;
		END
		ELSE
		BEGIN
			-- Should get a 1 count on this if a valid parent key was passed
			SET @RecCount = (SELECT Count(*) FROM dmFolder WHERE FolderKey = @ParentFolder);
			IF @RecCount != 1
			BEGIN
				-- Set return message and dont proceed any further
				SET @ErrorMessage = 'Parent folder could not be found.';
				RETURN -1;
			END;
			-- Get the high value of the parent
			SET @ParentHi = (SELECT Max(SetHi) FROM dmFolder  WHERE FolderKey = @ParentFolder);
		END;

		-- Set the set values for the new folder
		SET @SetLo = @ParentHi;
		SET @SetHi = @ParentHi + 1;

		-- Get a new key value
		SET @FolderKey = NEWID();

		-- Increment all of the set keys that are equal and greater then parent hi key
		UPDATE dmFolder
		SET SetLo = SetLo + 2
		WHERE SetLo >= @ParentHi;

		UPDATE dmFolder
		SET SetHi = SetHi + 2
		WHERE SetHi >= @ParentHi;

		INSERT INTO dmFolder 	(FolderKey, FolderTitle, SetLo, SetHi)
		VALUES (@FolderKey, @FolderTitle, @SetLo, @SetHi);

		-- If an error occurred then return the error number
		IF @@ERROR <> 0
			RETURN @@ERROR;
		Else
			RETURN 0;
	END;
GO
