USE [reporting]
GO
/****** Object:  View [dbo].[vwPhysiciansList_MembersApproved]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vwPhysiciansList_MembersApproved] as 


WITH BaseList as (
	--Member in same city and state as physicians list
	SELECT distinct max(practice) as Practice, Address, Address2, City, State, Zip
	FROM reporting..vwPhysiciansEntireList a
	WHERE EXISTS (SELECT *
					FROM PharmacyMaster..v_PM_AllWithAffiliates b
					WHERE AAPAccountNo is not null --active aap member
					AND (AAPQuitDate is null or AAPQuitDate = '') --active aap member
					AND a.city = b.City and a.state = b.state)
	GROUP BY address, address2, city, state, zip
	--ORDER BY Address
),

ApprovedList as (
	--Members who approved we can notify physicians in same city and state of their AAP membership
	SELECT REPLACE(AccountName, '&', 'AND') as AccountName, ISNULL(Phone, '--') as Phone, City, State
	FROM PharmacyMaster..v_PM_AllWithAffiliates b
	WHERE AAPAccountNo is not null --active aap member
	AND (AAPQuitDate is null or AAPQuitDate = '')
	AND PMID in (SELECT PMID FROM reporting..PhysiciansList_MembersApproved)
)

SELECT a.*, 
	STUFF((SELECT ', ' + b.AccountName + ' (' + b.Phone + ')'
			FROM ApprovedList b
			WHERE a.City = b.City and a.State = b.State FOR XML PATH('')),1,1,'') + ', and more!' as AAPMemberInfo
FROM BaseList a
--ORDER BY a.City, a.State
GO
