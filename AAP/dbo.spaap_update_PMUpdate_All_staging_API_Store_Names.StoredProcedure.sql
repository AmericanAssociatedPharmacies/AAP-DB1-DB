USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_update_PMUpdate_All_staging_API_Store_Names]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Update the API Store Names (get garbage out) for the AccountMaster table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_update_PMUpdate_All_staging_API_Store_Names]

AS
	BEGIN
 
	update PMUpdate_All_staging set accountname  = replace(accountname,'(M)','')
where
source= 'API';

update PMUpdate_All_staging set accountname  = replace(accountname,'*QPS','')
where
source= 'API';

update PMUpdate_All_staging set accountname  = replace(accountname,'NE-','')
where
source= 'API';

update PMUpdate_All_staging set accountname  = replace(accountname,'*QP','')
where
source= 'API';

    END









GO
