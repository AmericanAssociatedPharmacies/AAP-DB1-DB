USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_APIWHSalesByUnits]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call APIWHSalesByUnits and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_APIWHSalesByUnits]
 (@in_month varchar(02), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	EXEC dbo.sppm_create_APIWHSalesByUnits_DYN @in_month, @in_year

	 select * from tmp_WHByUnits_jmw_test where pmid != 900000 
    --   and 

--		([GRx Units 09-10] != 0 or 	 
--		[GRx $ 09-10] != 0 or 	 
--		[BRx Units 09-10] != 0 or 	 
--		[BRx $ 09-10] != 0 or   
--		[OTC Units 09-10] != 0 or 	 
--		[OTC $ 09-10] != 0 or 
--		[GRx Units 10-10] != 0 or  
--		[GRx $ 10-10] != 0 or 		 
--		[BRx Units 10-10] != 0 or 	 
--		[BRx $ 10-10] != 0 or   
--		[OTC Units 10-10] != 0 or  
--		[OTC $ 10-10]  != 0   or  
--		[GRx Units 11-10] != 0 or 
--		[GRx $ 11-10] != 0 or 	 
--		[BRx Units 11-10] != 0 or  
--		[BRx $ 11-10]   != 0 or  	  
--		[OTC Units 11-10] != 0 or 
--		[OTC $ 11-10] != 0 ) 

       order by TM desc

END










GO
