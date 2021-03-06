USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_ControlSub_RPT_API]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_ControlSub_RPT_API]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select
		PMID, 
		AccountName,
		City,
		State,
		Zip,
        DEA,
		APIAccountNo,
		AAPAccountNo,
		CHAccountNoPrimary,
		[WH_GenericUnits],
		[WH_BrandUnits],
		[WH_ControlUnitsCII],
		[WH_ControlUnits3_5],
		[WH_ControlUnitsTotal],
		[WH_NonControlUnits],
		[WH_Hydros],
        [WH_Hydro10s],
		[WH_Oxys],
		[WH_Oxy30s],
		[WH_AllALP],
		[WH_ALP2MG],
		[WH_METHADONE],
		[WH_%CII-CV],
		[WH_%CII-CV_AVG3MO],
		[WH_%CII],
		[WH_%CII_AVG3MO],
		[WH_GXtoBXRatio],
		[WH_GXtoBXRatio_AVG3MO]
		from tmp_ControlSub_ALL
END










GO
