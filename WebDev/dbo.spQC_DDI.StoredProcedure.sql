USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spQC_DDI]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spQC_DDI]
(
@ncpdp varchar(7),
@showall int	--1 show all, 0 except hide=1. This is no longer being used 8/15
)
as
--declare @test int
--set @test=case when @showall=1 then 2 else 1 end
begin
	select 
--convert(varchar,d.id) + ',' + convert(varchar,d.DDIRxID) as id
d.id
,d.patid as Patient
,drugname as [Drug 1]
,ddidrugname as [Drug 2]
,Catg as [Type]
,rxnbr as [Rx 1]
,CONVERT(VARCHAR(8),[rx date],1) as [Date 1]
,[day supply] as [DS 1]
,cast(rfnbr as varchar(5)) + case when ra is null then '' else '/' + cast(ra as varchar(5)) end as [Rfl 1]
,ddirxnbr as [Rx 2]
,CONVERT(VARCHAR(8),[ddirxdate],1) as [Date 2]
,ddids as [DS 2]
,cast(ddirfnbr as varchar(5)) + case when ddira is null then '' else '/' + cast(ddira as varchar(5)) end as [Rfl 2]

from [QC_DDI] d
where pharmid=@ncpdp
--where pharmid=@ncpdp --and isnull(hide,0)<>@test
--order by pharmid,patid,case when [rx date]> ddirxdate then [rx date] else ddirxdate end  desc
order by pharmid,case when [rx date]> ddirxdate then [rx date] else ddirxdate end  desc


end

--select top 100 * from QC_DDI
--GO


GO
