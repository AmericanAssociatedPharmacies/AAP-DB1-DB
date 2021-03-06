USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spbg_deleteme]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbg_deleteme]
as

Declare @XML XML 
set @XML = (select top 2 g.pmid, a.address as addr1, city,state,zip
                        from pm_geocode g left join PM_AddressMaster a on g.pmid=a.pmid
                        where g.latitude is null and a.address_type_id=1 order by pmid
						for xml auto)
select @XML


GO
