USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_CardAcctNoExceptionsTest]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/08/2011>
-- Description:	Find Cardinal Accounts in purchase table that can't be matched by account no to a PMID
-- =============================================
Create PROCEDURE [dbo].[sppm_find_CardAcctNoExceptionsTest]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	SELECT DISTINCT customer_name as [Customer Name] ,customer_no as [Cardinal Account No], cast(cast(customer_no as int) as varchar(31)) as   CustomerAcctNoZeroRemoved 
		FROM  purchases..chph_aap_test where pmid is null  
	ORDER BY customer_name


END










GO
