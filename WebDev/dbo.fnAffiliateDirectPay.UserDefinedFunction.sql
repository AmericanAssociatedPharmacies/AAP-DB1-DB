USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAffiliateDirectPay]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnAffiliateDirectPay]
(
	@affiliate varchar(125),
	@aapparentno int,
	@udparentno varchar(25)
)
RETURNS varchar(125)
WITH EXECUTE AS CALLER
AS
BEGIN
declare @affiliateDirectPay varchar(125)
SET @affiliateDirectPay =
	case 
	when (@udparentno='0834' or @aapparentno=11377) then 'BASHAS'
	else 
		case isnull(@affiliate,'')
			when 'PIPCO' then 'PIPCO'
			when 'KEYSTONE' then 'KEYSTONE'
			when 'KEYSTONE-PRS' then 'KEYSTONE'
			when 'LEGEND-LA & MS' then 'LEGEND'
			when 'PFOA' then 'PFOA'
			when 'PFOA-Kirkwood' then 'PFOA'
			else NULL
		end
	end 
RETURN(@affiliateDirectPay)
END;
-- usage:
-- select pmid,accountname,
-- dbo.fnAffiliateDirectPay(affiliate,aapparentno,udparentno) as [AffiliateDirectPay]
-- from pharmacymaster..v_pm_allwithaffiliates
GO
