USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_QTR_NCPDP_COG_LS]    Script Date: 12/22/2020 5:00:31 AM ******/
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

AS
BEGIN
 
select    ncpdp as NCPDP, m.ChainCode as [MC Affiliate Code], a.currchcog as [Cardinal COG] ,
case   when w.vendor = 'ML' then 'Miami Luken' when w.vendor = 'CH' then 'Cardinal'  end as [Primary Wholesaler] from pharmacymaster..pm_pharmacy p
join
(
select * from pharmacymaster..pm_managedcare where chaincode is not null and mcquitdate is   null
) m
on p.pmid = m.pmid
left outer join
(
    select currchcog,pmid from pharmacymaster..pm_chaccounts_adj
)a on p.pmid = a.pmid

left outer join
(
 select * from pharmacymaster..v_wholesaler_primary
) w on w.pmid = a.pmid  where p.aapquitdate is null 
order by ncpdp
END








GO
