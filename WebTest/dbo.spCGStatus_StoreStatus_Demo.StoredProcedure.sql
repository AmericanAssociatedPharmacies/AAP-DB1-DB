USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spCGStatus_StoreStatus_Demo]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spCGStatus_StoreStatus_Demo]
AS
BEGIN
SELECT
	0 AS PMID, 
        '1234567' AS NCPDP, 
        CASE WHEN count(*) > 0 THEN 1 ELSE NULL END AS EmployeeCheckListStatus, 
        count(*) Employees, 
        Max(e.CreatedDate) AS EmployeeLastCreatedDate, 
        Max(e.ModifiedDate) AS EmployeeLastModifiedDate, 
        Max(p.HIPAAManualStatus) AS HIPAAManualStatus,
        Max(p.FWAManualStatus) AS FWAManualStatus,
        MAX(ehf.HIPAATrainingStatus) AS HIPAATrainingStatus,
        MAX(ehf.FWATrainingStatus) AS FWATrainingStatus,
        MAX(ehf.EmployeesWithOutAliasNames) AS EmployeesWithOutAliasNames,
        MAX(ehf.HIPAATrainedEmployees) AS HIPAATrainedEmployees,
        MAX(ehf.FWATrainedEmployees) AS FWATrainedEmployees,
        SUM(c.IsExclusionListed) AS Exclusions,
        MAX(c.ExclusionLastFoundDate) AS ExclusionLastFoundDate
    FROM 
        [WebDev].[dbo].[CA_StoreEmployee] as e 
        LEFT OUTER JOIN 
            (SELECT 
                    NCPDP, 
                    [1] as 'HIPAAManualStatus', 
                    [2] as 'FWAManualStatus' 
                FROM (SELECT 
                            NCPDP, 
                            CA_TaskID, 
                            Status 
                        FROM 
                            dbo.CA_StoreStatus) AS SourceTable 
                        PIVOT 
                            (Max(Status) FOR CA_TaskId IN ([1], [2])) AS p WHERE NCPDP = '1234567') as p 
            on p.NCPDP = e.NCPDP 
        LEFT OUTER JOIN 
            (SELECT
                    e1.NCPDP,
                    CASE WHEN e1.Employees = h.HIPAATrainedEmployees THEN 1 ELSE 0 END AS HIPAATrainingStatus,
                    CASE WHEN e1.Employees = f.FWATrainedEmployees THEN 1 ELSE 0 END AS FWATrainingStatus,
                    e1.Employees AS EmployeesWithOutAliasNames,
                    h.HIPAATrainedEmployees,
                    f.FWATrainedEmployees
                FROM 
                    (SELECT NCPDP, Count(*) as Employees 
                        FROM 
                            [WebDev].[dbo].[CA_StoreEmployee] WHERE IsActive = 1 AND EmployeeNameType = 1 GROUP BY NCPDP) as e1
                            LEFT OUTER JOIN (SELECT NCPDP, Count(*) HIPAATrainedEmployees FROM [WebDev].[dbo].[CA_StoreEmployee] WHERE IsActive = 1 AND EmployeeNameType = 1 And IsHippaTrained = 1 GROUP BY NCPDP) h
                                ON e1.NCPDP = h.NCPDP
                            LEFT OUTER JOIN (SELECT NCPDP, Count(*) FWATrainedEmployees FROM [WebDev].[dbo].[CA_StoreEmployee] WHERE IsActive = 1 AND EmployeeNameType = 1 And IsFWATrained = 1 GROUP BY NCPDP) AS f
                                ON e1.NCPDP = f.NCPDP
                    ) AS ehf 
            ON ehf.NCPDP = e.NCPDP
        LEFT OUTER JOIN
            (SELECT 
                    EmployeeId, 
                    MAX(IsExclusionListed) AS IsExclusionListed,
                    MAX(CreatedDate) AS ExclusionLastFoundDate 
                FROM 
                    (SELECT 
                            EmployeeId, 
                            CASE WHEN IsOIGListed = 1 OR IsSAMListed = 1 THEN 1 ELSE 0 END AS IsExclusionListed, 
                            CASE WHEN IsOIGListed = 1 OR IsSAMListed = 1 THEN CreatedDate ELSE NULL END AS CreatedDate, 
                            ROW_NUMBER() OVER(PARTITION BY EmployeeId ORDER BY CreatedDate DESC) AS rn 
                        FROM [WebDev].dbo.CA_CheckResultsHistory) AS c WHERE rn = 1 GROUP BY EmployeeId) AS c 
            ON c.EmployeeId = e.ID 
    WHERE 
        e.IsActive = 1 AND e.PMID = 0 AND e.NCPDP = '1234567' GROUP BY e.PMID
END
                                
GO
