USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetCredentialing]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 2/24/2015
-- Description:	SurveyGetCredentialingByPMId
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetCredentialing]
	-- Add the parameters for the stored procedure here
	@Id INT = NULL,
	@PMId INT = NULL
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

EXEC	@return_value = [dbo].[SurveyGetCredentialingByPMId]
		@PMId = 2

SELECT	'Return Value' = @return_value

GO
*/
END
GO
