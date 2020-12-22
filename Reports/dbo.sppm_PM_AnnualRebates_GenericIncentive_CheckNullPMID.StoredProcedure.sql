USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_GenericIncentive_CheckNullPMID]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Check for any blamk PMIDs for Generic Incentive  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_GenericIncentive_CheckNullPMID] 
(@year varchar(4))

AS


BEGIN
 
SELECT PMID,APIAccountNo,AccountName from Reports..import_RebateGenericIncentive where (PMID is null or PMID = '') and 
year = @year
 
 END



GO
