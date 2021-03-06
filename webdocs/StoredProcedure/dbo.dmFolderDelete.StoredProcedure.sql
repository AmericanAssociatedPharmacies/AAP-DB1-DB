USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmFolderDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmFolderDelete]
		@FolderKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		SET NOCOUNT ON;

		-- Declare module level vars
		DECLARE @FolderLo INT; -- Lo value
		DECLARE @FolderHi INT; -- High value
		DECLARE @SetVar INT; -- Variance to deduct from higher folders

		-- Get set values from the folder to be deleted
		DECLARE folder_cursor CURSOR LOCAL FOR
		SELECT SetLo, SetHi  FROM dmFolder
		WHERE FolderKey = @FolderKey;

		OPEN folder_cursor;

		-- Perform the first fetch and store the values in variables.
		-- Note: The variables are in the same order as the columns
		-- in the SELECT statement.
		FETCH NEXT FROM folder_cursor
		INTO @FolderLo, @FolderHi;

		-- Check @@FETCH_STATUS to see if we located folder
		IF NOT @@FETCH_STATUS = 0
		BEGIN
			-- Set return message and dont proceed any further
			RAISERROR ('dmFolderDelete : Cannot delete record. ',100,1);
			RETURN 1;
		END

		-- Finished with cursor
		CLOSE folder_cursor;
		DEALLOCATE folder_cursor;

		-- Determine the variance between hi and lo and add 1
		-- This tells us the value to increment all sets above the deleted set
		SET  @SetVar = (@FolderHi - @FolderLo) + 1;

		-- Delete folder and any subfolders
		DELETE FROM dmFolder WHERE SetLo >= @FolderLo AND SetHi <= @FolderHi;

		-- Change numbering of folders above affected
		UPDATE dmFolder
		SET SetLo = SetLo - @SetVar
		WHERE SetLo >= @FolderLo;

		UPDATE dmFolder
		SET SetHi = SetHi - @SetVar
		WHERE SetHi >= @FolderHi;

		-- If an error occurred then return the error number
		IF @@ERROR <> 0
			RETURN @@ERROR;
		Else
			RETURN 0;
	END;
GO
