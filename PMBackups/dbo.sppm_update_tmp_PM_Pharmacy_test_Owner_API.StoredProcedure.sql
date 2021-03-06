USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_tmp_PM_Pharmacy_test_Owner_API]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
Create PROCEDURE [dbo].[sppm_update_tmp_PM_Pharmacy_test_Owner_API]

AS
BEGIN
 
 UPDATE  p  set 
	ownername = a.contactfullname  
  FROM tmp_pm_pharmacy_test p   
	left outer join
	(
		SELECT * from  tmp_pm_addressmaster_test  where address_type_id = 3
	) a
	ON p.pmid = a.pmid
	WHERE apiaccountno is not null and aapaccountno is null;

	UPDATE tmp_pm_pharmacy_test set ownername = null where ownername = '';
 
END








GO
