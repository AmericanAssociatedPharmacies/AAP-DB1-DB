USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sp_addRebateDate ]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Chandni Lyla
-- Create date:11/16/2016
-- Description:	Add Rebate Payment Date through intranet page
-- =============================================
CREATE PROCEDURE [dbo].[sp_addRebateDate ]
	@RebateMonth VARCHAR(20), 
	@RebateType VARCHAR(10),
	@PaymentDate VARCHAR(20)
	
 AS 
BEGIN 

if @RebateMonth='' 
 set  @RebateMonth=null 

if @PaymentDate='' 
 set  @PaymentDate=null 

insert into PM_Rebates_PaymentDates values(Convert(datetime,@RebateMonth),@RebateType,Convert(datetime,@PaymentDate))

END




GO
