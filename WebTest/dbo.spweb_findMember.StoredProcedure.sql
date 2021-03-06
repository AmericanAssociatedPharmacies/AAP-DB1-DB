USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_findMember]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spweb_findMember]
	@search varchar(255)
AS

	select v.accountname,v.city,v.state,v.ncpdp,v.apiaccountno,v.aapaccountno,v.pmid as viewpmid
		from pharmacymaster..v_pm_allwithaffiliates v 
		where 
			v.aapaccountno=@search
			or v.apiaccountno=@search
			or v.ncpdp=@search
			or convert(varchar(8),v.pmid)=@search
			or v.accountname like '%' + @search + '%'
			or v.corporatename like '%' + @search + '%'
GO
