USE [MedispanImages]
GO
/****** Object:  StoredProcedure [dbo].[sp_medispan_erpapi_backup_20190723]    Script Date: 12/22/2020 4:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:        Grant Martin
-- Create date: 20190606
-- Description:    lookup erpapi data for medispan endpoint
-- =============================================
CREATE PROCEDURE [dbo].[sp_medispan_erpapi_backup_20190723]
    -- Accepts varchar value for NDC
    @NDC varchar(11)
AS
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

   -- select from view
    SELECT
       [NDC] as ndc
     ,[ndc_upc_hri_formatted]
     ,[GPI] as gpi
     ,[drug_name]
     ,[description]
     ,[manufacturer]
     ,[drug_type]
     ,[Form] as form
     ,[packaging_description]
     ,[qty]
     ,[rx_or_otc]
     ,[AWP] as awp
     ,[route_of_administration]
     ,[strength]
     ,[unit_of_measure]
     ,[Unit] as unit
     ,[dea_schedule]
     ,[ab_code]
     ,[image_filename]
     ,[brand_name]
      from dbo.vw_medispan_erpapi where NDC = @NDC


GO
