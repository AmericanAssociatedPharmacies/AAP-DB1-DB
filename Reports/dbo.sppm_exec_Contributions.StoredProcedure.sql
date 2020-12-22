USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_Contributions]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Execute Contributions Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_Contributions]
(@in_month varchar(2),@in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
     --- TODO CHANGE BACK!!!!
	EXEC dbo.sppm_create_Contributions  @in_month,@in_year 

    --EXEC dbo.sppm_create_Contributions_2011 
	SELECT * from tmp_Contributions order by ltrim([Account DBA Name]);

END










GO
