USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ActiveMemberCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/15/2011>
-- Description:	Create table for Current count of Members in Programs  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ActiveMemberCount]
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
--		SELECT count(*) as AAPMemberCount from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''    and aapquitdate is null


	SELECT  
	(select count(*) as AAPMemberCount from pharmacymaster..pm_pharmacy where aapaccountno is not null and aapaccountno != ''
	and aapquitdate is null ) as AAPMemberCount,
	(select count(*) as APIActiveCount from pharmacymaster..pm_pharmacy where apiAccountno is not null and apiaccountno != ''
	and apistatus = 'Active' and apiAccountno not like '%BIA%' and apiAccountno not like '%POA%') as APIActiveCount  ,
	(select count(*) as API_AAPActiveCount from pharmacymaster..pm_pharmacy where aapaccountno is not null and aapaccountno != ''
	and aapquitdate is null and apiAccountno is not null and apiaccountno != ''
	and apistatus = 'Active') as API_AAPActiveCount 

 
END








GO
