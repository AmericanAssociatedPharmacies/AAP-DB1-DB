USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spQC_HasData]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spQC_HasData]
(
@ncpdp varchar(15)
)
as
-- 1/14/15 bg replaces spQC_Rx30andMC 
select top 1 [pharm id] as ncpdp from Rx30Latest where [pharm id]=@ncpdp

--grant exec on spQC_HasData to webdevuser
GO
