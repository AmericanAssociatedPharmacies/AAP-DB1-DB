USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_MiamiLuken_PMID]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_MiamiLuken_PMID]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
   --FIRST update missing PMID using any supplied aapaccountno
   UPDATE  s  set 
		pmid = p.pmid  
			FROM reports..import_MiamiLuken   s 
		join
		(
			 SELECT pmid,udaccountno,aapAccountNo  FROM PM_Pharmacy   
		) p
		on pm.UDAccountNo = n.acct_no or pm.aapAccountNo = n.acct_no
 
 
 
END








GO
