USE [TempTables]
GO
/****** Object:  StoredProcedure [dbo].[sprep_Globalv2]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sprep_Globalv2]
as
begin
select v.PMID, v.aapaccountno as [AAP#],
v.accountname as name,
--v.addr1 as address,
v.city,v.state as st,v.territory as tm,
v.dea,v.ncpdp,v.businessclass as bc,
--v.accountdescription,

r.CH_0210_GenQual + r.CH_0310_GenQual + r.CH_0410_GenQual as CH_GenSource,
r.CH_0210_GenExcl + r.CH_0310_GenExcl + r.CH_0410_GenExcl as GenExcl,
r.CH_0210_GenTotal + r.CH_0310_GenTotal + r.CH_0410_GenTotal as GenTotal,
r.CH_0210_Br + r.CH_0310_Br + r.CH_0410_Br as CH_Br,
r.CH_0210_Extended + r.CH_0310_Extended + r.CH_0410_Extended - (r.CH_0210_Br + r.CH_0310_Br + r.CH_0410_Br) - (r.CH_0210_GenTotal + r.CH_0310_GenTotal + r.CH_0410_GenTotal) as CH_Oth,
r.CH_0210_Extended + r.CH_0310_Extended + r.CH_0410_Extended as CH_Total,
api.February_BR + api.March_BR + api.April_BR as API_BR,
api.February_GEN + api.March_GEN + api.April_GEN as API_GEN,
api.February_OTC + api.March_OTC + api.April_OTC as API_OTC,
api.February_BR + api.March_BR + api.April_BR + api.February_GEN + api.March_GEN + api.April_GEN + api.February_OTC + api.March_OTC + api.April_OTC as API_Total,
--ml.February as ML_0210,
--ml.March as ML_0310,
--ml.April as ML_0410,
ml.February+ml.March+ml.April as ML_Total,
--mlg.February+mlg.March+mlg.April as ML_Total_GEN,
anda.February+anda.March+anda.April as Anda_GEN


from  v_PM_AllWithAffiliates_Filtered  v
left join reporting..tmp_udvolrollup_ML ml on v.pmid=ml.pmid
left join reporting..tmp_udvolrollup_MLGEN mlg on v.pmid=mlg.pmid
left join reporting..tmp_udvolrollup_ANDAGEN anda on v.pmid=anda.pmid
left join api..tmp_2010_WHSales api on v.apiaccountno=api.whaccountid
left join tmp_CHRebateSales_2010 r on v.pmid=r.pmid
where v.aapaccountno is not null

order by v.accountname --v.state,v.city,v.accountname
end
GO
