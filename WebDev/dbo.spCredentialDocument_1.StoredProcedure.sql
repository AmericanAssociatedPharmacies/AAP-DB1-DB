USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spCredentialDocument_1]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spCredentialDocument_1]
(
	@category varchar(50)
)
as
select 
--docid as ID
questionid
,docdesc as Description
,0 as Completed
 from CredentialDocumentList
where category = @category
order by docid

--select * from CredentialDocumentList
GO
