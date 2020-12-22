USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_isInRx30Latest]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spRLGL_isInRx30Latest]
(
@ncpdp varchar(11)
)
as
select case when @ncpdp in
(select distinct [pharm id] as ncpdp from Rx30Latest)
then 1 else 0 end as ret
GO
