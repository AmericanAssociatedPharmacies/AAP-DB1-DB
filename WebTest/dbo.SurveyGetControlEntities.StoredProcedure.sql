USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetControlEntities]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 3/6/2015
-- Description:	SurveyGetControlEntities
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetControlEntities]
	-- Add the parameters for the stored procedure here
	@PMId INT,
	@Id INT = 0,
    @Option NVARCHAR(250) = NULL
AS
BEGIN
	IF (@Id = 0)
		SET @Id = NULL;

	IF (@PMId = 0)
		SET @PMId = NULL;
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT * FROM dbo.SurveyControlEntity WHERE Id = ISNULL(@Id, Id) AND PMId = ISNULL(@PMId, PMId) AND IsActive = 1

/****

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetControlEntities]
		@PMId = 2

SELECT	'Return Value' = @return_value

GO
*/
END
GO
