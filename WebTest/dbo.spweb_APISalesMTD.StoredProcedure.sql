USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_APISalesMTD]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spweb_APISalesMTD]
(
@apiaccountno varchar(50)
)
as
begin
select * from v_web_APISalesMTD where apiaccountno=@apiaccountno
end
GO
