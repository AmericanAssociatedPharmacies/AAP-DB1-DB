USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_APISalesMTD]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_APISalesMTD]
(
@apiaccountno varchar(50)
)
as
begin
select * from v_web_APISalesMTD where [API Account No]=@apiaccountno
end
GO
