USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_TermedReasonCount]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_TermedReasonCount]


AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SQL varchar(max);
	DECLARE @Month varchar(2);
	DECLARE @Year varchar(4);
	DECLARE @StartMonth int;
	DECLARE @DateStr varchar(10);
	DECLARE @DateStr2 varchar(10);
	DECLARE @Date datetime;
	
	SET  @StartMonth = 1;
	SET @SQL = 'SELECT * from ( ';
	SET @Month = cast((SELECT month(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(2));
	SET @Year = cast((SELECT year(max(aapquitdate)) from pharmacymaster..pm_pharmacy) as varchar(4));

    SET @DateStr =  '01/01/' + @Year;
	SET @Date =  '01/01/' + @Year;



	SELECT   distinct whyresigned as [Resignation Reason], count(*)  as Count from pharmacymaster..pm_pharmacy where month(aapquitdate) = @Month
	and year(aapquitdate) = @Year group by whyresigned


	 
END








GO
