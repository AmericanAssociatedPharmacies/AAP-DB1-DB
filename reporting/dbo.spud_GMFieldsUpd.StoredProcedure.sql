USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMFieldsUpd]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 06/18/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spud_GMFieldsUpd]
	@90days int
AS
BEGIN
	
	SET NOCOUNT ON;

    UPDATE tmp_MagmaClaims SET GCN =  v_NDCGCN.GCN FROM tmp_MagmaClaims JOIN v_NDCGCN ON ndc11 = v_NDCGCN.NDC

	UPDATE tmp_MagmaClaims SET TotalWAC =  v_FDBWAC.NPT_PRICEX FROM tmp_MagmaClaims JOIN v_FDBWAC ON ndc11 = v_FDBWAC.NDC

	UPDATE tmp_MagmaClaims SET TotalWAC =  GMPrice.[Price Per Unit] FROM tmp_MagmaClaims JOIN GMPrice ON ndc11 = GMPrice.[NDC UPC]

	UPDATE tmp_MagmaClaims SET TotalWAC =  TotalWAC * [TRx Quantity Dispensed]

	
/*	if @90days = 1

	Begin
		UPDATE tmp_MagmaClaims SET TotalWAC =  v_FDBWAC.NPT_PRICEX FROM tmp_MagmaClaims JOIN v_FDBWAC ON ndc11 = v_FDBWAC.NDC

		UPDATE tmp_MagmaClaims SET TotalWAC =  GMPrice.[Price Per Unit] FROM tmp_MagmaClaims JOIN GMPrice ON ndc11 = GMPrice.[NDC UPC]

		UPDATE tmp_MagmaClaims SET TotalWAC =  TotalWAC * [TRx Quantity Dispensed]
	End

	if @90days = 2

	Begin
		UPDATE tmp_MagmaClaims SET TotalWAC =  v_FDBWAC.NPT_PRICEX FROM tmp_MagmaClaims JOIN v_FDBWAC ON ndc11 = v_FDBWAC.NDC

		UPDATE tmp_MagmaClaims SET TotalWAC =  GMPrice.[Price Per Unit] FROM tmp_MagmaClaims JOIN GMPrice ON ndc11 = GMPrice.[NDC UPC]

		UPDATE tmp_MagmaClaims SET TotalWAC =  TotalWAC * [TRx Quantity Dispensed]
	End
*/

END




GO
