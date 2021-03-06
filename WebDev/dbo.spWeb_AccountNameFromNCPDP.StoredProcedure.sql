USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spWeb_AccountNameFromNCPDP]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spWeb_AccountNameFromNCPDP]
(
@ncpdp varchar(10)
)
as
declare @an varchar(255),@on varchar(255)
select top 1 @an = accountname,@on = ownername from v_web_userdata where ncpdp=@ncpdp and accountname is not null
select 
	case when @an is null then '' else @an end as accountname,
	case when @on is null then '' else @on end as ownername
GO
