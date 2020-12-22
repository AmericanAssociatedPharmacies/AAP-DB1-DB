USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spSpecialty_TestForAuthorizeException]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spSpecialty_TestForAuthorizeException]
(
@ncpdpOrPMID varchar(7)
)
as
select top 1 * from Specialty_AuthorizeExceptions where ncpdp=@ncpdpOrPMID or pmid=cast(@ncpdpOrPMID as int)
--grant exec on Specialty_TestForAuthorizeException to webdevuser
GO
