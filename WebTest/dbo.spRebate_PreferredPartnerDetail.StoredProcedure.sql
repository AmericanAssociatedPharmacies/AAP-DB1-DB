USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_PreferredPartnerDetail]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRebate_PreferredPartnerDetail]
(
@PMID int
,@period varchar(8)
)
as
select VendorName
,Volume
--,round([Rebate Amount]*0.9,2,1) as [Rebate Amount]
,'$ ' + convert(varchar(50),round(isnull([Rebate Amount]*0.9,0.0),2,1),-1)
 --from pharmacymaster..v_VendorVolumeDetailed
 from  pharmacymaster..pm_rebates_ppdetails
where pmid=@PMID and period=@period


GO
