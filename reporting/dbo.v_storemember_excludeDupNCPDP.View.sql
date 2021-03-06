USE [reporting]
GO
/****** Object:  View [dbo].[v_storemember_excludeDupNCPDP]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_storemember_excludeDupNCPDP]
as
select m.* from storemember m
where m.store_id in 
(select max(m2.store_id) from storemember m2 group by nabp)
GO
