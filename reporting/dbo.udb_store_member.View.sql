USE [reporting]
GO
/****** Object:  View [dbo].[udb_store_member]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[udb_store_member]
as
SELECT DISTINCT *
FROM         OPENQUERY(UNITEDDB, 'select *  from united.store_member')
                      AS derivedtbl_1

GO
