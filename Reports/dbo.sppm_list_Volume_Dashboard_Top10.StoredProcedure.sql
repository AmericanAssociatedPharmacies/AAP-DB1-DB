USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_Volume_Dashboard_Top10]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_Volume_Dashboard_Top10]
(@in_type varchar(50))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


--TODO change the date   
DECLARE @date datetime; 
SET @date = (select max(date) from DashboardTop10 where type = @in_type);

SELECT Sales,DrugName ,cast(SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) as varchar(3)) + ' ' + cast(year(date) as varchar(4)) as Date
from DashboardTop10 where type = @in_type and date = @date;

 
END








GO
