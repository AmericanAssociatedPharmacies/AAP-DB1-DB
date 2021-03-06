USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_StandingReport_Compare]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
Create PROCEDURE [dbo].[sppm_create_StandingReport_Compare]
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
SELECT cast('' as varchar(6)) as IdentificationID,
	NCPDP,NPI,
	cast(OwnerName as varchar(30)) as [Owner/Officer] ,
	cast(AccountName as varchar(20)) as Name,
	cast(pharmacymaster.dbo.csfn_splitAddress(addr1,addr2,1) as varchar(7)) as StreetNumber,

	cast(pharmacymaster.dbo.csfn_splitAddress(addr1,addr2,2) as varchar(30)) as StreetName1,

	cast(pharmacymaster.dbo.csfn_splitAddress(addr1,addr2,3) as varchar(30)) as StreetName2,

	cast(City  as varchar(15))as CityName,
	State,
	SUBSTRING(Zip,1,5) as ZipCode,
	cast(email as varchar(30)) as [Owner/Officer email],
	cast(replace(Fax,'-','') as varchar(10)) as [Fax number] ,
    cast (Affiliate as varchar(30)) as Affiliate

	 from pharmacymaster..v_PM_AllWithAffiliates
	--where ((affiliate != 'Pipco' 
	--and affiliate != 'PFOA'
	--and affiliate not like '%Keystone%' and affiliate not like '%LEGEND%' ) or affiliate is null)
	where aapaccountno is not null and aapquitdate is null
  

END








GO
