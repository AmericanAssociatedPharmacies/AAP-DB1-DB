USE [ODSIntake]
GO
/****** Object:  Table [Staging].[Rx30Claims]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Rx30Claims](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[FileRowID] [int] NOT NULL,
	[PharmID] [varchar](500) NULL,
	[BINNbr] [varchar](500) NULL,
	[PCN] [varchar](500) NULL,
	[GroupNbr] [varchar](500) NULL,
	[Submitted] [varchar](500) NULL,
	[RxDate] [varchar](500) NULL,
	[QtyDispensed] [varchar](500) NULL,
	[DaySupply] [varchar](500) NULL,
	[NDCDispensed] [varchar](500) NULL,
	[FeeSubmitted] [varchar](500) NULL,
	[CostSubmitted] [varchar](500) NULL,
	[FeePaid] [varchar](500) NULL,
	[CostPaid] [varchar](500) NULL,
	[PlanAmount] [varchar](500) NULL,
	[CoPayAmount] [varchar](500) NULL,
	[UandC] [varchar](500) NULL,
	[TotalPrice] [varchar](500) NULL,
	[BS] [varchar](500) NULL,
	[BR] [varchar](500) NULL,
	[OI] [varchar](500) NULL,
	[DAW] [varchar](500) NULL,
	[DAWDesc] [varchar](500) NULL,
	[PatientPaid] [varchar](500) NULL,
	[GrossAmtDue] [varchar](500) NULL,
	[PlanID] [varchar](500) NULL,
	[RejCode] [varchar](500) NULL,
	[MessageResponse] [varchar](500) NULL,
	[TxResponse] [varchar](500) NULL,
	[RxNbr] [varchar](500) NULL,
	[RfNbr] [varchar](500) NULL,
	[PID_Q] [varchar](500) NULL,
	[PID] [varchar](500) NULL,
	[DoctorName] [varchar](500) NULL,
	[RA] [varchar](500) NULL,
	[NDCWritten] [varchar](500) NULL,
	[OtherAmount] [varchar](500) NULL,
	[TYPE] [varchar](500) NULL,
	[Rx30Lic] [varchar](500) NULL,
	[Compound] [varchar](500) NULL,
	[NetworkReimbID] [varchar](500) NULL,
	[PatientKey] [varchar](500) NULL,
	[PatientName] [varchar](500) NULL,
	[PatLocationCode] [varchar](500) NULL,
	[CardholderID] [varchar](500) NULL,
	[Patient Address] [varchar](500) NULL,
	[PatientCity] [varchar](500) NULL,
	[PatientState] [varchar](500) NULL,
	[PatientZip] [varchar](500) NULL,
	[PatientPhone] [varchar](500) NULL,
	[Birthdate] [varchar](500) NULL,
	[Gender] [varchar](500) NULL,
	[PrescriberPhone] [varchar](500) NULL,
	[RxSource] [varchar](500) NULL,
	[DRDEA] [varchar](500) NULL,
	[UnitAWP] [varchar](500) NULL,
	[PatientLastName] [varchar](500) NULL,
	[PatientFirstName] [varchar](500) NULL,
	[PatientMiddleName] [varchar](500) NULL,
	[FlatTaxPaid] [varchar](500) NULL,
	[PCTTaxPaid] [varchar](500) NULL,
	[PCTTaxRate] [varchar](500) NULL,
	[PCTTaxBasis] [varchar](500) NULL,
	[IncentiveFePaid] [varchar](500) NULL,
	[ProfFeePaid] [varchar](500) NULL,
	[PrescriberNPI] [varchar](500) NULL,
	[RxDiscount] [varchar](500) NULL,
	[ClaimAuthNumber] [varchar](500) NULL,
	[FileProcessed] [varchar](1000) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_Rx30Claims] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
