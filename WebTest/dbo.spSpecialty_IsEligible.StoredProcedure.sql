USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spSpecialty_IsEligible]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spSpecialty_IsEligible]
(
@pmid int
,@ncpdp varchar(15)
,@software varchar(50)
)
as
/*
return 1 if found, else null
if pharmacy software in Specialty_software or if ID in Specialty_AuthorizeExceptions
note that @software matches the 'software' column in pharmacymaster..software
*/
begin
select 1 as found
where exists 
(
select top 1 * from Specialty_AuthorizeExceptions where ncpdp=@ncpdp
)
or exists
(select top 1 * from Specialty_AuthorizeExceptions where pmid=@pmid)
or exists
(select top 1 software from Specialty_Software where software=@software)
end
--grant exec on spSpecialty_IsEligible to webdevuser
GO
