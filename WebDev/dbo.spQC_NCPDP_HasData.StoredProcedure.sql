USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spQC_NCPDP_HasData]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spQC_NCPDP_HasData]
(
@ncpdp varchar(15)
)
as
/*
this originally was set up with a job to populate the table QC_NCPDPs, but it's fast enough without that.
BG 5/15

*/
declare @match varchar(15)
declare @match2 varchar(15)
set @match = (select top 1 [pharm id] as ncpdp from QC_Adherence where [pharm id]=@ncpdp)
if (@match is null) set @match = (select top 1 [pharmid] as ncpdp from QC_DDI where [pharmid]=@ncpdp)
if (@match is null) set  @match =(select top 1 [pharm id] as ncpdp from QC_HRM where [pharm id]=@ncpdp)
--if (@match is null) set @match = (select top 1 [ncpdp] from QC_Anthem where [ncpdp]=@ncpdp)
select @match as ncpdp

--[spQC_NCPDP_HasData] '5905130'
GO
