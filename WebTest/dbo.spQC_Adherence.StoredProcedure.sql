USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spQC_Adherence]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spQC_Adherence]
(
@ncpdp varchar(11)
)
as

SELECT --[Pharm ID]
      [BINNbr] as [Bin]
      ,[PlanName] as [Plan]
      --,[GPI]
      ,[PatID] as [Patient ID]
      ,CONVERT(VARCHAR(8),[PatientDOB],1) as [DOB]
      ,[DrugName]
      ,[Rx Nbr]
      ,CONVERT(VARCHAR(8),[NextFillDate],1) as [NextFillDate]
      ,CONVERT(VARCHAR(8),[LastFillDate],1) as [LastFillDate]
      ,[RefillsRemain]
      ,[RefillNbr]
      ,[DaysAfterLastRefill]
      ,[DaySupply]
      
  FROM [WebDev].[dbo].[QC_Adherence]
  where [pharm id] = @ncpdp
  order by [NextFillDate] desc
  
--  grant execute on spQC_Adherence to webdevuser
/*
select top 10 * from QC_Adherence --where category is not null
select max(lastfilldate) from QC_Adherence where [pharm id]='0105432'
*/
GO
