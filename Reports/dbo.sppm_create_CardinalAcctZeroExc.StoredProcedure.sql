USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_CardinalAcctZeroExc]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Execute Contributions Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_CardinalAcctZeroExc]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
SELECT distinct customer_no,customer_name ,pmid from purchases..chph_aap where customer_no in (
	SELECT '0' + chaccountnoprimary from pharmacymaster..pm_chaccounts_adj where len(chaccountnoprimary) = 5 )
and ( pmid is null or pmid = '')

END










GO
