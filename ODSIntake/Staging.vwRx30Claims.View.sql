USE [ODSIntake]
GO
/****** Object:  View [Staging].[vwRx30Claims]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [Staging].[vwRx30Claims]

AS

SELECT TOP 100 PERCENT RowID, FileRowID, PharmID, BINNbr, PCN, GroupNbr, Submitted, RxDate, QtyDispensed, DaySupply, NDCDispensed
, FeeSubmitted, CostSubmitted, FeePaid, CostPaid, PlanAmount, CoPayAmount, UandC, TotalPrice, BS, BR, OI
, DAW, DAWDesc, PatientPaid, GrossAmtDue, PlanID, RejCode, MessageResponse, TxResponse, RxNbr, RfNbr, PID_Q
, PID, DoctorName, RA, NDCWritten, OtherAmount, TYPE, Rx30Lic, Compound, NetworkReimbID, PatientKey, PatientName
, PatLocationCode, CardholderID, [Patient Address], PatientCity, PatientState, PatientZip, PatientPhone, Birthdate
, Gender, PrescriberPhone, RxSource, DRDEA, UnitAWP, PatientLastName, PatientFirstName, PatientMiddleName
, FlatTaxPaid, PCTTaxPaid, PCTTaxRate, PCTTaxBasis, IncentiveFePaid, ProfFeePaid, PrescriberNPI, RxDiscount
, ClaimAuthNumber, [FileProcessed]
FROM [Staging].[Rx30Claims_Table]
ORDER BY RowID ASC
--WHERE [FlatTaxPaid] <> 'MARY'

--UNION ALL

--SELECT TOP 1000 RowID, PharmID, BINNbr, PCN, GroupNbr, Submitted, RxDate, QtyDispensed, DaySupply, NDCDispensed
--, FeeSubmitted, CostSubmitted, FeePaid, CostPaid, PlanAmount, CoPayAmount, UandC, TotalPrice, BS, BR, OI
--, DAW, DAWDesc, PatientPaid, GrossAmtDue, PlanID, RejCode, MessageResponse, TxResponse, RxNbr, RfNbr, PID_Q
--, PID, DoctorName, RA, NDCWritten, OtherAmount, TYPE, Rx30Lic, Compound, NetworkReimbID, PatientKey, PatientName
--, PatLocationCode, CardholderID, [Patient Address], PatientCity, PatientState, PatientZip, PatientPhone, Birthdate
--, Gender, PrescriberPhone, RxSource, DRDEA, UnitAWP, PatientLastName, PatientFirstName, PatientMiddleName
--, FlatTaxPaid, PCTTaxPaid, PCTTaxRate, PCTTaxBasis, IncentiveFePaid, ProfFeePaid, PrescriberNPI, RxDiscount
--, ClaimAuthNumber, [FileProcessed]
--FROM [Staging].[Rx30Claims_Table]
--WHERE [FlatTaxPaid] = 'MARY'




GO
