USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[spLastLoadedDate]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spLastLoadedDate]
as
select top 1 * from chph_loadlog order by date_loaded desc
GO
