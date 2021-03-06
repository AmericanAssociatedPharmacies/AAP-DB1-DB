USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_Goal3_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_KPIDash_Goal3_DataLoad]

AS

SET NOCOUNT ON ;

BEGIN

	MERGE [dbo].[KPIDash_Goal3]  AS t
	USING [Staging].[KPIDash_Goal3] AS s ON s.[Date] = t.Date AND s.RebateType = t.RebateType

	WHEN MATCHED AND (s.RebateType = t.RebateType AND (s.Amount <> t.Amount OR s.Audited <> t.Audited))  THEN
	UPDATE SET Amount = s.Amount
		, Audited = s.Audited


	WHEN NOT MATCHED THEN
	INSERT ([Date], RebateType, Audited, Amount)
	VALUES(s.[Date], s.RebateType, s.Audited, s.Amount)
	;

END


GO
