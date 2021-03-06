USE [MedispanImages]
GO
/****** Object:  StoredProcedure [dbo].[sp_medispan_erpapi]    Script Date: 12/22/2020 4:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Grant Martin
-- Create date: 20190606
-- Description:	lookup erpapi data for medispan endpoint
-- =============================================
CREATE PROCEDURE [dbo].[sp_medispan_erpapi]
	-- Accepts varchar value for NDC
	@NDC varchar(8000)
AS
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

BEGIN

	DECLARE @T TABLE(NDC VARCHAR (20))

	INSERT INTO @T(NDC)
	SELECT DISTINCT LTRIM(RTRIM(Item)) AS NDC
	FROM [dbo].[SplitStrings_Moden](@NDC, ',')

    -- select from view
	SELECT 
	   [NDC] as ndc
	  ,[NDC_10] as ndc_10
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
	  ,[drug_class]
	  ,[drug_subclass]
	  from dbo.vw_medispan_erpapi as m 
	  where exists (SELECT 1
					FROM @T AS t				
					where t.NDC = m.ndc
			)


END


GO
