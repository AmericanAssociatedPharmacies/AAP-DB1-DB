USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_prepare_API_MO_WHSales]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <03/29/2010>
-- Description:	Backup and API_MO_WHSales_bkp
-- =============================================
CREATE PROCEDURE [dbo].[spapi_prepare_API_MO_WHSales]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'API_MO_WHSales_bkp')
          DROP TABLE API_MO_WHSales_bkp
 

SELECT  * into API_MO_WHSales_bkp from API_MO_WHSales
END








GO
