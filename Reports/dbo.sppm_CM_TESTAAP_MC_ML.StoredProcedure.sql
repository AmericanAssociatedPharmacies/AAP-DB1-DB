USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_TESTAAP_MC_ML]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/18/2015>
-- Description:	Get Managed Care
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_TESTAAP_MC_ML]
  

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAPMembers and MC Participants and ML
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 
 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAPMembers and MC Participants and Include NPP ML Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'1',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAPMembers and MC Participants and Bashas HQ Only ML Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value



 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAPMembers and MC Participants and NPP and Bashas HQ Only ML Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'1',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value
 
-- DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAPMembers Exclude managed Care and Include Miami Luken checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'1',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members MC Participants and ML HQ Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'1',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members MC Participants , Include NPP and ML HQ Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'1',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'1',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value
 
 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members MC Participants , Bashas HQ Only  and ML HQ Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'1',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value


-- DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members MC Participants , Include NPP , Bashas HQ Only  and ML HQ Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'1',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'1',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members Exclude Managed Care and  ML HQ Checked
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'1',
		@excludeML = N'0',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'1',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value


-- DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members Managed Care Participants and Exclude ML
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'1',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value
 
--DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members Managed Care Participants , NPP and Exclude ML
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'1',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'1',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value
 
 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members Managed Care Participants , Bashas HQ Only and Exclude ML
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'1',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'eff',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members Managed Care Participants ,NPP, Bashas HQ Only and Exclude ML
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'0',
		@excludeML = N'1',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'1',
		@isBashasHQOnly = N'1',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value

 --DECLARE	@return_value int

EXEC	@return_value = [dbo].[sppm_CM_GetAAPAPI]  -- AAP Members and Exclude Managed Care and Exclude ML
		@affiliates = N'0',
		@programs = N'0',
		@excludeMC = N'1',
		@excludeML = N'1',
		@includeMC = N'1',
		@includeML = N'1',
		@isNPP = N'0',
		@isBashasHQOnly = N'0',
		@isMLHQOnly = N'0',
		@incAffHQOnly = N'0',
		@listType = N'0',
		@parentSelected = N'AAP'

SELECT	'Return Value' = @return_value
 
  
END










GO
