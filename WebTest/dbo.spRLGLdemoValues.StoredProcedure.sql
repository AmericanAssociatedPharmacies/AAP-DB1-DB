USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRLGLdemoValues]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spRLGLdemoValues]
(
@ncpdp varchar(7)
)
as
/*
	pick two tracked claims, one red one green for RLGL demo on cgstatus/index_data.php BG
*/
begin
declare @rxg varchar(50),@rxgd varchar(15), @rxr varchar(50),@rxrd varchar(15)
select top 1 
@rxg=[rx nbr],@rxgd=convert(varchar,[rx date],101)
from
temptables..RLGLtemp_data3mo
where NCPDP=@ncpdp
and nolossnet > 1.0
and [rx nbr] in (select rxnbr as [rx nbr]  from WebDev.dbo.UPStatus where [pharmid]=@ncpdp)
order by [rx date] desc

select top 1 
@rxr=[rx nbr],@rxrd=convert(varchar,[rx date],101)
from
temptables..RLGLtemp_data3mo
where NCPDP=@ncpdp
and lossnet < -1.0
and [rx nbr] in (select rxnbr as [rx nbr]  from WebDev.dbo.UPStatus where [pharmid]=@ncpdp) 
order by [rx date] desc

/*
drop table webdev.dbo.RLGLdemovalues
select @ncpdp as ncpdp, @rxg as rxg,@rxgd as rxgd,@rxr as rxr, @rxrd as rxrd into webdev.dbo.RLGLdemovalues 
*/
truncate table webdev.dbo.RLGLdemovalues
insert into webdev.dbo.RLGLdemovalues(ncpdp,rxg,rxgd,rxr,rxrd)
	values(@ncpdp,@rxg,@rxgd, @rxr,@rxrd)
end

GO
