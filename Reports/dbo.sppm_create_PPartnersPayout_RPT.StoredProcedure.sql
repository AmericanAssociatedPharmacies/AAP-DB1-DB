USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_PPartnersPayout_RPT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/08/2011>
-- Description:	Create Preferred Partners Report -email to Jon Copeland; Susie Melton; Wayne Boese; Mark Metzger; Paul Carlin; Bruce Grant; Scott Jensen
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_PPartnersPayout_RPT]
(@in_period varchar(6)  )

AS
BEGIN

	SELECT p.*,r.[Paid To Store],r.[Paid To Affiliate] from  pharmacymaster..PM_Rebates_PPartner r
	join
		(SELECT  PMID, aapaccountno as AAP# , aapparentno as [Parent#],
		apiaccountno as [API#] ,
		CONVERT(VARCHAR(10),  AAPEffectiveDate, 101) as [AAP Eff],
		CONVERT(VARCHAR(10),  AAPQuitDate, 101) as [AAP Quit],
		AccountDescription as 	[Description] ,
		Affiliate,
		[accountname] as [Account DBA Name] ,
		Addr1 as [Address],
		City, 
		State as ST,
		territory  as TM  from pharmacymaster..v_pm_allwithaffiliates
	) p on r.pmid = p.pmid
	where period = @in_period  

END








GO
