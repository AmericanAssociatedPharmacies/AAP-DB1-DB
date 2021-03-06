USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Update_APPaymentMode]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/17/2014>
-- Description:	Update A/P Payment modes in PM with A/P payment mode from the API Monthly Rebate and Cardinal Rebate tables
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Update_APPaymentMode]
(@in_month varchar(2), @in_year varchar(4) )
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
-- Of course this isn't the update this is how I'll want to get info though

--FOR API Payment Mode ise API Monthly Rebate table
select p.PMID,AAPAccountNo,p.APIAccountNo,APIPaymentMode ,[A/P Payment Mode] from pharmacymaster..pm_pharmacy p
join (
select   *  from pharmacymaster..pm_rebates_APIMonthly  
where [A/P Payment Mode] is not null and  month(date) = @in_month and year(date) = @in_year )pm
on p.pmid = pm.pmid

--FOR AAP Payment Mode use Cardinal Rebate table
select p.PMID,AAPAccountNo,p.APIAccountNo,AAPPaymentMode ,[A/P Payment Mode] from pharmacymaster..pm_pharmacy p
join (
select   *  from pharmacymaster..pm_rebates_chaap where month(date) = @in_month and year(date) = @in_year
--where [A/P Payment Mode] is not null
 )pm
on p.pmid = pm.pmid
END










GO
