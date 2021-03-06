USE [MedispanImages]
GO
/****** Object:  View [dbo].[vw_medispan_erpapi_backup_20190723]    Script Date: 12/22/2020 9:20:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  *****
and MFG like 'CERN%'
order by m.NDC*/
CREATE VIEW [dbo].[vw_medispan_erpapi_backup_20190723]
AS
SELECT DISTINCT 
                         m.NDC, a.Formatted_ID_Number AS ndc_upc_hri_formatted, m.GPI, m.DrugName AS drug_name, m.GPIDesc AS description, m.MFG AS manufacturer, m.DrugType AS drug_type, m.Form, m.PD AS packaging_description, 
                         m.PS AS qty, m.RxOTC AS rx_or_otc, m.AWP, m.RouteAdmin AS route_of_administration, { fn CONCAT(m.Strength, m.Strength_Unit_Measure) } AS strength, m.Strength_Unit_Measure AS unit_of_measure, m.Unit, 
                         m.DEA AS dea_schedule, a.TEE_Code AS ab_code, i.Image_Filename AS image_filename, o.DrugName AS brand_name
FROM            Medispan.dbo.DrugMaster AS m LEFT OUTER JOIN
                         Medispan.dbo.M25_A AS a ON m.NDC = a.NDC_UPC_HRI LEFT OUTER JOIN
                         dbo.vw_image_by_ndc AS i ON m.NDC = i.NDC LEFT OUTER JOIN
                         Medispan.dbo.DrugMaster AS o ON m.GPI = o.GPI AND o.MSC = 'o'


GO
