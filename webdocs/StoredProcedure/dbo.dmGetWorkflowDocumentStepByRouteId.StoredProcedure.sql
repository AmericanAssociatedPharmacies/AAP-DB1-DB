USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetWorkflowDocumentStepByRouteId]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			Create PROCEDURE [dbo].[dmGetWorkflowDocumentStepByRouteId]
					@DocumentKey [char](36),
					@RouteKey [char](36)
				WITH EXECUTE AS CALLER
				AS
				BEGIN

					SET NOCOUNT ON;


					  select
						[stepKey]
					  from
						dmWorkflowDocument
					  where
						DocumentKey = @DocumentKey
					  and
						FlowKey = @RouteKey
					  and
						[status] <> 2
					  and
						[status] <> 3;


					IF @@ERROR <> 0
						BEGIN
							RAISERROR ('dmGetWorkflowDocumentStepByRouteId : Error encountered. ',15,1);
							ROLLBACK TRAN;
							RETURN(1);
						END;
					RETURN(0);
				END;
			
GO
