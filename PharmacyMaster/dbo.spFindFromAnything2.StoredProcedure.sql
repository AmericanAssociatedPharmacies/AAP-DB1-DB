USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spFindFromAnything2]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spFindFromAnything2]
(
@arg varchar(255)
)
as
declare @arglike varchar(255)
declare @arglike2 varchar(255)
select @arglike=@arg + '%'
select @arglike2 = '%' + @arg + '%'

select 
pmid,ncpdp,npi,apiaccountno,accountname,city,state,email,AAPStatus,APIStatus,isMCorNPP,isNPP,isArete
 from v_testArete
where 
convert(varchar,pmid) = @arg
or
ncpdp=@arg
or
apiaccountno=@arg
or
aapaccountno=@arg
or 
accountname like @arglike
or
corporatename like @arglike
or 
email like @arglike
or
contactfullname like @arglike2
order by pmid desc
GO
