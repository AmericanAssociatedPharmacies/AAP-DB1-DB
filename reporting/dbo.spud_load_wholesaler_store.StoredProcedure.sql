USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_load_wholesaler_store]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 07/10/09
-- Description:	Copy United.wholesaler_store to data warehoue
-- =============================================
CREATE PROCEDURE [dbo].[spud_load_wholesaler_store]
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    	IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_wholesaler_store') DROP TABLE ud_wholesaler_store
    select DISTINCT r.*
             into ud_wholesaler_store
            from openquery(UNITEDDB,'select * from united.wholesaler_store') r
END
GO
