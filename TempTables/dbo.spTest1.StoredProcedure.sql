USE [TempTables]
GO
/****** Object:  StoredProcedure [dbo].[spTest1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spTest1]
@param varchar(50)
as
select 'foo' as foo, @param as bar
GO
