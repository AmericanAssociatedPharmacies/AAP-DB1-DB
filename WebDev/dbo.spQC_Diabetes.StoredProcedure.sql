USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spQC_Diabetes]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spQC_Diabetes]
(
--rxaap.com quality center 12/2014 bg TODO: add 'hide' column back when restored to table creation job
@ncpdp varchar(7),
@showall int	--1 show all, 0 except hide=1
)
as
declare @test int
set @test=case when @showall=1 then 2 else 1 end
begin

SELECT     
PatID
, Rx
, NDC
, DrugName
,CONVERT(VARCHAR(8),[StartDate],1)  as [Fill]
,CONVERT(VARCHAR(8),[EndDate],1)  as [Through]

FROM         dbo.QC_DiabetesPlan

where [Pharm ID]=@ncpdp --and isnull(hide,0)<>@test
order by startdate desc, PatID 


/*SELECT     
PatID
, Rx1
, NDC1
, DrugName1
,CONVERT(VARCHAR(8),[StartDate1],1)  as [Fill1]
,CONVERT(VARCHAR(8),[EndDate1],1)  as [Through1]
, Rx2
, NDC2
, DrugName2
,CONVERT(VARCHAR(8),[StartDate2],1)  as [Fill2]
,CONVERT(VARCHAR(8),[EndDate2],1)  as [Through2]

FROM         dbo.QC_DiabetesPlan

where [Pharm ID]=@ncpdp --and isnull(hide,0)<>@test
order by case when (startdate1>startdate2) then startdate1 else startdate2 end desc, PatID */


--grant exec on spQC_Diabetes to webdevuser

end

GO
