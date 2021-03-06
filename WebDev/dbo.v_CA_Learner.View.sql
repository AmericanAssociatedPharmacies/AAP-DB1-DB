USE [WebDev]
GO
/****** Object:  View [dbo].[v_CA_Learner]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_CA_Learner] as
/*Employees*/ SELECT 'CUL' AS Command, 'E' AS AllowableAction, e.Username AS LearnerAltId, e.FirstName, e.LastName, 
                         CASE WHEN e.IsActive = 1 THEN 'A' ELSE 'D' END AS [Status], 'Member' AS RateCategory, '16' AS TimeZone, ' ' AS BirthDate, ' ' AS Email, ' ' AS Gender, 
                         e.Username AS InitialLoginName, e.NCPDP AS InitialiLoginPassword, p.NCPDP, p.Addr1, p.Addr2, ' ' AS Addr3, p.City, p.[State], p.Zip, ' ' AS CountryCode, 
                         p.NCPDP AS Group1Code, ' ' AS Group2Code, ' ' AS Group3Code, ' ' AS Group4Code, ' ' AS Group5Code, p.AccountName AS Group1CodeDescription, 
                         ' ' AS Group2Desc, ' ' AS Group3Desc, ' ' AS Group4Desc, ' ' AS Group5Desc, et.EmployeeType AS LookUp1Code, ent.EmployeeNameType AS LookUp2Code, 
                         ' ' AS LookUp3Code, ' ' AS LookUp4Code, ' ' AS LookUp5Code, ' ' AS LookUp6Code, ' ' AS LookUp7Code, ' ' AS LookUp8Code, ' ' AS LookUp9Code, 
                         ' ' AS LookUp10Code, ' ' AS LookUp11Code, ' ' AS LookUp12Code, ' ' AS LookUp13Code, ' ' AS LookUp14Code, Replace(CONVERT(VARCHAR(10), [CreatedDate], 111), 
                         '/', '-') AS [CreatedDate], Replace(CONVERT(VARCHAR(10), [ModifiedDate], 111), '/', '-') AS [ModifiedDate], '' AS Boolean1, '' AS Boolean2, e.MiddleName, 
                         ' ' AS Freetext2, ' ' AS Freetext3, ' ' AS Freetext4, p.Phone AS Phone, ' ' AS ExclusionChecksEnabled, p.PMID
FROM            (SELECT        *
                          FROM            PharmacyMaster..v_test2/*where isMCorNPP=1*/ ) AS p LEFT JOIN
                         CA_StoreEmployee e ON e.PMID = p.PMID INNER JOIN
                         CA_EmployeeType et ON e.EmployeeType = et.ID INNER JOIN
                         CA_EmployeeNameType ent ON e.EmployeeNameType = ent.ID
/*order by p.PMID,e.Username)*/ UNION
(SELECT        'CUL' AS Command, 'E' AS AllowableAction, e.Username AS LearnerAltId, e.FirstName, e.LastName, CASE WHEN e.IsActive = 1 THEN 'A' ELSE 'D' END AS [Status], 
                          'Member' AS RateCategory, '16' AS TimeZone, ' ' AS BirthDate, ' ' AS Email, ' ' AS Gender, e.Username AS InitialLoginName, 
                          e.NCPDP AS InitialiLoginPassword, '1234567' AS NCPDP, '7243 North 16th Street' AS Addr1, NULL AS Addr2, ' ' AS Addr3, 'Phoenix' AS City, 'AZ' AS [State], 
                          '85020' AS Zip, ' ' AS CountryCode, e.NCPDP AS Group1Code, ' ' AS Group2Code, ' ' AS Group3Code, ' ' AS Group4Code, ' ' AS Group5Code, 
                          'Arete Pharmacy Network' AS Group1CodeDescription, ' ' AS Group2Desc, ' ' AS Group3Desc, ' ' AS Group4Desc, ' ' AS Group5Desc, 
                          et.EmployeeType AS LookUp1Code, ent.EmployeeNameType AS LookUp2Code, ' ' AS LookUp3Code, ' ' AS LookUp4Code, ' ' AS LookUp5Code, ' ' AS LookUp6Code, 
                          ' ' AS LookUp7Code, ' ' AS LookUp8Code, ' ' AS LookUp9Code, ' ' AS LookUp10Code, ' ' AS LookUp11Code, ' ' AS LookUp12Code, ' ' AS LookUp13Code, 
                          ' ' AS LookUp14Code, Replace(CONVERT(VARCHAR(10), [CreatedDate], 111), '/', '-') AS [CreatedDate], Replace(CONVERT(VARCHAR(10), [ModifiedDate], 111), '/', '-') 
                          AS [ModifiedDate], '' AS Boolean1, '' AS Boolean2, e.MiddleName, ' ' AS Freetext2, ' ' AS Freetext3, ' ' AS Freetext4, '602-678-1179' AS Phone, 
                          ' ' AS ExclusionChecksEnabled, '000000' AS PMID
 FROM            CA_StoreEmployee e INNER JOIN
                          CA_EmployeeType et ON e.EmployeeType = et.ID INNER JOIN
                          CA_EmployeeNameType ent ON e.EmployeeNameType = ent.ID
 WHERE        e.NCPDP = '1234567'/*order by e.PMID,e.Username)*/ )
