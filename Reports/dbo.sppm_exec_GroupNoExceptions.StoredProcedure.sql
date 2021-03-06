USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_GroupNoExceptions]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/16/2011>
-- Description:	Exceptions for Groups
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_GroupNoExceptions]
 

AS
BEGIN
	EXEC sppm_create_GroupNoExceptions;

	UPDATE  su  set 
		VerifiedAsOK = ch.VerifiedAsOK  
	FROM PMGroupNoExceptions   su 
	inner join 
		( select PMID,VerifiedAsOK,AAPAccountNo,AAPParentNo ,[PM GroupNo], [CHAccounts GroupNo] from PMGroupNoExceptions_Verified  ) ch
	on su.PMID = ch.PMID    and 
		IsNull(su.AAPAccountNo,'') = IsNull(ch.AAPAccountNo,'') and 
		IsNull(su.AAPParentNo,'') = IsNull(ch.AAPParentNo,'') and
		IsNull(su.[PM GroupNo],'') = IsNull(ch.[PM GroupNo],'') and
		IsNull(su.[CHAccounts GroupNo],'') = IsNull(ch.[CHAccounts GroupNo],'') 
	
END










GO
