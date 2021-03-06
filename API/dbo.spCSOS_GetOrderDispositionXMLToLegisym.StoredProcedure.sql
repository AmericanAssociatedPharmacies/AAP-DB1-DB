USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spCSOS_GetOrderDispositionXMLToLegisym]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/11/2014
-- Description:	Return XML to delivery to Legisym
-- =============================================
CREATE PROCEDURE [dbo].[spCSOS_GetOrderDispositionXMLToLegisym]
	@TrackingNumber NVARCHAR(15), 
	@Status NVARCHAR(50) = NULL
AS
BEGIN

DECLARE @ControlRecordXml XML;
SET  @ControlRecordXml = (SELECT TOP 1
 * FROM 
  (SELECT 
    LTrim(RTrim(SchemaVersion)) SchemaVersion
	--,LTrim(RTrim(DatePrepared)) DatePrepared
	,convert(varchar(10), DatePrepared, 120) DatePrepared
	,LTrim(RTrim(TimePrepared)) TimePrepared
	,LTrim(RTrim(ServiceContract)) ServiceContract
	FROM dbo.CSOS_OrderDispositionFrmAPI  innerX WHERE innerX.TrackingNumber = @TrackingNumber AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
 ) ControlRecord 
FOR XML AUTO, ELEMENTS );

DECLARE @DispositionHeaderXml XML;
SET  @DispositionHeaderXml = (SELECT TOP 1
 * FROM 
  (SELECT 
    LTrim(RTrim(ISNULL(Express222OrderId,0))) Express222OrderId
	,LTrim(RTrim(TrackingNumber)) TrackingNumber
	FROM dbo.CSOS_OrderDispositionFrmAPI innerX WHERE innerX.TrackingNumber = @TrackingNumber AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
 ) DispositionHeader 
FOR XML AUTO, ELEMENTS );


DECLARE @LineItemXml XML;
SET  @LineItemXml = (SELECT
 * FROM 
  (SELECT 
    LTrim(RTrim(LineId)) LineId
	--,LTrim(RTrim(DispositionDate)) DispositionDate
	,convert(varchar(10), DispositionDate, 120) DispositionDate
	,LTrim(RTrim(DispositionType)) DispositionType
	,LTrim(RTrim(Quantity)) Quantity
	,LTrim(RTrim(StockCode)) StockCode
	,LTrim(RTrim(NdcNumber)) NdcNumber
	FROM dbo.CSOS_OrderDispositionFrmAPI innerX WHERE innerX.TrackingNumber = @TrackingNumber AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
 ) LineItem
FOR XML AUTO, ELEMENTS, ROOT('DispositionDetail') );

DECLARE @ResultVar XML;
SET @ResultVar = CAST( '<OrderDisposition>' + CAST(@ControlRecordXml AS VARCHAR(MAX)) + CAST(@DispositionHeaderXml AS VARCHAR(MAX)) + CAST(@LineItemXml AS VARCHAR(MAX)) + '</OrderDisposition>'  AS XML)

UPDATE dbo.CSOS_OrderDispositionFrmAPI SET XmlToLegisym = @ResultVar WHERE TrackingNumber = @TrackingNumber AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%');

SELECT @ResultVar;

/*

DECLARE	@return_value nvarchar(15), @TrackingNumber NVARCHAR(200)
SET @TrackingNumber = '14X000050'

EXEC	@return_value = dbo.[spCSOS_GetOrderDispositionXMLToLegisym] @TrackingNumber;
 
SELECT 
    LTrim(RTrim(SchemaVersion)) SchemaVersion
	--,LTrim(RTrim(DatePrepared)) DatePrepared
	,convert(varchar(10), DatePrepared, 120) DatePrepared
	,LTrim(RTrim(TimePrepared)) TimePrepared
	,LTrim(RTrim(ServiceContract)) ServiceContract
	FROM dbo.CSOS_OrderDispositionFrmAPI  innerX WHERE innerX.TrackingNumber = @TrackingNumber AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')

SELECT	'Return Value' = @return_value

GO

UPDATE T
	SET T.Express222OrderId = 1824
		,T.DatePrepared = CONVERT (datetime, T.DatePreparedStr, 111) 
		,T.DispositionDate = CONVERT (datetime,  T.DispositionDateStr , 111)
FROM csos.OrderDispositionFrmAPI T


UPDATE T
	SET T.ServiceContract = '873222B5-EACA-4409-BFE9-A82F3120B5DE'
FROM csos.OrderDispositionFrmAPI T WHERE T.ServiceContract LIKE '873222B5%'

-- DELETE csos.OrderDispositionFrmAPI
*/

END

GO
