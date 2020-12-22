USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_APIWHSalesByUnits_TM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call APIWHSalesByUnits and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_APIWHSalesByUnits_TM]
 (@in_month varchar(02), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	EXEC dbo.sppm_create_APIWHSalesByUnits_Rolling_DYN @in_month, @in_year

	 select * from tmp_WHUnits_TM -- where pmid != 900000 
       order by TM desc

END










GO