UNION
/*Admins*/ SELECT 'CUL' AS Command, 'E' AS AllowableAction, a.NCPDP AS LearnerAltId, substring(a.OwnerName, 1, charindex(' ', a.OwnerName)) AS FirstName, 
                         substring(a.OwnerName, charindex(' ', a.OwnerName) + 1, len(a.ownername)) AS LastName, CASE WHEN a.IsActive = 1 THEN 'A' ELSE 'D' END AS [Status], 
                         'Member' AS RateCategory, '16' AS TimeZone, ' ' AS BirthDate, ' ' AS Email, ' ' AS Gender, a.NCPDP AS InitialLoginName, a.NCPDP AS InitialiLoginPassword, 
                         a.NCPDP, a.Addr1, a.Addr2, ' ' AS Addr3, a.City, a.[State], a.Zip, ' ' AS CountryCode, a.NCPDP AS Group1Code, ' ' AS Group2Code, ' ' AS Group3Code, 
                         ' ' AS Group4Code, ' ' AS Group5Code, a.AccountName AS Group1CodeDescription, ' ' AS Group2Desc, ' ' AS Group3Desc, ' ' AS Group4Desc, ' ' AS Group5Desc, 
                         'Admin' AS LookUp1Code, 'Primary' AS LookUp2Code, ' ' AS LookUp3Code, ' ' AS LookUp4Code, ' ' AS LookUp5Code, ' ' AS LookUp6Code, ' ' AS LookUp7Code, 
                         ' ' AS LookUp8Code, ' ' AS LookUp9Code, ' ' AS LookUp10Code, ' ' AS LookUp11Code, ' ' AS LookUp12Code, ' ' AS LookUp13Code, ' ' AS LookUp14Code, 
                         '' AS [CreatedDate], '' AS [ModifiedDate], '' AS Boolean1, '' AS Boolean2, '' AS MiddleName, ' ' AS Freetext2, ' ' AS Freetext3, ' ' AS Freetext4, a.Phone AS Phone, 
                         ' ' AS ExclusionChecksEnabled, a.PMID
FROM            PharmacyMaster..v_test2 a
UNION
SELECT        'CUL' AS Command, 'E' AS AllowableAction, '1234567' AS LearnerAltId, 'Arete' AS FirstName, 'Admin' AS LastName, 'A' AS [Status], 'Member' AS RateCategory, 
                         '16' AS TimeZone, ' ' AS BirthDate, ' ' AS Email, ' ' AS Gender, '1234567' AS InitialLoginName, '1234567' AS InitialiLoginPassword, '1234567' AS NCPDP, 
                         '7243 North 16th Street' AS Addr1, NULL AS Addr2, ' ' AS Addr3, 'Phoenix' AS City, 'AZ' AS [State], '85020' AS Zip, ' ' AS CountryCode, '1234567' AS Group1Code, 
                         ' ' AS Group2Code, ' ' AS Group3Code, ' ' AS Group4Code, ' ' AS Group5Code, 'Arete Pharmacy Network' AS Group1CodeDescription, ' ' AS Group2Desc, 
                         ' ' AS Group3Desc, ' ' AS Group4Desc, ' ' AS Group5Desc, 'Admin' AS LookUp1Code, 'Primary' AS LookUp2Code, ' ' AS LookUp3Code, ' ' AS LookUp4Code, 
                         ' ' AS LookUp5Code, ' ' AS LookUp6Code, ' ' AS LookUp7Code, ' ' AS LookUp8Code, ' ' AS LookUp9Code, ' ' AS LookUp10Code, ' ' AS LookUp11Code, 
                         ' ' AS LookUp12Code, ' ' AS LookUp13Code, ' ' AS LookUp14Code, '' AS [CreatedDate], '' AS [ModifiedDate], '' AS Boolean1, '' AS Boolean2, '' AS MiddleName, 
                         ' ' AS Freetext2, ' ' AS Freetext3, ' ' AS Freetext4, '602-678-1179' AS Phone, ' ' AS ExclusionChecksEnabled, '000000' AS PMID
GO
