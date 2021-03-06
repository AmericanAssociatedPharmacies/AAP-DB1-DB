USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_GroupNoExceptionsVerified]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/16/2011>
-- Description:	Exceptions for Groups
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_GroupNoExceptionsVerified]
 

AS
BEGIN
	--- INSERT into Verified
	INSERT into PMGroupNoExceptions_Verified (PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,[PM GroupNo],
	 [CHAccounts GroupNo],Reason,VerifiedAsOK)

	SELECT PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,[PM GroupNo],
	 [CHAccounts GroupNo],Reason,VerifiedAsOK
	FROM
	( 
		SELECT PMID,AccountName,AAPEFfectiveDate,AAPQuitDate,AAPAccountNo,AAPParentNo,APIAccountNo,[PM GroupNo],
	 [CHAccounts GroupNo],Reason,VerifiedAsOK from PMGroupNoExceptions where VerifiedAsOK = 'Y'

	) ch
	 
	WHERE not exists  (select pmid from PMGroupNoExceptions_Verified  where pmid = ch.pmid and
                    IsNull(AAPAccountNo,'') = IsNull(ch.AAPAccountNo,'') and 
					IsNull(AAPParentNo,'') = IsNull(ch.AAPParentNo,'') and
					IsNull([PM GroupNo],'') = IsNull(ch.[PM GroupNo],'') and
					IsNull([CHAccounts GroupNo],'') = IsNull(ch.[CHAccounts GroupNo],'') );


UPDATE PMGroupNoExceptions_Verified set AAPAccountNo = '' where AAPAccountNo is null;
UPDATE PMGroupNoExceptions_Verified set AAPParentNo = '' where AAPParentNo is null;
UPDATE PMGroupNoExceptions_Verified set [PM GroupNo] = '' where [PM GroupNo] is null;

UPDATE PMGroupNoExceptions_Verified set [CHAccounts GroupNo] = '' where [CHAccounts GroupNo] is null;

	
END










GO
