USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRxCareSelect_NDC4List]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRxCareSelect_NDC4List]
--               10/16/2015 DG  sorted by Drug Name 
as
--select NDC, Drugname from Webdev..DCUDIRX4 order by NDC
select NDC, Drugname from Webdev..DCUDIRX4 order by Drugname
GO
