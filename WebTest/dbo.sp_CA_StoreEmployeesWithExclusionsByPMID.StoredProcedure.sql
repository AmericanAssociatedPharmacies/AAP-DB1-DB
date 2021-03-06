USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_CA_StoreEmployeesWithExclusionsByPMID]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rajesh Kalaskar
-- Create date: 2013.11.07
-- Description:	Get Employees who are active with latest exclusions
-- =============================================
CREATE PROCEDURE [dbo].[sp_CA_StoreEmployeesWithExclusionsByPMID]
	-- Add the parameters for the stored procedure here
	@pmid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Get Employees who are active with latest exclusions
	SELECT e.ID, 
       e.NCPDP, 
       e.PMID, 
       e.FirstName, 
       e.MiddleName, 
       e.LastName, 
       e.Email, 
       e.IsActive, 
       CASE WHEN c.IsOIGListed IS NULL THEN 0 ELSE c.IsOIGListed END AS IsOIGListed, 
	   CASE WHEN c.IsSAMListed IS NULL THEN 0 ELSE c.IsSAMListed END AS IsSAMListed,
       e.ModifiedDate AS EmployeeLastModifiedDate, 
       e.CreatedDate  AS EmployeeLastCreatedDate, 
       c.ExclusionLastFoundDate 
FROM   DBO.CA_StoreEmployee AS e 
       LEFT OUTER JOIN (SELECT EmployeeId, 
                               Max(IsOIGListed) AS IsOIGListed, 
                               Max(IsSAMListed) AS IsSAMListed, 
                               Max(CreatedDate)       AS ExclusionLastFoundDate 
                        FROM   (SELECT EmployeeId, 
                                       IsOIGListed, 
                                       CASE WHEN IsSAMListed IS NULL THEN 0 ELSE IsSAMListed END AS IsSAMListed, 
                                       CASE WHEN IsOIGListed = 1 OR IsSAMListed = 1 THEN CreatedDate ELSE NULL END AS CreatedDate, 
                                       Row_number() OVER ( PARTITION BY EmployeeId ORDER BY CreatedDate DESC) AS rn 
                                FROM   [WebDev].DBO.CA_CheckResultsHistory) AS c 
                        WHERE  rn = 1
                        GROUP  BY EmployeeId) AS c 
                    ON c.EmployeeId = e.ID 
WHERE  e.IsActive = 1 AND e.PMID=@pmid ORDER BY e.FirstName
END
GO
