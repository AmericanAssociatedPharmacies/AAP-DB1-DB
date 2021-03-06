USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_1099Report_Paul]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/25/2012>
-- Description:	Create report for Paul for 1099s
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_1099Report_Paul]
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

SELECT p.PMID, 
	p.CorporateName as [Tax return name],
	p.AccountName as [DBA store name],
	p.FedID as [Federal Tax ID Number],
	v.Address as [Financial Address 1],
	v.Address2 as [Financial Address 2],
	v.City as [Financial City],
	v.State as [Financial State],
	cast(v.Zip as varchar(10)) as [Financial Zip],
	r. [Total PD] as [Total Patronage Dividends] 
	from reports..PatDiv2010 r
	join pharmacymaster..v_Address_Mailing_Financials v 
	on r.pmid = v.pmid
	join pharmacymaster..v_pm_allwithaffiliates p
	on r.pmid = p.pmid
END








GO
