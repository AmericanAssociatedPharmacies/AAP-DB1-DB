USE [Medispan]
GO
/****** Object:  View [dbo].[vwDrugMasterC2]    Script Date: 12/22/2020 9:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwDrugMasterC2]

AS


SELECT ISNULL(l1.NDC,l2.NDC) AS NDC
, ISNULL(l1.PS,l2.PS) AS PS
, ISNULL(l1.DEA_Class_Code, l2.DEA_Class_Code) AS DEAClassCode
, CONVERT(BIT, IIF(l1.NDC IS NOT NULL, 1, 0)) AS IsC2Exclusion 
FROM Medispan.dbo.DrugMaster AS d
LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l1 ON d.NDC = l1.NDC																				
													AND l1.DEA_Class_Code <> 'C-II'
													--AND l1.NDC > '0'
LEFT OUTER JOIN Medispan.dbo.DrugMaster AS l2 ON d.NDC = l2.NDC		
													--AND l2.NDC > '0'																	
															
WHERE (l1.NDC <> '0'
		OR l2.NDC <> '0'
		)

--(l1.RowID = (l1.RowID + 0)
--		OR l2.RowiD = (l2.RowID + 0)
--	 )
AND (l1.NDC IS NOT NULL
		OR l2.NDC IS NOT NULL
		)
AND (l1.PS IS NOT NULL
		OR l2.PS IS NOT NULL					
		)
AND(l1.DEA_Class_Code IS NOT NULL
	OR
	l2.DEA_Class_Code IS NOT NULL
	)			
GO
