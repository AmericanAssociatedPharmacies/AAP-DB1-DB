USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spCSOS_GetOrderDispositionByServiceContract]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/11/2014
-- Description:	Return XML to delivery to Legisym
-- =============================================
CREATE PROCEDURE [dbo].[spCSOS_GetOrderDispositionByServiceContract]
@ServiceContract NVARCHAR(45)
AS
BEGIN

SELECT DISTINCT TrackingNumber FROM dbo.CSOS_OrderDispositionFrmAPI 
WHERE 
	([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
	AND ServiceContract = @ServiceContract

/*

DECLARE	@return_value nvarchar(15)

EXEC	@return_value = [csos].[spGetOrderDispositionByServiceContract]
		@ServiceContract = '873222B5-EACA-4409-BFE9-A82F3120B5DE'

SELECT	'Return Value' = @return_value

GO

UPDATE T
	SET T.Express222OrderId = 1824
		,T.DatePrepared = CONVERT (datetime, T.DatePreparedStr, 111) 
		,T.DispositionDate = CONVERT (datetime,  T.DispositionDateStr , 111)
FROM csos.OrderDispositionFrmAPI T


-- DELETE csos.OrderDispositionFrmAPI
*/

END

GO
