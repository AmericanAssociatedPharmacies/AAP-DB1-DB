USE [Pricing]
GO
/****** Object:  StoredProcedure [Staging].[usp_Truncate_APIInvoiceComparisonTables]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_Truncate_APIInvoiceComparisonTables]

AS

SET NOCOUNT ON;

BEGIN

	TRUNCATE TABLE [Staging].[AAPComparisons]
	TRUNCATE TABLE [Staging].[ElectronicComparisons]
	TRUNCATE TABLE [Staging].[Evaluations]

END
GO
