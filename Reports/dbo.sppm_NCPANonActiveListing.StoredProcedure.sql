USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_NCPANonActiveListing]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <12/1/2015>
-- Description:	NCPA Listing for Julie
-- =============================================
CREATE PROCEDURE [dbo].[sppm_NCPANonActiveListing]
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT v.PMID,v.AccountName, addr1 as 'Address1' ,addr2 as 'Address2',City,State,Zip,v.NCPDP,Phone,
v.OwnerName,v.AAPAccountNo,v.AAPParentNo,v.AAPQuitDate,Affiliate,NCPA,OptOutNCPA,ReasonNotEligibleNCPA ,
StartDate as 'NCPA Start Date' from pharmacymaster..v_pm_allwithaffiliates v
join
(
	SELECT * from pharmacymaster..pm_pharmacy where aapaccountno is not null and aapaccountno != '' and aapquitdate is not null
)p
on v.PMID = p.PMID

left join
(
SELECT pmid,startdate from pharmacymaster..pm_memberprograms where programid = 205
) m
on v.pmid = m.pmid
where v.aapaccountno is not null and v.aapaccountno != '' and v.aapquitdate is not null and StartDate is not null
		

END










GO
