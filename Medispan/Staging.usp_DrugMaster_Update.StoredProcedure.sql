USE [Medispan]
GO
/****** Object:  StoredProcedure [Staging].[usp_DrugMaster_Update]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Staging].[usp_DrugMaster_Update]

AS

SET NOCOUNT ON;

BEGIN

	RETURN

--IsC2Exclusion is not in either Staging or Prod table

--UPDATE x
--SET IsC2Exclusion  = dt.IsC2Exclusion 
--FROM Staging.DrugMaster x
--INNER JOIN(SELECT NDC
--				, CONVERT(BIT, IIF(DEA_Class_Code <> 'C-II', 1, 0)) AS IsC2Exclusion 
--				FROM Medispan.dbo.DrugMaster
--				) AS dt ON dt.NDC = x.NDC

END
GO
