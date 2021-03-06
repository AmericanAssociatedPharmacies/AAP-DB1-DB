USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_QTR_NCPDP_COG_LS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_QTR_NCPDP_COG_LS]
(@in_QTR varchar(2), @in_year varchar(4) )


AS
BEGIN
 
select    ncpdp as NCPDP, m.ChainCode as [MC Affiliate Code], a.currchcog as [Cardinal COG] from pm_pharmacy p
join
(
select * from pm_managedcare where chaincode is not null and mcquitdate is   null
) m
on p.pmid = m.pmid
left outer join
(
    select currchcog,pmid from pm_chaccounts_adj
)a on p.pmid = a.pmid where p.aapquitdate is null 
order by ncpdp
END








GO
