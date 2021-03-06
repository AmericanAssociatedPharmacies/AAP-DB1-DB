USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetOwnerOtherOwnership]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 3/6/2015
-- Description:	SurveyGetOwnerOtherOwnership
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetOwnerOtherOwnership]
	-- Add the parameters for the stored procedure here
	@PMId INT,
    @CtrlEntityId INT = 0,
	@OwnershipId INT = 0,
    @Option NVARCHAR(250) = NULL
AS
BEGIN
	IF (@OwnershipId = 0)
		SET @OwnershipId = NULL;

	IF (@CtrlEntityId = 0)
		SET @CtrlEntityId = NULL;
	-- SET NOCOUNT ON added to prevent extra result sets from
	SET NOCOUNT ON;
	SELECT o.* FROM dbo.SurveyControlEntity i INNER JOIN dbo.SurveyOwnership o ON i.Id = o.SurveyControlEntityId 
		WHERE i.PMId = @PMId AND o.IsActive = 1 AND i.IsActive = 1 AND i.Id = ISNULL(@CtrlEntityId, i.Id) AND o.Id = ISNULL(@OwnershipId, o.Id)

/****

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetOwnerOtherOwnership]
		@PMId = 2

SELECT	'Return Value' = @return_value

GO
*/
END
GO
