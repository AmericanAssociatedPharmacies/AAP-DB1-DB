USE [WebDev]
GO
/****** Object:  View [dbo].[v_hasQCdata]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_hasQCdata]
as
select distinct pharmid as ncpdp from webdev..qc_DDI
union
select distinct [pharm id] as ncpdp from webdev..QC_HRM
union
select distinct [pharm id] as ncpdp from webdev..QC_Adherence
GO
