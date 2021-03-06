USE [Medispan]
GO
/****** Object:  Table [dbo].[M25_A_A]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M25_A_A](
	[NDC_UPC_HRI] [varchar](11) NOT NULL,
	[ID_Number_Format_Code] [varchar](1) NULL,
	[Record_Code] [varchar](1) NULL,
	[Record_Code_ID] [numeric](37, 0) NULL,
	[Transaction_Code] [varchar](1) NULL,
	[Sequence_Code] [varchar](7) NULL,
	[Labeler_Code] [numeric](37, 0) NULL,
	[Generic_ID_Type_Code] [varchar](1) NULL,
	[Generic_ID_Number] [numeric](37, 0) NULL,
	[DEA_Class_Code] [varchar](5) NULL,
	[AHFSCC_Therapeutic_Class_Code] [numeric](37, 0) NULL,
	[Item_Status_Flag] [varchar](1) NULL,
	[Local_Systemic_Flag] [varchar](1) NULL,
	[TEE_Code] [varchar](2) NULL,
	[Formatted_ID_Number] [varchar](13) NULL,
	[RX_OTC_Indicator_Code] [varchar](1) NULL,
	[Third_Party_Restriction_Code] [varchar](1) NULL,
	[Maintenance_Drug_Code] [varchar](1) NULL,
	[Dispensing_Unit_Code] [varchar](1) NULL,
	[Unit_Dose_Unit_of_Use_Package] [varchar](1) NULL,
	[Route_of_Administration] [varchar](2) NULL,
	[Form_Type_Code] [varchar](1) NULL,
	[Dollar_Rank_Code] [varchar](1) NULL,
	[Rx_Rank_Code] [varchar](1) NULL,
	[Number_System_Character] [varchar](1) NULL,
	[Secondary_ID_Format_Code] [varchar](1) NULL,
	[Secondary_ID_Number] [varchar](10) NULL,
	[Multi_Source_Code] [varchar](1) NULL,
	[Brand_Name_Code] [varchar](1) NULL,
	[Reimbursement_Indicator] [varchar](1) NULL,
	[Internal_External_Code] [varchar](1) NULL,
	[Single_Combination_Code] [varchar](1) NULL,
	[Storage_Condition_Code] [varchar](1) NULL,
	[Limited_Stability_Code] [varchar](1) NULL,
	[Last_Change_Date] [varchar](5) NULL
) ON [PRIMARY]
GO
