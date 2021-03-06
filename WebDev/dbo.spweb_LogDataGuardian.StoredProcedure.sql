USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_LogDataGuardian]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_LogDataGuardian]
(
@PMID int,
@NCPDP varchar(15),
@name varchar(255),
@software varchar(255),
@imagecapture int,
@contact varchar(255),
@contact_install varchar(255),
@phone  varchar(50),
@email  varchar(50),
@npi varchar(15),
@hipaaofficer varchar(255),
@aapid int,
@address varchar(255),
@hours varchar(255)
)
AS
begin
insert into DataGuardian_log (PMID,dt,NCPDP,name,software,imagecapture,
	contact,contact_install,phone,email,npi,HipaaOfficer,AAPID,address,hours)
values (@PMID,getdate(),@NCPDP,@name,@software,@imagecapture,
	@contact,@contact_install,@phone,@email,@npi,@hipaaofficer,@aapid,@address,@hours)
end

--grant exec on spweb_LogDataGuardian to webdevuser
GO
