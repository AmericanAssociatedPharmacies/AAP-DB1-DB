USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_NDCSearch_byNDC]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_NDCSearch_byNDC]
(
	@NDC varchar(15)
)
as
select top 1 * 
from api..web_NDCList
where ndc = dbo.ssfn_convertNDC(@NDC)
GO
