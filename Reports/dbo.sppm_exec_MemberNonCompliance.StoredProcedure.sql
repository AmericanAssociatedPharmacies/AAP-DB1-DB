USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_MemberNonCompliance]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Non Compliance and return table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_MemberNonCompliance]
(@in_month varchar(10), @in_year varchar(4) ,@insert varchar(4),@type varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
	--EXEC dbo.sppm_create_ReportCardVolume_DYN @ch_endDate,@wh_endDate 
	
    if(@type = 'All')
		BEGIN 
            EXEC dbo.sppm_create_MemberNonCompliance_DYN @in_month,@in_year, @insert
			SET @SQL = 'select * from tmp_memNonCompAll order by pmid';
			EXEC (@SQL);
		END
    ELSE
		BEGIN
			SET @SQL = 'select * from tmp_memNonComp order by pmid';
			EXEC (@SQL);

		END

END










GO
