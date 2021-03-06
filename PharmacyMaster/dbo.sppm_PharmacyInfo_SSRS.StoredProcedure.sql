USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PharmacyInfo_SSRS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Dave Bohler and LeeAnn Carrell>
-- Create date: <8/15/2017>
-- Description:	<Pharmacy Info for SSRS Report>
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PharmacyInfo_SSRS] 
	@in_request varchar(1)
	, @State varchar(2)
AS
BEGIN
	IF @in_request = 'A' --AAP Members Only
		SELECT PMID
		, AAPAccountNo
		, APIAccountNo
		, APIStatus
		, AccountName AS Name
		, OwnerName
		, MailAddr1
		, MailAddr2
		, MailCity AS City
		, MailState AS State 
		, MailZip
		, Phone
		, Fax
		, [ACHEmail] AS [Finance Email]
		, Email
		, AccountDescription
		, Status
		, AAPQuitDate
		FROM v_PM_AllWithAffiliates
		WHERE AAPAccountNo is not null and AAPAccountNo != '' and AAPQuitDate is null
			AND State IN (@State)
		
	IF @in_request = 'B' --API Customers Only
		SELECT PMID
		, AAPAccountNo
		, APIAccountNo
		, APIStatus
		, AccountName AS Name
		, OwnerName
		, MailAddr1
		, MailAddr2
		, MailCity AS City
		, MailState AS State
		, MailZip
		, Phone
		, Fax
		, [ACHEmail] AS [Finance Email]
		, Email
		, AccountDescription
		, Status
		, AAPQuitDate
		FROM v_PM_AllWithAffiliates
		WHERE APIAccountNo is not null and APIAccountNo not like'%-%' and APIStatus in ('ACTIVE')
			AND State IN (@State)
	 IF @in_request = 'C' --Both AAP Member and API Customer
		SELECT PMID
		, AAPAccountNo
		, APIAccountNo
		, APIStatus
		, AccountName AS Name
		, OwnerName
		, MailAddr1
		, MailAddr2
		, MailCity AS City
		, MailState AS State
		, MailZip
		, Phone
		, Fax
		, [ACHEmail] AS [Finance Email]
		, Email
		, AccountDescription
		, Status
		, AAPQuitDate
		FROM v_PM_AllWithAffiliates
		WHERE	(AAPAccountNo is not null and AAPAccountNo != '' and AAPQuitDate is null)	--aap mem
				AND
				(APIAccountNo is not null and APIAccountNo not like'%-%' and APIStatus in ('ACTIVE'))	--api cust
				AND 
				State IN (@State)
	IF @in_request = 'D' --Either AAP Member or API Customer
		SELECT PMID
		, AAPAccountNo
		, APIAccountNo
		, APIStatus
		, AccountName AS Name
		, OwnerName
		, MailAddr1
		, MailAddr2
		, MailCity AS City
		, MailState AS State
		, MailZip
		, Phone
		, Fax
		, [ACHEmail] AS [Finance Email]
		, Email
		, AccountDescription
		, Status
		, AAPQuitDate
		FROM v_PM_AllWithAffiliates
		WHERE	(AAPAccountNo is not null and AAPAccountNo != '' and AAPQuitDate is null)	--aap mem
				OR
				(APIAccountNo is not null and APIAccountNo not like'%-%' and APIStatus in ('ACTIVE'))	--api cust
				AND
				State IN (@State)
END

GO
