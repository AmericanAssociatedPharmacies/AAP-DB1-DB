USE [WebTest]
GO
/****** Object:  View [dbo].[v_DCPRiceRX05]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_DCPRiceRX05]
AS
SELECT m.NDC,m.AWP,m.DrugName,case when m.DrugType='MULTI-SOURCE GENERIC' then 'NMG' else 'Brand' end AS [Reimbursement Indictor]
FROM  Medispan.dbo.DrugMaster AS m INNER JOIN
CLAIMS..v_LowestAAPPrice AS v ON m.NDC = v.[NDC UPC] 

WHERE (m.DrugType='MULTI-SOURCE GENERIC') and (v.AAPPrice < 0.13550) AND
	  (m.DEA <> 2) AND (m.DEA <> 3) AND (m.DEA <> 4) AND
	  (m.Unit <> 'ML') AND (m.Unit <> 'GM')AND
	  (m.Form <> 'LIQD') AND (m.Form <> 'GEL') AND (m.Form <> 'LOTN') AND
      (m.Form <> 'CREA') AND (m.Form <> 'SUSP') AND (m.Form <> 'SUSR') AND 
      (m.Form <> 'POWD') AND (m.Form <> 'SHAM') AND (m.Form <> 'CONC') AND 
	  (m.Form <> 'OINT') and (m.RXOTC<>'OTC')



GO
