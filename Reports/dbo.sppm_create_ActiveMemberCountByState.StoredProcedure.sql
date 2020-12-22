USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ActiveMemberCountByState]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/15/2011>
-- Description:	Create table for Current count of Members in Programs  
-- =============================================
Create PROCEDURE [dbo].[sppm_create_ActiveMemberCountByState]
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
		SELECT State, count(*) as StateCount from pharmacymaster..v_pm_allwithaffiliates where aapaccountno is not null and  aapaccountno != ''    and aapquitdate is null
group by state order by StateCount desc
 
END








GO
