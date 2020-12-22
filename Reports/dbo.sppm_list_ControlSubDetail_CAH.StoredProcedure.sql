USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_ControlSubDetail_CAH]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_ControlSubDetail_CAH]
(@in_month varchar (2),@in_year varchar(4),@in_acctNo varchar(20) ,@in_acctName varchar(250))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * from purchases..chph_aap a
		WHERE pmid = @in_acctNo
		and month(inv_date) = @in_month and year(inv_date) = @in_year order by item_descr
END










GO
