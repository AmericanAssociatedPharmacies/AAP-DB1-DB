USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_CalculateRX]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/17/08
-- Description:	Formatting Rx30 Files
-- =============================================
CREATE PROCEDURE [dbo].[spud_CalculateRX]
	
AS

	BEGIN

		SET NOCOUNT ON;

				--Update united set AWP =  FDB.dbo.RNP2_PIVOT.BB FROM FDB.dbo.RNP2_PIVOT INNER JOIN united ON FDB.dbo.RNP2_PIVOT.NDC = united.NDC

				--Update united Set	[Discount] = ([Cost Paid] + [Co Pay Amount])/([Qty Dispensed] * AWP) 

				--Update united Set	[Discount] = ([Plan Amount] + [Co Pay Amount])/([Qty Dispensed] * AWP) 
				
				-- SELECT SUM(Discount) AS [Total discount], SUM(Discount2) AS [Total discount1] FROM v_RxMinnCom
						
	END					

			














GO
