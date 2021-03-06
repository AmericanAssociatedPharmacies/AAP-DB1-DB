USE [RJSReportDelivery]
GO
/****** Object:  UserDefinedFunction [dbo].[DelimitedSplit8K]    Script Date: 12/22/2020 5:11:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DelimitedSplit8K]
/***************************************************************************************************
 Purpose:
 Split a given string at a given delimiter and return a list of the split elements (items).

 Returns:
 iTVF containing the following:
 ItemNumber = Element position of Item as a BIGINT (not converted to INT to eliminate a CAST)
 Item       = Element value as a VARCHAR(8000)

 CROSS APPLY Usage Example:
---------------------------------------------------------------------------------------------------
--===== Conditionally drop the test tables to make reruns easier for testing.
     -- (this is NOT a part of the solution)
     IF OBJECT_ID('tempdb..#JBMTest') IS NOT NULL 
        DROP TABLE #JBMTest
;
--===== Create and populate a test table on the fly (this is NOT a part of the solution).
 SELECT *
   INTO #JBMTest
   FROM (
         SELECT 1,'1,10,100,1000,10000,100000,1000000' UNION ALL
         SELECT 2,'2000000,200000,20000,2000,200,20,2' UNION ALL
         SELECT 3, 'This,is,a,test'                    UNION ALL
         SELECT 4, 'and so is this'                    UNION ALL
         SELECT 5, 'This, too (no pun intended)'
        ) d (SomeID,SomeValue)
;
GO
--===== Split the CSV column for the whole table using CROSS APPLY (this is the solution)
 SELECT test.SomeID, split.ItemNumber, split.Item
   FROM #JBMTest test
  CROSS APPLY
        (
         SELECT ItemNumber, Item
           FROM dbo.DelimitedSplit8k(test.SomeValue,',')
        ) split
;
---------------------------------------------------------------------------------------------------
 Notes:
 1. Optimized for VARCHAR(7999) or less.  No testing or error reporting for truncation at 7999
    characters is done.
 2. Optimized for single character delimiter.  Multi-character delimiters should be resolved
    externally from this function.
 3. Optimized for use with CROSS APPLY.
 4. Does not "trim" elements just in case leading or trailing blanks are intended.
 5. If you don't know how a Tally table can be used to replace loops, please see the following...
    http://www.sqlservercentral.com/articles/T-SQL/62867/
 6. Changing this function to use VARCHAR(MAX) will cause it to run twice as slow.  It's just the 
    nature of VARCHAR(MAX) whether it fits in-row or not.
 7. Multi-machine testing for the method of using UNPIVOT instead of 10 SELECT/UNION ALLs shows
    that the UNPIVOT method is quite machine dependent and can slow things down quite a bit.
 8. Performance testing shows using "TOP" for the limiting criteria of "N" is actually 
    slower and slightly more CPU intensive than the traditional WHERE N < LEN(@pString) + 2. 
 9. Performance testing shows using ORDER BY (SELECT x) where "x" is anything is actually
    slower and slightly more CPU intensive than the traditional ORDER BY (SELECT N).

 Credits:
 This code is the product of many people's efforts including but not limited to the following:
 cteTally concept originally by Iztek Ben Gan and "decimalized" by Lynn Pettis (and others) for a
 bit of extra speed and finally redacted by Jeff Moden for a different slant on readability and 
 compactness. Hat's off to Paul White for his simple explanations of CROSS APPLY. Finally,
 special thanks to Erland Sommarskog for his tireless efforts to help people understand
 what you can actually do with T-SQL. I also thank whoever wrote the first article I ever saw
 on "numbers tables" which is located at the following URL ...
 http://sqlserver2000.databases.aspfaq.com/why-should-i-consider-using-an-auxiliary-numbers-table.html

 Revision History:
 Rev 00 - 20 Jan 2010 - Concept: Lynn Pettis and others.
                        Redaction/Implementation: Jeff Moden 
        - Base 10 redaction and reduction for CTE.  (Total rewrite)

 Rev 01 - 13 Mar 2010 - Jeff Moden
        - Removed one additional concatenation and one subtraction from the SUBSTRING in the 
          SELECT List for that tiny bit of extra speed.

 Rev 02 - 14 Apr 2010 - Jeff Moden
        - No code changes.  Added CROSS APPLY usage example to the header, some additional credits,
          and extra documentation.

 Rev 03 - 18 Apr 2010 - Jeff Moden
        - No code changes.  Added notes 7, 8, and 9 about certain "optimizations" that dont' 
          actually work for this type of function.

 Rev 04 - 29 Jun 2010 - Jeff Moden
        - Added WITH SCHEMABINDING thanks to a note by Paul White.  This prevents an unnecessary
          "Table Spool" when the function is used in an UPDATE statement even though the function
          makes no external references.
***************************************************************************************************/
--===== Define I/O parameters
        (
        @pString    VARCHAR(7999),
        @pDelimiter CHAR(1)
        )
RETURNS TABLE
   WITH SCHEMABINDING
AS
RETURN
--===== "Inline" CTE Driven "Tally Table” produces values up to
     -- 10,000... enough to cover VARCHAR(8000)
WITH
      E1(N) AS ( --=== Create Ten 1's
                 SELECT 1 UNION ALL SELECT 1 UNION ALL
                 SELECT 1 UNION ALL SELECT 1 UNION ALL
                 SELECT 1 UNION ALL SELECT 1 UNION ALL
                 SELECT 1 UNION ALL SELECT 1 UNION ALL
                 SELECT 1 UNION ALL SELECT 1 --10
               ),
      E2(N) AS (SELECT 1 FROM E1 a, E1 b),   --100
      E4(N) AS (SELECT 1 FROM E2 a, E2 b),   --10,000
cteTally(N) AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT N)) FROM E4)  
--===== Do the split
 SELECT ROW_NUMBER() OVER (ORDER BY N) AS ItemNumber,
        SUBSTRING(@pString, N, CHARINDEX(@pDelimiter, @pString + @pDelimiter, N) - N) AS Item
   FROM cteTally
  WHERE N < LEN(@pString) + 2
    AND SUBSTRING(@pDelimiter + @pString, N, 1) = @pDelimiter
;
GO
