USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_isStateMAC]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRLGL_isStateMAC]
(
	@state varchar(8)
)
as
select count(State) as [count] from UPStateMAC where State = @state
GO
