USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_APIBrandCredits_CheckNULLPMID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Authors:		< Joni Wilson & LeeAnn Carrell >
-- Create date: <11/03/2016>
-- Description:	 Check for any blank PMIDs or APIAccountNo in PM_Rebates_APIMonthly  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_APIBrandCredits_CheckNULLPMID] 
(@inMonth varchar(2), @inYear varchar(4))

AS


BEGIN
 
SELECT PMID,APIAccountNo,AccountName as AccountName from PharmacyMaster..PM_BrandCredits_APIMonthly where (PMID is null or PMID = '' or APIAccountNo is null or APIAccountNo = '') and 
year(Date) = @inYear and month(Date) = @inMonth
 
 END
GO
