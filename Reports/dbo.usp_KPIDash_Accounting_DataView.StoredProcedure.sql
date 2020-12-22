USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_Accounting_DataView]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_KPIDash_Accounting_DataView]
AS
	SELECT RebateDate
		, RebateType
		, RebateAmount
	FROM Reports.dbo.KPIDash_Accounting
	WHERE IsValid = 1
	AND DeletedBy IS NULL
	AND DeletedOn IS NULL

GO
