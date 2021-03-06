USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_group_BASHAS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	Group Bashas by store # and remove any null PMID values from CH_Bashas table (PMID has been updated by the time this is run)
-- =============================================
CREATE PROCEDURE [dbo].[sppm_group_BASHAS] 
 (@in_date varchar(10))
AS
	BEGIN
    IF EXISTS(SELECT name FROM  purchases.sys.tables
        WHERE name = 'PM_CH_Bashas_BKP')
          DROP TABLE Purchases..PM_CH_Bashas_BKP
 

	SELECT * into Purchases..PM_CH_Bashas_BKP from Purchases..PM_CH_Bashas

	DELETE from Purchases..CH_Bashas where PMID is null;

  	INSERT into Purchases..PM_CH_Bashas (PMID,Date,UDAcctNo,ExtSales,AdminFee)

	SELECT pmid ,date,storeno , sum(extsales),sum(adminfee) from Purchases..CH_Bashas c
	WHERE date = @in_date
	GROUP by storeno,date,pmid 

END

GO
