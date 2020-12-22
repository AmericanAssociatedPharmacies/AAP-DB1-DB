USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spweb_update_web_NDCList]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_update_web_NDCList]
as
begin
truncate table api..web_NDCList

insert into api..web_NDCList
select ndc,drugname,mfg
from medispan..drugmaster
where obsdtec is null

end
GO
