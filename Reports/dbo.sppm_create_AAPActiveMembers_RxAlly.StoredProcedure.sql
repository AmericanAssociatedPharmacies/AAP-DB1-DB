USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_AAPActiveMembers_RxAlly]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's for a certain month/year with no Match in PM_Pharmacy - XX's are excluded
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_AAPActiveMembers_RxAlly]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT  AccountName,AAPAccountNo,AAPEffectiveDate,OwnerName,
		case when (ChainCode is not null and mcquitdate is null) then ChainCode else null end as ChainCode,
		case when APIStatus = 'Active' then APIAccountNo else null end as APIAccountNo  ,Affiliate,
		case when p.pmid is null then null else 'RxAlly' end as [RxAlly Program]
	FROM pharmacymaster..v_PM_AllWithAffiliates v
	left outer join
	(
		SELECT * from pharmacymaster..pm_MemberPrograms where programid = 188
		and enddate is   null and startdate is not null
	) p
	on v.pmid = p.pmid
	WHERE aapaccountno is not null and aapquitdate is null
	ORDER BY [RxAlly Program] desc

END










GO
