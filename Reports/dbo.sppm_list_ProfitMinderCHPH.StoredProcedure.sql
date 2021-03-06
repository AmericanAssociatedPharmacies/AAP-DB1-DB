USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_ProfitMinderCHPH]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_ProfitMinderCHPH]
(@in_month varchar(2),@in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	SET NOCOUNT ON;

	IF EXISTS(SELECT name FROM sys.tables  
		WHERE name =  'tmp_ProfitMinderCHPH' )
		BEGIN 
			DROP TABLE  tmp_ProfitMinderCHPH;
		END  

SELECT * into tmp_ProfitMinderCHPH from(

	SELECT ch.PMID,invoice_no as Whse_Inv_ID, '65' as VendorID,pch.aapaccountno as UD_ACCT_NUM,
		invoice_no as INVOICE_NUM,
		inv_date as INVOICE_DT,TYPE AS INVOICE_TYPE, NDC,ship_QTY as [SHIP QTY], 
		cast(UNIT_COST as numeric(18,2)) AS UNIT_COST_AMT,   cast(WAC as numeric(18,2)) as WAC  from purchases..chph_aap  ch
	JOIN
	(
		  SELECT p.PMID,AAPAccountNo,AccountName from pharmacymaster..pm_pharmacy p
			join
			(
				SELECT pmid from pharmacymaster..pm_memberprograms
				WHERE programid=6 and enddate is null
			) pm
			ON p.pmid = pm.pmid
				WHERE computersoftware != 'Rx3'
	) pch
	ON ch.pmid = pch.pmid where  month(ch.inv_date) = @in_month and year(ch.inv_date) = @in_year  
)ch
	 
END










GO
