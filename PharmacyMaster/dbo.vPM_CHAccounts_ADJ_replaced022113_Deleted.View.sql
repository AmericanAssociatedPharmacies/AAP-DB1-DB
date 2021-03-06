USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vPM_CHAccounts_ADJ_replaced022113_Deleted]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPM_CHAccounts_ADJ_replaced022113_Deleted]
AS 
SELECT Col.*, CM.Created, CM.Modified, DD.Deleted FROM  (SELECT PrimaryKey
, 
 Max(Case ColumnName WHEN '[PMID] ' THEN LastValue ELSE '' END) AS [PMID], 
 Max(Case ColumnName WHEN '[Marker] ' THEN LastValue ELSE '' END) AS [Marker], 
 Max(Case ColumnName WHEN '[Status] ' THEN LastValue ELSE '' END) AS [Status], 
 Max(Case ColumnName WHEN '[DEA] ' THEN LastValue ELSE '' END) AS [DEA], 
 Max(Case ColumnName WHEN '[Name] ' THEN LastValue ELSE '' END) AS [Name], 
 Max(Case ColumnName WHEN '[AKA] ' THEN LastValue ELSE '' END) AS [AKA], 
 Max(Case ColumnName WHEN '[APIAccountNo] ' THEN LastValue ELSE '' END) AS [APIAccountNo], 
 Max(Case ColumnName WHEN '[AAPAccountNo] ' THEN LastValue ELSE '' END) AS [AAPAccountNo], 
 Max(Case ColumnName WHEN '[AAPParentNo] ' THEN LastValue ELSE '' END) AS [AAPParentNo], 
 Max(Case ColumnName WHEN '[UDAccountNo] ' THEN LastValue ELSE '' END) AS [UDAccountNo], 
 Max(Case ColumnName WHEN '[IsMCAOnFile] ' THEN LastValue ELSE '' END) AS [IsMCAOnFile], 
 Max(Case ColumnName WHEN '[BusCls] ' THEN LastValue ELSE '' END) AS [BusCls], 
 Max(Case ColumnName WHEN '[Affiliate] ' THEN LastValue ELSE '' END) AS [Affiliate], 
 Max(Case ColumnName WHEN '[CHParentCode] ' THEN LastValue ELSE '' END) AS [CHParentCode], 
 Max(Case ColumnName WHEN '[Division] ' THEN LastValue ELSE '' END) AS [Division], 
 Max(Case ColumnName WHEN '[DC] ' THEN LastValue ELSE '' END) AS [DC], 
 Max(Case ColumnName WHEN '[CHAccountNoPrimary] ' THEN LastValue ELSE '' END) AS [CHAccountNoPrimary], 
 Max(Case ColumnName WHEN '[CHAccountNo2] ' THEN LastValue ELSE '' END) AS [CHAccountNo2], 
 Max(Case ColumnName WHEN '[CHAccountNo3] ' THEN LastValue ELSE '' END) AS [CHAccountNo3], 
 Max(Case ColumnName WHEN '[POSAcct] ' THEN LastValue ELSE '' END) AS [POSAcct], 
 Max(Case ColumnName WHEN '[ScanTossAcct] ' THEN LastValue ELSE '' END) AS [ScanTossAcct], 
 Max(Case ColumnName WHEN '[CSOSAcct] ' THEN LastValue ELSE '' END) AS [CSOSAcct], 
 Max(Case ColumnName WHEN '[AAPContractDate] ' THEN LastValue ELSE '' END) AS [AAPContractDate], 
 Max(Case ColumnName WHEN '[TerminationDate] ' THEN LastValue ELSE '' END) AS [TerminationDate], 
 Max(Case ColumnName WHEN '[IsMultipleStore] ' THEN LastValue ELSE '' END) AS [IsMultipleStore], 
 Max(Case ColumnName WHEN '[MultipleStoreCode] ' THEN LastValue ELSE '' END) AS [MultipleStoreCode], 
 Max(Case ColumnName WHEN '[GroupCode] ' THEN LastValue ELSE '' END) AS [GroupCode], 
 Max(Case ColumnName WHEN '[CurrEstMoSales] ' THEN LastValue ELSE '' END) AS [CurrEstMoSales], 
 Max(Case ColumnName WHEN '[CurrGroupTotal] ' THEN LastValue ELSE '' END) AS [CurrGroupTotal], 
 Max(Case ColumnName WHEN '[EstVolAtLoad] ' THEN LastValue ELSE '' END) AS [EstVolAtLoad], 
 Max(Case ColumnName WHEN '[LastReviewDate] ' THEN LastValue ELSE '' END) AS [LastReviewDate], 
 Max(Case ColumnName WHEN '[CurrAPICOG] ' THEN LastValue ELSE '' END) AS [CurrAPICOG], 
 Max(Case ColumnName WHEN '[CurrCHCOG] ' THEN LastValue ELSE '' END) AS [CurrCHCOG], 
 Max(Case ColumnName WHEN '[IsQPSStore] ' THEN LastValue ELSE '' END) AS [IsQPSStore], 
 Max(Case ColumnName WHEN '[PayTermsDesc] ' THEN LastValue ELSE '' END) AS [PayTermsDesc], 
 Max(Case ColumnName WHEN '[PayTermsCode] ' THEN LastValue ELSE '' END) AS [PayTermsCode], 
 Max(Case ColumnName WHEN '[IsPendingChanges] ' THEN LastValue ELSE '' END) AS [IsPendingChanges], 
 Max(Case ColumnName WHEN '[NotesCOGDifferences] ' THEN LastValue ELSE '' END) AS [NotesCOGDifferences], 
 Max(Case ColumnName WHEN '[Notes] ' THEN LastValue ELSE '' END) AS [Notes], 
 Max(Case ColumnName WHEN '[Territory] ' THEN LastValue ELSE '' END) AS [Territory], 
 Max(Case ColumnName WHEN '[IsExcptToMatrix] ' THEN LastValue ELSE '' END) AS [IsExcptToMatrix], 
 Max(Case ColumnName WHEN '[IsOptionalPayTerms] ' THEN LastValue ELSE '' END) AS [IsOptionalPayTerms], 
 Max(Case ColumnName WHEN '[IsFrontLoadNoReb] ' THEN LastValue ELSE '' END) AS [IsFrontLoadNoReb], 
 Max(Case ColumnName WHEN '[WAPD] ' THEN LastValue ELSE '' END) AS [WAPD], 
 Max(Case ColumnName WHEN '[DSO] ' THEN LastValue ELSE '' END) AS [DSO], 
 Max(Case ColumnName WHEN '[LastUpdate] ' THEN LastValue ELSE '' END) AS [LastUpdate], 
 Max(Case ColumnName WHEN '[WAPD2ndAcct] ' THEN LastValue ELSE '' END) AS [WAPD2ndAcct], 
 Max(Case ColumnName WHEN '[DSO2ndAcct] ' THEN LastValue ELSE '' END) AS [DSO2ndAcct], 
 Max(Case ColumnName WHEN '[IsSublogicChange] ' THEN LastValue ELSE '' END) AS [IsSublogicChange], 
 Max(Case ColumnName WHEN '[NotesOnTerms] ' THEN LastValue ELSE '' END) AS [NotesOnTerms], 
 Max(Case ColumnName WHEN '[ChangePending] ' THEN LastValue ELSE '' END) AS [ChangePending], 
 Max(Case ColumnName WHEN '[ContractedDSO] ' THEN LastValue ELSE '' END) AS [ContractedDSO], 
 Max(Case ColumnName WHEN '[SecondDivision] ' THEN LastValue ELSE '' END) AS [SecondDivision], 
 Max(Case ColumnName WHEN '[SecondPrimaryNumber] ' THEN LastValue ELSE '' END) AS [SecondPrimaryNumber], 
 Max(Case ColumnName WHEN '[Second2nd] ' THEN LastValue ELSE '' END) AS [Second2nd], 
 Max(Case ColumnName WHEN '[Second3rd] ' THEN LastValue ELSE '' END) AS [Second3rd], 
 Max(Case ColumnName WHEN '[SecondPOS] ' THEN LastValue ELSE '' END) AS [SecondPOS], 
 Max(Case ColumnName WHEN '[SecondCSOS] ' THEN LastValue ELSE '' END) AS [SecondCSOS], 
 Max(Case ColumnName WHEN '[SecondCST] ' THEN LastValue ELSE '' END) AS [SecondCST], 
 Max(Case ColumnName WHEN '[ThirdDivision] ' THEN LastValue ELSE '' END) AS [ThirdDivision], 
 Max(Case ColumnName WHEN '[ThirdPrimaryNumber] ' THEN LastValue ELSE '' END) AS [ThirdPrimaryNumber], 
 Max(Case ColumnName WHEN '[Third2nd] ' THEN LastValue ELSE '' END) AS [Third2nd], 
 Max(Case ColumnName WHEN '[ThirdPOS] ' THEN LastValue ELSE '' END) AS [ThirdPOS], 
 Max(Case ColumnName WHEN '[ThirdCSOS] ' THEN LastValue ELSE '' END) AS [ThirdCSOS], 
 Max(Case ColumnName WHEN '[ThirdCST] ' THEN LastValue ELSE '' END) AS [ThirdCST]
  FROM (Select PrimaryKey, ColumnName, NewValue as LastValue from dbo.audit  
  		 Where Operation IN ('i', 'u') 
  				AND AuditID IN (
  					Select Max(AuditID)
  				  FROM dbo.audit a
  						JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_CHAccounts_ADJ_replaced022113') d
  						  on a.tablename = d.tablename and a.primarykey = d.primarykey
  					  GROUP BY a.TableName, a.PrimaryKey, a.ColumnName )) q
  GROUP BY PrimaryKey) Col
  JOIN 
  (SELECT a.TableName, a.PrimaryKey, Min(AuditDate) as Created, Max(AuditDate) as Modified
  			  FROM dbo.Audit a
  				JOIN (SELECT TableName, PrimaryKey FROM dbo.audit where operation = 'd' AND TableName = 'dbo.PM_CHAccounts_ADJ_replaced022113') d
  					on a.tablename = d.tablename and a.primarykey = d.primarykey
  			  Where Operation IN ('i', 'u')
  			  GROUP BY a.TableName, a.PrimaryKey ) CM
  			ON Col.PrimaryKey = CM.PrimaryKey
      JOIN 
  		(SELECT PrimaryKey, AuditDate as Deleted 
              FROM dbo.audit 
              WHERE operation = 'd' 
              AND TableName = 'dbo.PM_CHAccounts_ADJ_replaced022113') DD
  			ON Col.PrimaryKey = DD.PrimaryKey
GO
