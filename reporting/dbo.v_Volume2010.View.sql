USE [reporting]
GO
/****** Object:  View [dbo].[v_Volume2010]    Script Date: 12/22/2020 9:27:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_Volume2010]
as
SELECT     FY_END, ACCT_NO, VENDOR_ID, VENDOR, FACTOR, REPORTS, JANUARY, FEBRUARY, MARCH, APRIL, MAY, JUNE, JULY, AUGUST, SEPTEMBER, 
                      OCTOBER, NOVEMBER, DECEMBER, V_PER, MONTOT
FROM         OPENQUERY(UNITEDDB, 'select * from united.volume WHERE Reports = ''V'' And (FY_END = ''2010'')') 
                      AS Rowset_1
GO
