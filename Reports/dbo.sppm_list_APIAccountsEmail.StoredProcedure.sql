USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_APIAccountsEmail]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/07/2013>
-- Description:	Get API Emails for Mail List Generator
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_APIAccountsEmail]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT distinct EMAIL as [Email Address] from pharmacymaster..v_pm_allwithaffiliates 
			WHERE  apiaccountno is not null and apiaccountno !=''
			and ( apistatus = 'Active' or apistatus = 'Suspended')
			and   apiaccountno not like '%BIA%' and apiaccountno not like '%POA%'  
			and email is not null and email != ''
END










GO
