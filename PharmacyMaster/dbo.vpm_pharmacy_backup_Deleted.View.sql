USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vpm_pharmacy_backup_Deleted]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vpm_pharmacy_backup_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[PMParentID] ' THEN LastValue ELSE '' END) AS [PMParentID], 
 Max(Case ColumnName WHEN '[AAPAccountNo] ' THEN LastValue ELSE '' END) AS [AAPAccountNo], 
 Max(Case ColumnName WHEN '[AAPEffectiveDate] ' THEN LastValue ELSE '' END) AS [AAPEffectiveDate], 
 Max(Case ColumnName WHEN '[AAPParentNo] ' THEN LastValue ELSE '' END) AS [AAPParentNo], 
 Max(Case ColumnName WHEN '[AAPPreviousGroup] ' THEN LastValue ELSE '' END) AS [AAPPreviousGroup], 
 Max(Case ColumnName WHEN '[AAPQuitDate] ' THEN LastValue ELSE '' END) AS [AAPQuitDate], 
 Max(Case ColumnName WHEN '[AAPStatus] ' THEN LastValue ELSE '' END) AS [AAPStatus], 
 Max(Case ColumnName WHEN '[AccountDescription] ' THEN LastValue ELSE '' END) AS [AccountDescription], 
 Max(Case ColumnName WHEN '[AccountName] ' THEN LastValue ELSE '' END) AS [AccountName], 
 Max(Case ColumnName WHEN '[AllowDupDEA] ' THEN LastValue ELSE '' END) AS [AllowDupDEA], 
 Max(Case ColumnName WHEN '[APIAccountNo] ' THEN LastValue ELSE '' END) AS [APIAccountNo], 
 Max(Case ColumnName WHEN '[APIDEA] ' THEN LastValue ELSE '' END) AS [APIDEA], 
 Max(Case ColumnName WHEN '[APIMemberNo] ' THEN LastValue ELSE '' END) AS [APIMemberNo], 
 Max(Case ColumnName WHEN '[APIPMID] ' THEN LastValue ELSE '' END) AS [APIPMID], 
 Max(Case ColumnName WHEN '[APIStatus] ' THEN LastValue ELSE '' END) AS [APIStatus], 
 Max(Case ColumnName WHEN '[AvgWholesaleVolume] ' THEN LastValue ELSE '' END) AS [AvgWholesaleVolume], 
 Max(Case ColumnName WHEN '[BusinessClass] ' THEN LastValue ELSE '' END) AS [BusinessClass], 
 Max(Case ColumnName WHEN '[CAHStatus] ' THEN LastValue ELSE '' END) AS [CAHStatus], 
 Max(Case ColumnName WHEN '[CardinalDC] ' THEN LastValue ELSE '' END) AS [CardinalDC], 
 Max(Case ColumnName WHEN '[CategoryID] ' THEN LastValue ELSE '' END) AS [CategoryID], 
 Max(Case ColumnName WHEN '[CompetitiveAcct] ' THEN LastValue ELSE '' END) AS [CompetitiveAcct], 
 Max(Case ColumnName WHEN '[ComputerSoftware] ' THEN LastValue ELSE '' END) AS [ComputerSoftware], 
 Max(Case ColumnName WHEN '[ContractDate] ' THEN LastValue ELSE '' END) AS [ContractDate], 
 Max(Case ColumnName WHEN '[CorporateName] ' THEN LastValue ELSE '' END) AS [CorporateName], 
 Max(Case ColumnName WHEN '[CustPayTermsAPI] ' THEN LastValue ELSE '' END) AS [CustPayTermsAPI], 
 Max(Case ColumnName WHEN '[DateOpened] ' THEN LastValue ELSE '' END) AS [DateOpened], 
 Max(Case ColumnName WHEN '[DBA] ' THEN LastValue ELSE '' END) AS [DBA], 
 Max(Case ColumnName WHEN '[DEA] ' THEN LastValue ELSE '' END) AS [DEA], 
 Max(Case ColumnName WHEN '[DEAEXP] ' THEN LastValue ELSE '' END) AS [DEAEXP], 
 Max(Case ColumnName WHEN '[Email] ' THEN LastValue ELSE '' END) AS [Email], 
 Max(Case ColumnName WHEN '[EmergencyPhone] ' THEN LastValue ELSE '' END) AS [EmergencyPhone], 
 Max(Case ColumnName WHEN '[EstMonthlyVol] ' THEN LastValue ELSE '' END) AS [EstMonthlyVol], 
 Max(Case ColumnName WHEN '[FedID] ' THEN LastValue ELSE '' END) AS [FedID], 
 Max(Case ColumnName WHEN '[GroupNo] ' THEN LastValue ELSE '' END) AS [GroupNo], 
 Max(Case ColumnName WHEN '[HolidayHours] ' THEN LastValue ELSE '' END) AS [HolidayHours], 
 Max(Case ColumnName WHEN '[Hours] ' THEN LastValue ELSE '' END) AS [Hours], 
 Max(Case ColumnName WHEN '[IsHighVolume] ' THEN LastValue ELSE '' END) AS [IsHighVolume], 
 Max(Case ColumnName WHEN '[StoreHours_HolidayAM] ' THEN LastValue ELSE '' END) AS [StoreHours_HolidayAM], 
 Max(Case ColumnName WHEN '[StoreHours_HolidayPM] ' THEN LastValue ELSE '' END) AS [StoreHours_HolidayPM], 
 Max(Case ColumnName WHEN '[StoreHours_MondayFridayAM] ' THEN LastValue ELSE '' END) AS [StoreHours_MondayFridayAM], 
 Max(Case ColumnName WHEN '[StoreHours_MondayFridayPM] ' THEN LastValue ELSE '' END) AS [StoreHours_MondayFridayPM], 
 Max(Case ColumnName WHEN '[StoreHours_SaturdayAM] ' THEN LastValue ELSE '' END) AS [StoreHours_SaturdayAM], 
 Max(Case ColumnName WHEN '[StoreHours_SaturdayPM] ' THEN LastValue ELSE '' END) AS [StoreHours_SaturdayPM], 
 Max(Case ColumnName WHEN '[StoreHours_SundayAM] ' THEN LastValue ELSE '' END) AS [StoreHours_SundayAM], 
 Max(Case ColumnName WHEN '[StoreHours_SundayPM] ' THEN LastValue ELSE '' END) AS [StoreHours_SundayPM], 
 Max(Case ColumnName WHEN '[IsStartUpStore] ' THEN LastValue ELSE '' END) AS [IsStartUpStore], 
 Max(Case ColumnName WHEN '[NCPDP] ' THEN LastValue ELSE '' END) AS [NCPDP], 
 Max(Case ColumnName WHEN '[NPI] ' THEN LastValue ELSE '' END) AS [NPI], 
 Max(Case ColumnName WHEN '[NumReactivated] ' THEN LastValue ELSE '' END) AS [NumReactivated], 
 Max(Case ColumnName WHEN '[OrigStartDate] ' THEN LastValue ELSE '' END) AS [OrigStartDate], 
 Max(Case ColumnName WHEN '[OwnerName] ' THEN LastValue ELSE '' END) AS [OwnerName], 
 Max(Case ColumnName WHEN '[Payee_id] ' THEN LastValue ELSE '' END) AS [Payee_id], 
 Max(Case ColumnName WHEN '[PrimaryCAAccountNo] ' THEN LastValue ELSE '' END) AS [PrimaryCAAccountNo], 
 Max(Case ColumnName WHEN '[PrimaryWholesaler] ' THEN LastValue ELSE '' END) AS [PrimaryWholesaler], 
 Max(Case ColumnName WHEN '[QPS] ' THEN LastValue ELSE '' END) AS [QPS], 
 Max(Case ColumnName WHEN '[Rank] ' THEN LastValue ELSE '' END) AS [Rank], 
 Max(Case ColumnName WHEN '[Resigned] ' THEN LastValue ELSE '' END) AS [Resigned], 
 Max(Case ColumnName WHEN '[Source] ' THEN LastValue ELSE '' END) AS [Source], 
 Max(Case ColumnName WHEN '[Status] ' THEN LastValue ELSE '' END) AS [Status], 
 Max(Case ColumnName WHEN '[Territory] ' THEN LastValue ELSE '' END) AS [Territory], 
 Max(Case ColumnName WHEN '[UDAccountNo] ' THEN LastValue ELSE '' END) AS [UDAccountNo], 
 Max(Case ColumnName WHEN '[UDNonPharmacy] ' THEN LastValue ELSE '' END) AS [UDNonPharmacy], 
 Max(Case ColumnName WHEN '[UDParentNo] ' THEN LastValue ELSE '' END) AS [UDParentNo], 
 Max(Case ColumnName WHEN '[UDQuitDate] ' THEN LastValue ELSE '' END) AS [UDQuitDate], 
 Max(Case ColumnName WHEN '[UDStatus] ' THEN LastValue ELSE '' END) AS [UDStatus], 
 Max(Case ColumnName WHEN '[Website] ' THEN LastValue ELSE '' END) AS [Website], 
 Max(Case ColumnName WHEN '[Wholesaler] ' THEN LastValue ELSE '' END) AS [Wholesaler], 
 Max(Case ColumnName WHEN '[WholesalerAccountNo] ' THEN LastValue ELSE '' END) AS [WholesalerAccountNo], 
 Max(Case ColumnName WHEN '[WhyResigned] ' THEN LastValue ELSE '' END) AS [WhyResigned], 
 Max(Case ColumnName WHEN '[IsBuyingGroup] ' THEN LastValue ELSE '' END) AS [IsBuyingGroup], 
 Max(Case ColumnName WHEN '[IsPos] ' THEN LastValue ELSE '' END) AS [IsPos], 
 Max(Case ColumnName WHEN '[IsPva] ' THEN LastValue ELSE '' END) AS [IsPva], 
 Max(Case ColumnName WHEN '[FeePaid] ' THEN LastValue ELSE '' END) AS [FeePaid], 
 Max(Case ColumnName WHEN '[IsManagedCare] ' THEN LastValue ELSE '' END) AS [IsManagedCare], 
 Max(Case ColumnName WHEN '[IsWarehouse] ' THEN LastValue ELSE '' END) AS [IsWarehouse], 
 Max(Case ColumnName WHEN '[IsNPP] ' THEN LastValue ELSE '' END) AS [IsNPP], 
 Max(Case ColumnName WHEN '[ACHEmail] ' THEN LastValue ELSE '' END) AS [ACHEmail], 
 Max(Case ColumnName WHEN '[MembershipType] ' THEN LastValue ELSE '' END) AS [MembershipType], 
 Max(Case ColumnName WHEN '[OrganizationType] ' THEN LastValue ELSE '' END) AS [OrganizationType], 
 Max(Case ColumnName WHEN '[AuthorizedVoter] ' THEN LastValue ELSE '' END) AS [AuthorizedVoter], 
 Max(Case ColumnName WHEN '[MembershipOwner] ' THEN LastValue ELSE '' END) AS [MembershipOwner]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.pm_pharmacy_backup') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.pm_pharmacy_backup') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.pm_pharmacy_backup') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
