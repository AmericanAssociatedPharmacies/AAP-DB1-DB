USE [ODSIntake]
GO
/****** Object:  View [dbo].[vw_CorrectedLaJolla]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vw_CorrectedLaJolla] 
AS

SELECT [Date]
      ,[PMID]
      ,[AAP Number] AS AAP#
      ,[API acct] 
      ,[Customer Name]
      ,[City]
      ,[State] AS ST
      ,[Bs Class]
      ,[Month]
      --,[Multiple Store Code]
      ,[Current Est Mo Sales]
      ,[Mo API Volume]
      ,[CAH off Contract-LTC Volume]
      ,[AAP Net Sales]
      ,[Mo Comb Volume]
      ,[AAP Sales- COG Applied]
      ,[AAP Brand RX Sales]
      ,[Current CA COG]
      ,[Base]
      ,[Brand RX@WAC]
      ,[Brand RX Saved]
      ,[Generic Source]
      ,[1% Generic Admin]
      ,[Incentive from AAP Net Sales]
      ,[High Volume Incentive]
      ,[Total Saved]
      ,[ECOG]
      ,[COG Reduction]
      ,[A/P Terms] AS [A/P Payment Mode]
      ,[Group]
     -- ,[Pay Y/N]
  FROM [ODSIntake].[dbo].['Corrected LaJolla']
  
GO
