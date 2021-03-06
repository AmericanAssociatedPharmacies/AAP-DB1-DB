USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_Goal1b_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_KPIDash_Goal1b_DataLoad]

AS

SET NOCOUNT ON ;

BEGIN

	MERGE [dbo].[KPIDash_Goal1b]  AS t
	USING [Staging].[KPIDash_Goal1b] AS s ON s.[Date] = t.Date AND s.Type = t.Type

	WHEN MATCHED AND s.Amount <> t.Amount  THEN
	UPDATE SET Amount = s.Amount


	WHEN NOT MATCHED THEN
	INSERT ([Date], Type, Amount)
	VALUES(s.[Date], s.Type, s.Amount)
	;

END



GO
