USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_QAForPurchases]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <01/08/2015>
-- Description:	Price Protection reports 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_QAForPurchases]
	(@in_month varchar(2),@in_year varchar(4))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @lastDay int;
	DECLARE @firstDay int;
    DECLARE @count int;
	DECLARE @countPurchases varchar(12);
	DECLARE @date varchar(15);
	DECLARE @invDate varchar(15);
    DECLARE @dayOfWeek varchar(50);
	SET @firstDay = 1;
	SET @count = 1;
	SET @lastDay = dbo.DaysInMonth ( @in_month , @in_year) ;
  

	TRUNCATE TABLE tmp_CAPurchaseQA;
	WHILE @count <= @lastDay
		BEGIN
   
			SET @date =  @in_month + '/' + cast(@count as varchar(2))+ '/' + @in_year;
    		SET @countPurchases = ( SELECT  top 1 inv_date from Purchases..CHPH_AAP where inv_date =  @date   );

            SET  @dayOfWeek = (select datename(dw,@date))
            INSERT into tmp_CAPurchaseQA (InvoiceDate,Date,DayOfWeek) values (isnull(@countPurchases,'No Invoices') , @date,@dayOfWeek )
			SET @count = @count + 1;
		END

 --         SELECT DATE ,DayOfWeek from tmp_CAPurchaseQA where InvoiceDate = 'NoInvoices'

	DECLARE @rowCount int;
	DECLARE @prevDay varchar(50);
    DECLARE @dateIn    varchar(50);
    DECLARE @dow  varchar(50);
    DECLARE @day  varchar(50);
	DECLARE @prevInvoices  varchar(500);
    DECLARE @invoices  varchar(500);
    DECLARE @I INT
    SET @prevDay = '';
	SET @prevInvoices = '';
	SET @invoices  = '';
 	SET @rowCount = (SELECT COUNT(*) FROM tmp_CAPurchaseQA) 
	SET @I = 1

	WHILE (@I <= @rowCount)
		 BEGIN
 
		 SELECT @dow = dayOfWeek  FROM tmp_CAPurchaseQA WHERE ID = @I
		 SELECT @dateIn = DATE  FROM tmp_CAPurchaseQA WHERE ID = @I
         SELECT @invoices =  InvoiceDate FROM tmp_CAPurchaseQA WHERE ID = @I
         IF(@I != 1 and @dow = 'Sunday')
			BEGIN
				--SELECT @day = datename(dw,dateADD(D,-1,@dateIn))
				IF(@prevDay = 'Saturday' and @prevInvoices = 'No Invoices')
					BEGIN
						UPDATE tmp_CAPurchaseQA SET Problem = 'Yes' WHERE ID = @I
					END
			   ELSE
					BEGIN
                       IF(@prevDay = 'Saturday' and @prevInvoices != 'No Invoices')
		                BEGIN
						UPDATE tmp_CAPurchaseQA SET Problem = 'Probably Not' WHERE ID = @I
                        END
                      IF (@dow = 'Sunday' and @invoices != 'No Invoices')
                          BEGIN
							UPDATE tmp_CAPurchaseQA SET Problem = 'No' WHERE ID = @I
                          END
					END
			END
        ELSE
		 BEGIN
		IF(@I = 1 and @dow = 'Sunday')
			BEGIN

				UPDATE tmp_CAPurchaseQA SET Problem = 'Check last day of Previous Month - if there were no invoices probably a problem';

			END
		 ELSE
			BEGIN
				IF(@invoices = 'No Invoices' and @dow != 'Sunday')
					BEGIN
						UPDATE tmp_CAPurchaseQA SET Problem = 'Yes' WHERE ID = @I

					END
		        ELSE
					BEGIN
						UPDATE tmp_CAPurchaseQA SET Problem = 'No' WHERE ID = @I
					END
			END
         END

		IF(cast(@dateIn as datetime) >= convert(varchar(10), getdate(), 120))
			BEGIN
				UPDATE tmp_CAPurchaseQA SET Problem = 'Load has not occurred yet.' WHERE ID = @I
			END

       --Have to account for the fact that Saturday and Sunday are not loaded until Monday night

		IF(@dow = 'Monday' and cast(@dateIn as datetime) = convert(varchar(10), getdate(), 120))
			BEGIN
				UPDATE tmp_CAPurchaseQA SET Problem = 'Load has not occurred yet.' WHERE ID = @I -1; --Sundays date
   				UPDATE tmp_CAPurchaseQA SET Problem = 'Load has not occurred yet.' WHERE ID = @I -2; --Mondays date

			END
		 SET @prevDay = @dow;
         SELECT @prevInvoices = @invoices;
   
		 SET @I = @I + 1
	 END

              SELECT DATE ,DayOfWeek,InvoiceDate,Problem from tmp_CAPurchaseQA --where InvoiceDate = 'NoInvoices'
             
END










GO
