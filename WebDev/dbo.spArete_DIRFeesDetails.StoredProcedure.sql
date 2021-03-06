USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spArete_DIRFeesDetails]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Vrindha Nair
-- Create date: 07/13/2016
-- Description:	DIR Fees Data
-- =============================================
CREATE PROCEDURE [dbo].[spArete_DIRFeesDetails] 
(
	@pbm NVARCHAR(200), @ncpdp NVARCHAR(7)
)
	
AS
BEGIN
	
	SET NOCOUNT ON;

	   if @pbm = 'Prime'
	BEGIN
		
				SELECT NCPDP, NDC, RxNbr as [Prescription Number],convert(varchar, [Fill Date], 111) AS [Fill Date], [Submit Cost] AS [Submitted Cost],
				 [Conc Fee] AS [DIR Fee], Client FROM dbo.DIRDetails_Prime WHERE NCPDP = @ncpdp

    END

	if @pbm = 'Magellan'
	BEGIN

				SELECT pharmacy_ncpdp AS [NCPDP Number], STORE_NAME AS [Store Name], I_RX_SERVICE_REF_NO AS [Prescription Number], I_SERVICE_DT AS [Date Filled], ADJUD_DT AS [Date Adjudicated], 
				I_BIN AS [BIN Number], I_PROCESSOR_CTRL_NO AS [PCN Number],ADJ_GROUP_ID AS [Group Number], brand_gen AS [Brand Generic Identifier]
				FROM WebDev.dbo.DIRDetails_MagellanRx WHERE pharmacy_ncpdp = @ncpdp

    END

	if @pbm = 'Envision'
	BEGIN
		
				SELECT [NCPDP #], [Pharmacy Name], [Net Claims Count], [Generic Net Rx Count], [GDR %], [DIR Fee], [DIR Fee Owed] AS [Total DIR Fee] FROM WebDev.dbo.DIRDetails_Envision WHERE [NCPDP #] = @ncpdp

    END

		if @pbm = 'Scan'
	BEGIN
		
				SELECT * FROM WebDev.dbo.DIRDetails_ESIScan WHERE NCPDP = @ncpdp

    END

	if @pbm = 'Aetna'
	BEGIN

				SELECT * FROM WebDev.dbo.DIRDetails_Aetna where PharmacyNABP = @ncpdp

	END

		if @pbm = 'Anthem'
	BEGIN
		
				SELECT * FROM WebDev. dbo.DIRDetails_ESIAnthem WHERE NABP = @ncpdp

    END
		
			if @pbm = 'ESIPDP'
	BEGIN
		
				SELECT nabp_nbr AS [NCPDP #], [PHARMACY NAME], Carrier AS [Plan Name], year_quarter as [Year Quarter], year_mo AS [Year Month], GDR, Total_Claims AS [Sum Of Total Claims], DIRFee AS [DIR  Fee 1Q2016], [DIR 1Q2016] AS [Total DIR Fee 1Q2016]
			    FROM WebDev. dbo.DIRDetails_ESIMedicare WHERE nabp_nbr = @ncpdp

    END
		

	/*

		

	

	

	

		if @pbm = 'CVS'
	BEGIN
		
				SELECT * FROM dbo.DIRDetails_CVSCaremark WHERE NCPDP = @ncpdp

    END */

		


		
END
GO
