USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_CalculateAWP]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/27/08
-- Description:	AWP Analysis
-- =============================================
CREATE PROCEDURE [dbo].[spud_CalculateAWP]
	
AS

	BEGIN

		SET NOCOUNT ON;

				/* Update AWPAnalysis set [Total  AWP] =  LTRIM(RTRIM(REPLACE(REPLACE([Total  AWP], '$', ''),',',''))),
					[Patient Paid Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Patient Paid Amount], '$', ''),',',''))),
					[Total Paid Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Total Paid Amount], '$', ''),',',''))),
					[Dispensing Fee Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Dispensing Fee Amount], '$', ''),',',''))),
					[Total Ingredient Cost] =  LTRIM(RTRIM(REPLACE(REPLACE([Total Ingredient Cost], '$', ''),',',''))),
					[Usual Customary Amount] =  LTRIM(RTRIM(REPLACE(REPLACE([Usual Customary Amount], '$', ''),',',''))), 
					[TRx Quantity Dispensed] =  LTRIM(RTRIM(REPLACE(REPLACE([TRx Quantity Dispensed], '$', ''),',','')))
				*/			

				/*	Update AWPAnalysis set AWPUnit =  ( SELECT CASE [TRx Quantity Dispensed] 
								WHEN 0 THEN [Total  AWP]
								else 	([Total  AWP]/[TRx Quantity Dispensed])	
							END as AWPUnit FROM AWPAnalysis AWP WHERE AWP.id = AWPAnalysis.ID ) */

					
				/*	Update AWPAnalysis set WAC = v_AWPAll.WHN,
										 WACPkg = v_AWPAll.WHNPKG FROM v_AWPAll join AWPAnalysis ON v_AWPAll.ID = AWPAnalysis.ID */

				/*	Update AWPAnalysis Set  AdjustedAWP =  WAC * 1.20 */
				

				/*Update AWPAnalysis Set TotalAdjustedAWP =  (AdjustedAWP * [TRx Quantity Dispensed]) */

				Update AWPAnalysis Set 	TotalAdjustedReimburse = (TotalAdjustedAWP * .85) + 2

				 Update AWPAnalysis Set  AdjustedReimburseRate =  (TotalAdjustedAWP * .85) + 2 



				/*  Update AWPAnalysis Set TotalWAC = WAC * [TRx Quantity Dispensed] */

				/*Update AWPAnalysis Set TotalCurrentReimburse = ([Total  AWP] * .85) + 2 */
									
									 
 	
	END					


GO
