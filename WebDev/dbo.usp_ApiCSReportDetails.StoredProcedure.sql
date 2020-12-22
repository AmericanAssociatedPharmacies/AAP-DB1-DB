USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_ApiCSReportDetails]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Chris McKinnie
-- Create date: 11/22/2017
-- =============================================
CREATE PROCEDURE [dbo].[usp_ApiCSReportDetails]
	@apiaccountno varchar(50),
	@datefrom datetime,
	@datethrough datetime
AS 
BEGIN

SET NOCOUNT ON;

 


 


    DECLARE @PMID INT

 

    SELECT @PMID = dt.PMID
    FROM(SELECT PMID
            FROM RXMaster.[dbo].[vwAPIAccount]
            WHERE [APIAccountNo] = @apiaccountno

 

            UNION

 

            SELECT PMID
            FROM RXMaster.[dbo].[vwAPIAccount]
            WHERE [APIAccountNumHistorical] = @apiaccountno
            ) AS dt

 

    SELECT CONVERT(VARCHAR(8), InvDate, 1) as [InvoiceDate]
    , Type
    , InvNbr as [InvoiceNumber]
    , s.NDC
    , APIItemNbr as [ItemNumber]
    , replace(replace(ItemDescription,'!',''),'*','') as [DescriptionSize]
    , TRY_CONVERT(varchar(4),d.Form) as FM --LM 10/13/2020
	, TRY_CONVERT(varchar(10), d.PS) as PK --LM 10/13/2020
	, TRY_CONVERT(varchar(5), d.DEA_Class_Code) as Cls --LM 10/13/2020
	--, '' as FM --LM 10/12/2020
    --, '' as PK --LM 10/12/2020
    --, '' Cls   --LM 10/12/2020
    , Qty as [QuantityShipped]
    from api.dbo.apisalesdetail s
    left join Medispan..DrugMaster d on s.NDC = d.NDC --LM 10/12/2020
    --INNER JOIN RXMaster.dbo.vwAPIAccount AS a ON s.WHAccountID = a.APIAccountNo
    --                                AND s.InvDate BETWEEN a.APIEffectiveDate AND a.APIQuitDate
    --where (ItemDescription like '%!%' or ItemDescription like '%*%') -- Removed due to S2K. This is the correct logic now: WHERE s.ItemGrp = 'G03'
    WHERE s.ItemGrp IN ('B02', 'G02', 'G03', 'G04')
    and invdate >= @datefrom
    and invdate <= @datethrough
    AND PMID = @PMID
    
    --WHERE s.ItemGrp IN 'G03'
    --and invdate >= @datefrom
    --and invdate <= @datethrough
    --and WHAccountID = @apiaccountno
    order by InvDate,InvNbr

 


END
 

 
GO
