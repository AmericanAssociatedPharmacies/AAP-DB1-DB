USE [HSMonitor]
GO
/****** Object:  View [dbo].[ReportRecordData]    Script Date: 12/22/2020 9:13:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ReportRecordData]
	AS
	SELECT 
		records.ServiceName, 
		records.ID RecordID, 
		fields.ID FieldID, 
		fields.FieldName, 
		records.CreationDate, 
		data.Data 
	FROM ReportRecords records
	JOIN ReportFields fields
	ON fields.ServiceName = records.ServiceName
	JOIN ReportData data
	ON data.RecordID = records.ID AND data.FieldID = fields.ID
GO
