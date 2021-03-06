USE [webdocs]
GO
/****** Object:  View [dbo].[vwReceiversPacket]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwReceiversPacket]

AS


SELECT [Document No] = a.CTIDNO
, [Due Date] = a.CTDUDT
, [Vendor No] = a.CTVENO
, [Vendor Inv No] = b.CTVEIN
, [PO No] = c.GPPO01
, [PO NO2] = c.GPPO02
, [PO NO3] = c.GPPO03
, [PO NO4] = c.GPPO04
, [PO NO5] = c.GPPO05
FROM [10.96.0.3].[APIASW].[AX1492BFRX].[SROLTA] AS a
INNER JOIN [10.96.0.3].[APIASW].[AX1492BFRX].SROLTAI AS B ON a.CTREFX = b.CTREFX
LEFT JOIN [10.96.0.3].[APIASW].[AX1492BFRX].SROGPH AS C ON a.CTREFX = c.GPREFX
--INNER JOIN [10.96.0.3].[APIASW].[AX1492BFRX].SROGPH AS C ON a.CTREFX = c.GPREFX
GO
