USE [reporting]
GO
/****** Object:  View [dbo].[v_COG_0909]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_COG_0909]
AS
select store as Store,[City] as City,[State] as ST,acct_no as [UD #],nsterritory as TM,GroupId as [Mem#],[Group DESIGNATION] as [GROUP DESI],
Q3_Total_Sales_Group as [Q3 Total Group],AVG_MO_total_sales_group as [Avg Mo Total Group],[COG Buy Plan %] as [COG %],[COG% 12/1],[AVG_MO_TOTAL] as [AVG MO TOTAL],
AVG_MO_BRAND as [AVG MO BRAND],Q309Base as [Q309 Base],BrandAtWac [Brand @ WAC],Q309Savings as [Q309 Savings],ProposedCOG as [Proposed COG],COGDelta as [COG Delta],
Q309NewBase as [Q309 New Base],ProposedMnthlyBrands as [Proposed Mnthly Brands],ProposedBrandSavings as [Proposed Brand Savings],
ProposedSavingsLoss as [Proposed Savings/Loss],AVG_MO_OTC as [AVG MO OTC],OTCdivTotalPurchases as [OTC %],OTCAtWAC as [OTC @ WAC],OTCLoss as [OTC Loss],
AVG_MO_SOURCE as [AVG MO SOURCE],CurrAvgMoRebate as [Curr Avg Mo Rebate],ProposedAvgMoRebate as [Proposed Avg Mo Rebate],ProposedGenericSavingLoss as 
[Proposed Generic Saving/Loss],Curr_UpfrontDiscount as [Curr Upfront Disc],New_UpfrontDiscount as [New Upfront Disc],
[Est Pay Term Disc], [Pay Term Savings],
TotalSavingLoss as [Total Saving/Loss],
BasisPointsValueOfSavings as [BP Value Of Savings],[AR2000 Terms Code] as [Payment Terms],[Statement Frequency] as [Statement Freq],[GCR%]
from tmp_COG_Compare0909_rpt
                      
GO
