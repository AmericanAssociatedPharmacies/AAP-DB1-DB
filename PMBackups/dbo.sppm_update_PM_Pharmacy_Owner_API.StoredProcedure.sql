USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_PM_Pharmacy_Owner_API]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_PM_Pharmacy_Owner_API]

AS
BEGIN
 
 UPDATE  p  set 
	ownername = a.contactfullname  
  FROM pharmacymaster..pm_pharmacy p   
	left outer join
	(
		SELECT * from  pharmacymaster..pm_addressmaster  where address_type_id = 3
	) a
	ON p.pmid = a.pmid
	WHERE apiaccountno is not null and (aapaccountno is null or aapaccountno = '')
and (p.accountdescription  != 'Affiliate Group Pharmacy' or p.accountdescription is null)


	UPDATE pharmacymaster..pm_pharmacy set ownername = null where ownername = '';
 
END








GO
