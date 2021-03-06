USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_Accounting_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_KPIDash_Accounting_DataLoad]

AS

SET NOCOUNT ON ;

BEGIN

	MERGE [dbo].[KPIDash_Accounting]  AS t
	USING [Staging].[KPIDash_Accounting] AS s ON s.RebateDate = t.RebateDate AND s.RebateType = t.RebateType 

	WHEN MATCHED THEN
	UPDATE SET RebateAmount = s.RebateAmount
	, UserOriginalLogin = s.UserOriginalLogin
	, DeletedBy = s.DeletedBy
	, DeletedOn = s.DeletedOn
	, IsValid = s.IsValid


	WHEN NOT MATCHED THEN
	INSERT (RebateDate, RebateType, RebateAmount, UserOriginalLogin)
	VALUES(s.RebateDate, s.RebateType, s.RebateAmount, s.UserOriginalLogin)
	;

END


GO
