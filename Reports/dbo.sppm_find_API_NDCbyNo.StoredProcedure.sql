USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_API_NDCbyNo]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/10/2010>
-- Description:	Create table for compare to get listing of RxAlly
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_API_NDCbyNo]
(@whaccountid varchar(8),@ndc varchar(13))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

DECLARE @date datetime;
DECLARE @prevYear int;


SET @date =  GetDate();
SET @prevYear = year(@date) - 1;



SELECT top 10 * from api..apisalesdetail where whaccountid = @whaccountid
and (ndc = @ndc or ndc_orig = @ndc) and year(invdate) >= @prevYear order by invdate desc

END








GO
