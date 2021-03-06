USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_AllyScripts_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_KPIDash_AllyScripts_DataLoad]

AS

SET NOCOUNT ON ;

BEGIN

	MERGE [dbo].[KPIDash_AllyScripts]  AS t
	USING [Staging].[KPIDash_AllyScripts] AS s ON s.Date = DATEADD(month, DATEDIFF(month, 0, t.Date), 0) AND s.AccountName = t.AccountName AND t.IsValid = 1

	WHEN MATCHED THEN
	UPDATE SET 
		 DeletedBy = s.DeletedBy
		, DeletedOn = s.DeletedOn
		, IsValid = s.IsValid


	WHEN NOT MATCHED THEN
	INSERT(AccountName, State, AAPAccountNumber, APIAccountNumber, Date, RxReceived, RxFilled, UserOriginalLogin, DeletedBy, DeletedOn, IsValid)
	VALUES(s.AccountName, s.State, s.AAPAccountNumber, s.APIAccountNumber, s.Date, s.RxReceived, s.RxFilled, s.UserOriginalLogin, s.DeletedBy
		, s.DeletedOn, s.IsValid)
	;

END






GO
