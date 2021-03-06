USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_GroupedPurchases]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/13/2016>
-- Description:	Cardinal and API purchases grouped up as much as their going to group
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_GroupedPurchases]


AS
BEGIN
 

  
select  Description,Sum(Quantity) as Quantity from
(
	--Get Cardinal purchases
	select     Generic_Name as Description, sum(ship_qty) as Quantity from purchases..chph_aap where pmid = 105503 and
	((month(inv_date) in(01,02) and year(inv_date) = 2016 ) or ( month(inv_date) in(09,10,11, 12) and year(inv_date) = 2015)) 
	group by Generic_Name
	UNION ALL

	------------- Below gets the ndcs that are found in chph_aap (to get generic name) for the API Purchases
	select  generic_name as Description,sum(QTY) as Quantity from api..apisalesdetail a
	left join
	(
	 select     distinct ndc,Generic_Name from CardinalGenericNames
	group by ndc,Generic_Name
	) ch on a.ndc= ch.ndc
	where whaccountID = '10061414' and
	((month(invdate) in(01,02) and year(invdate) = 2016 ) or ( month(invdate) in(09,10,11, 12) and year(invdate) = 2015)) and a.NDC != ''
	and ch.ndc is not null
	group by customername,generic_name
	UNION ALL
	--------Below gets the ndcs that are not found in chph_aap  - use item description
	select  itemdescription as Description,sum(QTY) as Quantity from api..apisalesdetail a
	left join
	(
	 select     distinct ndc,Generic_Name from CardinalGenericNames
	group by ndc,Generic_Name
	) ch on a.ndc= ch.ndc
	where whaccountID = '10061414' and
	((month(invdate) in(01,02) and year(invdate) = 2016 ) or ( month(invdate) in(09,10,11, 12) and year(invdate) = 2015)) and a.NDC != ''
	and ch.ndc is null
	group by customername,itemdescription
) ch group by Description


--This is what I used to populate CardinalGenericNames Original

--drop table CardinalGenericNames 
--select * into CardinalGenericNames from 
--(select     distinct ndc,Generic_Name from purchases..chph_aap where year(inv_date) = 2016  and  month(inv_date) in(01,02))ch

--Now to insert after initial load using more months
-- INSERT  into CardinalGenericNames ( NDC,Generic_Name )   
--
--select ndc,Generic_Name from
--   (
--      select     distinct ndc,Generic_Name from purchases..chph_aap ch where year(inv_date) = 2016  and  month(inv_date) in(03,04) 
--   ) ch
--	 WHERE not exists  (select ndc from CardinalGenericNames where ndc = ch.ndc and  Generic_Name = ch.Generic_Name)


--OLD ONE
--select  Description,Sum(Quantity) as Quantity from
--(
--select     Generic_Name as Description, sum(ship_qty) as Quantity from purchases..chph_aap where pmid = 105503 and
--((month(inv_date) in(01,02) and year(inv_date) = 2016 ) or ( month(inv_date) in(10,11, 12) and year(inv_date) = 2015)) 
--group by Customer_Name,Generic_Name
--union
--select  itemdescription as Description ,sum(QTY) as Quantity from api..apisalesdetail where whaccountID = '10061414' and
--((month(invdate) in(01,02) and year(invdate) = 2016 ) or ( month(invdate) in(09,10,11, 12) and year(invdate) = 2015)) and NDC != ''
--group by customername,itemdescription
--) ch group by Description
--order by description

--Using GPI - didn't work as well because I needed the NDC to get to the Medispan for GPI.  When I did that I lost
--all the grouping I got using Cardinal generic name

--select  dm.GPIDesc,Sum(Quantity) as Quantity from
--(
--select   NDC, Generic_Name as Description, sum(ship_qty) as Quantity from purchases..chph_aap where pmid = 105503 and
--((month(inv_date) in(01,02) and year(inv_date) = 2016 ) or ( month(inv_date) in(10,11, 12) and year(inv_date) = 2015)) 
--group by Customer_Name,NDC,Generic_Name
--union
--select  NDC,itemdescription as Description ,sum(QTY) as Quantity from api..apisalesdetail where whaccountID = '10061414' and
--((month(invdate)in(01,02) and year(invdate) = 2016 ) or ( month(invdate) in(10,11, 12) and year(invdate) = 2015)) and NDC != ''
--group by customername,NDC,itemdescription
--) ch 
--left outer join 
--(
--
--select   ndc,GPI,GPIDesc from Medispan..DrugMaster group by GPI,ndc,GPIDesc
--) dm
--on ch.ndc = dm.ndc
--group by dm.GPIDesc
--order by GPIDesc

--Single Month/Year

--select NDC,Description,Sum(Quantity) as Quantity from
--(
--select   NDC, Generic_Name as Description, sum(ship_qty) as Quantity from purchases..chph_aap where pmid = 105503 and
--((month(inv_date) = 01 and year(inv_date) = 2016 ) or ( month(inv_date) = 12 and year(inv_date) = 2015)) 
--group by Customer_Name,NDC,Generic_Name
--union
--select  NDC,itemdescription as Description ,sum(QTY) as Quantity from api..apisalesdetail where whaccountID = '10061414' and
--((month(invdate) = 01 and year(invdate) = 2016 ) or ( month(invdate) = 12 and year(invdate) = 2015)) and NDC != ''
--group by customername,NDC,itemdescription
--) ch group by NDC,Description
--order by description


END










GO
