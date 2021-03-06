USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ProgramMCYearAgoCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/08/2011>
-- Description:	Create Non Satellite Active Member list for Clint - to be run Quarterly
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ProgramMCYearAgoCount]
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
select * from pharmacymaster..v_pm_allwithaffiliates where chaincode is not null  and ( mcquitdate is null or mcquitdate > '10/31/2011') and
 aapaccountno is not null   and ( aapquitdate is null or aapquitdate > '10/31/2011') and
aapeffectivedate <= '10/31/2011' and 
reports.dbo.maxdate(mceffectivedate,aapeffectivedate) <= '10/31/2011' and reports.dbo.maxdate(mceffectivedate,aapeffectivedate)
is not null
 
END








GO
