USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetRouteHistory]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			    CREATE PROCEDURE [dbo].[dmGetRouteHistory]					
					@DocumentKey CHAR(36),
					@CompleteRoutingStepCode INT,
					@AssignDocumentRouteCode INT,
					@ReturnRouteStepCode INT,
					@CompleteRouteCode INT											
                WITH EXECUTE AS CALLER
				AS
				BEGIN
				    SET NOCOUNT ON;

					SELECT dmActivity.ActivityDesc, dmActivity.ActivityDateTime, dmUser.FirstName + ' ' + dmUser.LastName AS UserFullName 
					FROM dmActivity
					INNER JOIN dmUser ON dmUser.UserKey = dmActivity.UserKey
					WHERE DocumentKey = @DocumentKey
					AND dmActivity.ActivityCode IN (@CompleteRoutingStepCode, @AssignDocumentRouteCode, @ReturnRouteStepCode, @CompleteRouteCode)
					ORDER BY dmActivity.ActivityDateTime DESC
					
					IF @@ERROR <> 0
						BEGIN
							RAISERROR ('dmGetRouteHistory : Cannot get route history, for the document.', 15, 1)
							ROLLBACK TRAN;
							RETURN(1);
						END;
					 RETURN(0);
				END;			
			
GO
