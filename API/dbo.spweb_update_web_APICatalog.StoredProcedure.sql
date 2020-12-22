USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spweb_update_web_APICatalog]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_update_web_APICatalog]
as
begin
truncate table api..web_APICatalog

insert into api..web_APICatalog
select ndc,APIItemNbr,Description
from purchases..APIPrice
where dateloaded = (select max(dateloaded) from purchases..APIPrice)

end
GO
