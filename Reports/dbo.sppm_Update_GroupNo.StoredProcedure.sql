USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Update_GroupNo]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/13/2011>
-- Description:	Update GroupNo in PM_Pharmacy with AAPParentNo - where GroupNo is null
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Update_GroupNo]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   

	   UPDATE  pm  set 
			pm.groupno = g.aapparentno  
	   FROM pm_pharmacy   pm 
		inner join 
			( select aapparentno,pmid from pm_pharmacy where (groupno is null
				or groupno = '' ) and ( aapparentno is not null
				and aapparentno != '' ) ) g
	    on pm.pmid = g.pmid   
END










GO
