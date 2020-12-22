USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_PatDiv_Elig_DYN_MO]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_PatDiv_Elig_DYN_MO]
 (@in_month varchar(100), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	EXEC dbo.sppm_create_PatDiv_Elig_DYN_MO  @in_month,@in_year 
  
	SELECT * from tmp_PatDivPrep_Elig order by PMID;

END










GO
