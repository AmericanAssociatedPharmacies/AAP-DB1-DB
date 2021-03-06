USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_CardAcctNoExceptionsNZ]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/08/2011>
-- Description:	Find Cardinal Accounts in purchase table that can't be matched by account no to a PMID
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_CardAcctNoExceptionsNZ]
(@in_month varchar(2),@in_year varchar(4))
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	SELECT DISTINCT customer_name as [Customer Name] ,customer_no as [Cardinal Account No] 
		FROM  purchases..chph_aap where pmid is null and month(inv_date) = @in_month
		 and year(inv_date) = @in_year 
	ORDER BY customer_name


END










GO
