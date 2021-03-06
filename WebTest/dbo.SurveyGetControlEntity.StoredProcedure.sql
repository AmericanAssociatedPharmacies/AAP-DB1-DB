USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetControlEntity]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 4/6/2015
-- Description:	SurveyGetControlEntity
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetControlEntity]
	-- Add the parameters for the stored procedure here
	@PMId INT,
	@FName NVARCHAR(150),
	@LName NVARCHAR(150),
	@DOB DateTime,
	@Id INT = 0,
    @Option NVARCHAR(250) = NULL
AS
BEGIN
	IF (@Id < 1)
		SET @Id = NULL;

	IF (@PMId < 0)
		SET @PMId = NULL;
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	IF (@FName <> '' AND @LName <> '' AND @Id IS NOT NULL) BEGIN
		SELECT @Id = (SELECT TOP 1 Id FROM dbo.SurveyControlEntity WHERE 	FName = @FName AND LName = @LName AND CONVERT(VARCHAR(10),DOB,101)  = CONVERT(VARCHAR(10),@DOB,101));
	END

	SELECT * FROM dbo.SurveyControlEntity WHERE Id = @Id AND PMId = @PMId AND IsActive = 1

/****

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetControlEntity]
		@PMId = 2

SELECT	'Return Value' = @return_value

GO



SELECT CONVERT(DateTime, GETDATE())
SELECT CONVERT(VARCHAR(10),GETDATE(),101)



*/
END
GO
