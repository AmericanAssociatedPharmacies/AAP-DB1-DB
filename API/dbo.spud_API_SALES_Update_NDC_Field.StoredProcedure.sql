USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_API_SALES_Update_NDC_Field]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_API_SALES_Update_NDC_Field]

AS
SET NOCOUNT ON
BEGIN

UPDATE apisalesdetail set ndc = REPLACE(ndc_orig, '-', '')      
	WHERE substring(ndc_orig,6,1)  = '-'
	and  substring(ndc_orig,11,1)  = '-' and len(ndc_orig)   = 13;

-- Now update the ndc field with what was in the ndc_orig (don't look like valid numbers to me)
UPDATE apisalesdetail set ndc = ndc_orig where ndc  = '';

SET  NOCOUNT OFF
END




GO
