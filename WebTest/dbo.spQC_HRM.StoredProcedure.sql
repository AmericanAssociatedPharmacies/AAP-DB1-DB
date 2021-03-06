USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spQC_HRM]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spQC_HRM]
(
@ncpdp varchar(7),
@showall int	--1 show all, 0 except hide=1
)
as
declare @test int
set @test=case when @showall=1 then 2 else 1 end
begin
	select 
		--[Pharm ID]
      [PatID] as Patient
      --,CONVERT(VARCHAR(8),[PatientDOB],1)  as DOB
      --,DateDiff("yy",[PatientDOB],[LastFillDate]) as Age
      ,[DrugName]
      ,[Rx Nbr]
,CONVERT(VARCHAR(8),[LastFillDate],1) as [Last Fill]    
,CONVERT(VARCHAR(8),[NextFillDate],1) as [NextFillDate] 
      ,[RefillNbr] as [Refill]
      ,[RefillsRemain]
      --,[DaysAfterLastRefill]
      ,[DaySupply]
      ,[BINNbr] as BIN
      ,[PlanName] as [Plan]
      --,[GPI]      
from [QC_HRM] d
where [Pharm ID] like @ncpdp --and isnull(hide,0)<>@test
--and 	 (DateDiff("yy",[PatientDOB],[LastFillDate]) > 65)
--order by [patid],[rx nbr]
order by [NextFillDate] desc

--grant exec on [spQC_HRM] to webdevuser

end

GO
