USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_TESTAAP_MC_Programs]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/18/2015>
-- Description:	Get Managed Care
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_TESTAAP_MC_Programs]
  

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members and Managed Care and Programs
		@affiliates = N'0',
		@programs = N'184',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'0',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value


-- DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members and Managed Care with NPP  and Programs
		@affiliates = N'0',
		@programs = N'184',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'0',
		@isNPP = N'1',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members and Managed Care with Bashas HQ Only and Programs
		@affiliates = N'0',
		@programs = N'184',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'0',
		@isNPP = N'0',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members and Managed Care with NPP and Bashas HQ Only and Programs
		@affiliates = N'0',
		@programs = N'184',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'0',
		@isNPP = N'1',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members and Managed Care with Excluded Managed Care and Programs
		@affiliates = N'0',
		@programs = N'184',
		@excludeMC = N'1',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'0',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value


  
END










GO
