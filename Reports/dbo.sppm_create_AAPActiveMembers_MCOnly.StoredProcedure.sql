USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_AAPActiveMembers_MCOnly]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's for a certain month/year with no Match in PM_Pharmacy - XX's are excluded
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_AAPActiveMembers_MCOnly]
(@in_month varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @lastDate   varchar(10);
    DECLARE @lastDay   varchar(10);
	SET @lastDay = dbo.DaysInMonth(@in_month,@in_year);
	SET @lastDate = @in_month + '/' + @lastDay +'/' + @in_year;
  
	SELECT
		p.PMID,p.Territory as TM,
		p.DEA,
		p.aapaccountno as [AAP#],
		p.aapparentno as [AAP Parent#] ,
		p.APIAccountNo as [API#],
		p.accountname as [Account DBA Name],
		p.State as St,
		CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) as [AAP Eff Date] ,
		p.AccountDescription as [Acct Descrip]  ,
		case when w.vendor is null or w.vendor = 'CH' then 'Cardinal Health' when w.vendor = 'ML' then 'Miami-Luken' else w.vendor end as Wholesaler,
		case  when chaincode is null or mcquitdate is not null then null  when chaincode is not null and mcquitdate is null then chaincode END AS ChainCode ,
        mcquitdate as [MC Quit Date],
		case  when chaincode is null or mcquitdate is not null then 'N'  when chaincode is not null and mcquitdate is null then 'Y' END AS 'Is MC',
		case isnull(ispva,0) when 0 then 'N' ELSE 'Y' END AS 'Is PVA' ,
		case isnull(iswarehouse,0) when 0 then 'N' ELSE 'Y' END AS 'Is Whse' 


	FROM pharmacymaster..v_PM_AllWithAffiliates p
	left join pharmacymaster..v_wholesaler_primary w on p.pmid=w.pmid

	WHERE (aapeffectivedate is not null and aapeffectivedate < = @lastDate )and (aapquitdate is null or aapquitdate > @lastDate)
	and (AAPAccountno is not null and AAPAccountno != '') and chaincode is not null and mcquitdate is null

END










GO
