USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCPTA1]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BGrant
-- Create date: 1/13/11
-- Description:	for report CPTA
-- enter 12/1/2010 to compare 12/2010 payments to 9,10,11/2010
-- mode 0 the 3 mo previous average
-- mode 1 the percent change
-- mode 2 the 12 mo average
-- =============================================
CREATE FUNCTION [dbo].[fnCPTA1]
(
	@dtStart datetime,
	@payee_id int,
	@imode int
)
RETURNS float
AS
BEGIN
	DECLARE @fRet float, @fAvg float
	declare @iMonths int
	declare @iAmtMo1 money,@iAmtMo2 money, @iAmtMo3 money,@iAmtMo4 money, @iTotal money
	select @iAmtMo1 = isnull(sum(isnull(amt,0)),0) from tmp_delete_cpta
		where dt >= dateadd(month,-3,@dtStart) and dt < dateadd(month,-2,@dtStart)
		and payee_id=@payee_id
	select @iAmtMo2 = isnull(sum(isnull(amt,0)),0) from tmp_delete_cpta
		where dt >= dateadd(month,-2,@dtStart) and dt < dateadd(month,-1,@dtStart)
		and payee_id=@payee_id
	select @iAmtMo3 =isnull(sum(isnull(amt,0)),0)from tmp_delete_cpta
		where dt >= dateadd(month,-1,@dtStart) and dt < @dtStart
		and payee_id=@payee_id
	select @iAmtMo4 =isnull(sum(isnull(amt,0)),0)from tmp_delete_cpta
		where dt >= @dtStart and dt < dateadd(month,1,@dtStart)
		and payee_id=@payee_id
	select @iTotal = @iAmtMo1 + @iAmtMo2 + @iAmtMo3
	select @iMonths = case when @iAmtMo1 = 0 then
		case when @iAmtMo2 = 0 then 1 else 2 end
		else 3 end
	select @fAvg = @iTotal/@iMonths
	select @fRet = case when @imode = 0 then @fAvg
		else case when @imode = 1 then 
			case when @fAvg = 0 then 0.0 else (@iAmtMo4 - @fAvg)/@fAvg end
			else case when @imode=2 then @iAmtMo3 end 
			end
		end
	RETURN @fRet

END
GO
