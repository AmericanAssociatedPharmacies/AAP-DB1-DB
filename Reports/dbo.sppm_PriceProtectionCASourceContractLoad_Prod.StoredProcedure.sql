USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtectionCASourceContractLoad_Prod]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 12/15/2014
-- Description:	load Cardinal Source and Top Generics from import and zero fill two columns
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtectionCASourceContractLoad_Prod] 
	-- Add the parameters for the stored procedure here
	@in_date varchar(10) 
AS
 

BEGIN
INSERT INTO PharmacyMaster..CASourceContractMO (
Date,
ChangeType,
Description,
Form,
UM,
Supplier,
NDC,
CIN,
DP,
OldPrice,
NewPrice,
WAC,
F12,
BrandName,
ReasonCode,
EffectDte,
UOM,
[20Percent]
)  

SELECT 
Date,
ChangeType,
Description,
Form,
UM,
Supplier,
NDC,
CIN,
DP,
OldPrice,
NewPrice,
WAC,
F12,
BrandName,
ReasonCode,
EffectDte,
UOM,
[20Percent]

 from import_CASourceContractMO where date = @in_date

 
--Update NDC - NDC is 11 digits zero filled - the file I receive isn't
UPDATE PharmacyMaster..CASourceContractMO set  ndc = replicate('0', 11-len(ndc) )+ ndc

-- To copy from Joshilas file - change dates of course
--INSERT INTO import_CASourceContractMO (
--Date,
--ChangeType,
--Description,
--Form,
--UM,
--Supplier,
--NDC,
--CIN,
--DP,
--OldPrice,
--NewPrice,
--WAC,
--F12,
--BrandName,
--ReasonCode,
--EffectDte,
--UOM,
--[20Percent]
--)  
--
--SELECT 
--'06/01/2015',
--[Change Type],
--[General Description],
--Form,
--UM,
--Supplier,
--NDC,
--CIN,
--DP,
--[Old Price],
--[New Price],
--WAC,
--F12,
--[Brand Name],
--[Reason Code],
--[Effect Dte],
--UOM,
--[20Percent] from purchases..cahcontract where month([effect dte]) = 06 and year([effect dte]) = 2015

-- To compare Joshila's table to mine - change dates of course

--select * from purchases..cahcontract w
--left join
--(
-- 
--select * from dbo.CASourceContractMO where date = '07/01/2015'
--) m on w.ndc = m.ndc and w.[Effect Dte] = m.effectdte and
--w.[Change Type] = m.changetype
-- where month([Effect Dte]) = 07
--and year([Effect Dte]) = 2015
--and m.effectdte is null order by [Effect Dte]


-- To copy one ndc from Joshilas tables:

--INSERT INTO pharmacymaster..CASourceContractMO (
--Date,
--ChangeType,
--Description,
--Form,
--UM,
--Supplier,
--NDC,
--CIN,
--DP,
--OldPrice,
--NewPrice,
--WAC,
--F12,
--BrandName,
--ReasonCode,
--EffectDte,
--UOM,
--[20Percent]
--)  
--
--SELECT 
--'05/1/2016',
--[Change Type],
--[General Description],
--Form,
--UM,
--Supplier,
--NDC,
--CIN,
--DP,
--[Old Price],
--[New Price],
--WAC,
--F12,
--[Brand Name],
--[Reason Code],
--[Effect Dte],
--UOM,
--[20Percent] from purchases..cahcontract where month([effect dte]) = 05 and year([effect dte]) = 2016
--and ndc = '00409653301' and [Change Type] = 'Price Increase'


END

GO
