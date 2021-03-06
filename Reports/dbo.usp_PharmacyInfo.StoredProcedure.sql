USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_PharmacyInfo]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dave Bohler and LeeAnn Carrell>
-- Create date: <8/15/2017>
-- Description:	<Pharmacy Info for SSRS Report>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PharmacyInfo] 

	@in_request VARCHAR(1)
	, @State VARCHAR(250)

AS

SET NOCOUNT ON;

BEGIN

	DECLARE @T TABLE([State] VARCHAR(250) PRIMARY KEY CLUSTERED
			)

	--Split multi-value parameter
	INSERT INTO @T([State])
	SELECT DISTINCT Item
	FROM [dbo].[DelimitedSplit8K](@State, ',')

	--Get query results
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
		FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS A
		WHERE AAPAccountNo is not null 
		and AAPAccountNo != '' 
		and AAPQuitDate is null
		AND EXISTS(SELECT 1
					FROM @T AS t
					WHERE A.[State] = t.[State]
					)
		ORDER BY A.MailState ASC		
				
		
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
		FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS A
		WHERE APIAccountNo is not null 
		and APIAccountNo not like'%-%' 
		and APIStatus in ('ACTIVE')
		AND EXISTS(SELECT 1
					FROM @T AS t
					WHERE A.[State] = t.[State]
					)
		ORDER BY A.MailState ASC

	
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
		FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS A
		WHERE	(AAPAccountNo is not null 
					and AAPAccountNo != '' 
					and AAPQuitDate is null
				)	--aap mem
		AND (APIAccountNo is not null 
				and APIAccountNo not like'%-%' 
				and APIStatus in ('ACTIVE')
			)	--api cust
		AND EXISTS(SELECT 1
					FROM @T AS t
					WHERE A.[State] = t.[State]
					)
		ORDER BY A.MailState ASC

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
		FROM PharmacyMaster.dbo.v_PM_AllWithAffiliates AS A
		WHERE	(AAPAccountNo is not null 
					and AAPAccountNo != '' 
					and AAPQuitDate is null
					)	--aap mem
		OR (APIAccountNo is not null 
			and APIAccountNo not like'%-%' 
			and APIStatus in ('ACTIVE')
			)	--api cust
		AND EXISTS(SELECT 1
					FROM @T AS t
					WHERE A.[State] = t.[State]
					)
		ORDER BY A.MailState ASC

END
GO
