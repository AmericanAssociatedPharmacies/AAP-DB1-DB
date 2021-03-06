USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_rcrebate_jmw_bkp04132017]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_rcrebate_jmw_bkp04132017](
	[TM] [varchar](20) NULL,
	[PMID] [int] NULL,
	[AAP#] [varchar](25) NULL,
	[Parent#] [varchar](25) NULL,
	[Group#] [varchar](25) NULL,
	[API#] [varchar](25) NULL,
	[AAP Eff] [varchar](25) NULL,
	[AAP Quit] [varchar](25) NULL,
	[Description] [varchar](100) NULL,
	[Affiliate] [varchar](100) NULL,
	[Account DBA Name] [varchar](100) NULL,
	[Account Corporate Name] [varchar](100) NULL,
	[Address] [varchar](250) NULL,
	[City] [varchar](100) NULL,
	[St] [varchar](100) NULL,
	[Contact] [varchar](150) NULL,
	[Email] [varchar](150) NULL,
	[Financial Email] [varchar](150) NULL,
	[MC Network] [varchar](150) NULL,
	[Preferred Partners Volume 2016] [float] NULL,
	[Preferred Partners Rebate 2016] [float] NULL,
	[Total Preferred Partners Rebate 2016] [float] NULL,
	[API Generic Sales 0116] [float] NULL,
	[API Net Rebate to Store 0116] [float] NULL,
	[API Avg Rebate Percentage 0116] [float] NULL,
	[API Brand Credits Disbursed 0116] [float] NULL,
	[API Accelerated Pay Discount 0116] [float] NULL,
	[API Generic Sales 0216] [float] NULL,
	[API Net Rebate to Store 0216] [float] NULL,
	[API Avg Rebate Percentage 0216] [float] NULL,
	[API Brand Credits Disbursed 0216] [float] NULL,
	[API Accelerated Pay Discount 0216] [float] NULL,
	[API Generic Sales 0316] [float] NULL,
	[API Net Rebate to Store 0316] [float] NULL,
	[API Avg Rebate Percentage 0316] [float] NULL,
	[API Brand Credits Disbursed 0316] [float] NULL,
	[API Accelerated Pay Discount 0316] [float] NULL,
	[API Generic Sales 0416] [float] NULL,
	[API Net Rebate to Store 0416] [float] NULL,
	[API Avg Rebate Percentage 0416] [float] NULL,
	[API Brand Credits Disbursed 0416] [float] NULL,
	[API Accelerated Pay Discount 0416] [float] NULL,
	[API Generic Sales 0516] [float] NULL,
	[API Net Rebate to Store 0516] [float] NULL,
	[API Avg Rebate Percentage 0516] [float] NULL,
	[API Brand Credits Disbursed 0516] [float] NULL,
	[API Accelerated Pay Discount 0516] [float] NULL,
	[API Generic Sales 0616] [float] NULL,
	[API Net Rebate to Store 0616] [float] NULL,
	[API Avg Rebate Percentage 0616] [float] NULL,
	[API Brand Credits Disbursed 0616] [float] NULL,
	[API Accelerated Pay Discount 0616] [float] NULL,
	[API Generic Sales 0716] [float] NULL,
	[API Net Rebate to Store 0716] [float] NULL,
	[API Avg Rebate Percentage 0716] [float] NULL,
	[API Brand Credits Disbursed 0716] [float] NULL,
	[API Accelerated Pay Discount 0716] [float] NULL,
	[API Generic Sales 0816] [float] NULL,
	[API Net Rebate to Store 0816] [float] NULL,
	[API Avg Rebate Percentage 0816] [float] NULL,
	[API Brand Credits Disbursed 0816] [float] NULL,
	[API Accelerated Pay Discount 0816] [float] NULL,
	[API Generic Sales 0916] [float] NULL,
	[API Net Rebate to Store 0916] [float] NULL,
	[API Avg Rebate Percentage 0916] [float] NULL,
	[API Brand Credits Disbursed 0916] [float] NULL,
	[API Accelerated Pay Discount 0916] [float] NULL,
	[API Generic Sales 1016] [float] NULL,
	[API Net Rebate to Store 1016] [float] NULL,
	[API Avg Rebate Percentage 1016] [float] NULL,
	[API Brand Credits Disbursed 1016] [float] NULL,
	[API Accelerated Pay Discount 1016] [float] NULL,
	[API Generic Sales 1116] [float] NULL,
	[API Net Rebate to Store 1116] [float] NULL,
	[API Avg Rebate Percentage 1116] [float] NULL,
	[API Brand Credits Disbursed 1116] [float] NULL,
	[API Accelerated Pay Discount 1116] [float] NULL,
	[API Generic Sales 1216] [float] NULL,
	[API Net Rebate to Store 1216] [float] NULL,
	[API Avg Rebate Percentage 1216] [float] NULL,
	[API Brand Credits Disbursed 1216] [float] NULL,
	[API Accelerated Pay Discount 1216] [float] NULL,
	[Total Monthly API Generic Sales 2016] [float] NULL,
	[Total Monthly API Net Rebate to Store 2016] [float] NULL,
	[Total Monthly API Brand Credits Disbursed 2016] [float] NULL,
	[Total Monthly API Accelerated Pay Discount 2016] [float] NULL,
	[True 10 Sales 0116] [float] NULL,
	[True 10 Rebate 0116] [float] NULL,
	[True 10 Sales 0216] [float] NULL,
	[True 10 Rebate 0216] [float] NULL,
	[True 10 Sales 0316] [float] NULL,
	[True 10 Rebate 0316] [float] NULL,
	[True 10 Sales 0416] [float] NULL,
	[True 10 Rebate 0416] [float] NULL,
	[True 10 Sales 0516] [float] NULL,
	[True 10 Rebate 0516] [float] NULL,
	[True 10 Sales 0616] [float] NULL,
	[True 10 Rebate 0616] [float] NULL,
	[True 10 Sales 0716] [float] NULL,
	[True 10 Rebate 0716] [float] NULL,
	[True 10 Sales 0816] [float] NULL,
	[True 10 Rebate 0816] [float] NULL,
	[True 10 Sales 0916] [float] NULL,
	[True 10 Rebate 0916] [float] NULL,
	[True 10 Sales 1016] [float] NULL,
	[True 10 Rebate 1016] [float] NULL,
	[True 10 Sales 1116] [float] NULL,
	[True 10 Rebate 1116] [float] NULL,
	[True 10 Sales 1216] [float] NULL,
	[True 10 Rebate 1216] [float] NULL,
	[Total True 10 Sales 2016] [float] NULL,
	[Total True 10 Rebate 2016] [float] NULL,
	[Arete-API Rebate 0316] [float] NULL,
	[Arete-API Rebate 0416] [float] NULL,
	[Arete-API Rebate 0516] [float] NULL,
	[Arete-API Rebate 0616] [float] NULL,
	[Arete-API Rebate 0716] [float] NULL,
	[Arete-API Rebate 0816] [float] NULL,
	[Arete-API Rebate 0916] [float] NULL,
	[Arete-API Rebate 1016] [float] NULL,
	[Arete-API Rebate 1116] [float] NULL,
	[Arete-API Rebate 1216] [float] NULL,
	[Arete-API Rebate 0117] [float] NULL,
	[Arete-API Rebate 0217] [float] NULL,
	[Total Arete-API Rebate 2016] [float] NULL,
	[Arete-AAP Rebate 0316] [float] NULL,
	[Arete-AAP Rebate 0416] [float] NULL,
	[Arete-AAP Rebate 0516] [float] NULL,
	[Arete-AAP Rebate 0616] [float] NULL,
	[Arete-AAP Rebate 0716] [float] NULL,
	[Arete-AAP Rebate 0816] [float] NULL,
	[Arete-AAP Rebate 0916] [float] NULL,
	[Arete-AAP Rebate 1016] [float] NULL,
	[Arete-AAP Rebate 1116] [float] NULL,
	[Arete-AAP Rebate 1216] [float] NULL,
	[Arete-AAP Rebate 0117] [float] NULL,
	[Arete-AAP Rebate 0217] [float] NULL,
	[Total Arete-AAP Rebate 2016] [float] NULL,
	[HV Incentive 0116] [float] NULL,
	[HV COG Reduction 0116] [float] NULL,
	[HV Incentive 0216] [float] NULL,
	[HV COG Reduction 0216] [float] NULL,
	[HV Incentive 0316] [float] NULL,
	[HV COG Reduction 0316] [float] NULL,
	[HV Incentive 0416] [float] NULL,
	[HV COG Reduction 0416] [float] NULL,
	[HV Incentive 0516] [float] NULL,
	[HV COG Reduction 0516] [float] NULL,
	[HV Incentive 0616] [float] NULL,
	[HV COG Reduction 0616] [float] NULL,
	[HV Incentive 0716] [float] NULL,
	[HV COG Reduction 0716] [float] NULL,
	[HV Incentive 0816] [float] NULL,
	[HV COG Reduction 0816] [float] NULL,
	[HV Incentive 0916] [float] NULL,
	[HV COG Reduction 0916] [float] NULL,
	[HV Incentive 1016] [float] NULL,
	[HV COG Reduction 1016] [float] NULL,
	[HV Incentive 1116] [float] NULL,
	[HV COG Reduction 1116] [float] NULL,
	[HV Incentive 1216] [float] NULL,
	[HV COG Reduction 1216] [float] NULL,
	[Total HV Incentive 2016] [float] NULL,
	[Conf Volume 0416] [float] NULL,
	[Conf Rebate 0416] [float] NULL,
	[Conf Volume 0516] [float] NULL,
	[Conf Rebate 0516] [float] NULL,
	[Total Conf Volume 2016] [float] NULL,
	[Total Conf Rebate 2016] [float] NULL,
	[Cardinal Rebates 2016Q1] [float] NULL,
	[Cardinal Rebates 2016Q2] [float] NULL,
	[Cardinal Rebates 2016Q3] [float] NULL,
	[Cardinal Rebates 2016Q4] [float] NULL,
	[Total Cardinal Rebates 2016] [float] NULL,
	[01/16 Source Sales] [float] NULL,
	[01/16 AAP Gen Rebate] [float] NULL,
	[01/16 Price Protection Rebate] [float] NULL,
	[01/16 COG Rebate] [float] NULL,
	[01/16 Avg%] [float] NULL,
	[01/16 HRTA%] [float] NULL,
	[01/16 PaymentMethod] [varchar](50) NULL,
	[02/16 Source Sales] [float] NULL,
	[02/16 AAP Gen Rebate] [float] NULL,
	[02/16 Price Protection Rebate] [float] NULL,
	[02/16 COG Rebate] [float] NULL,
	[02/16 Avg%] [float] NULL,
	[02/16 HRTA%] [float] NULL,
	[02/16 PaymentMethod] [varchar](50) NULL,
	[03/16 Source Sales] [float] NULL,
	[03/16 AAP Gen Rebate] [float] NULL,
	[03/16 Price Protection Rebate] [float] NULL,
	[03/16 COG Rebate] [float] NULL,
	[03/16 Avg%] [float] NULL,
	[03/16 HRTA%] [float] NULL,
	[03/16 PaymentMethod] [varchar](50) NULL,
	[04/16 Source Sales] [float] NULL,
	[04/16 AAP Gen Rebate] [float] NULL,
	[04/16 Price Protection Rebate] [float] NULL,
	[04/16 COG Rebate] [float] NULL,
	[04/16 Avg%] [float] NULL,
	[04/16 HRTA%] [float] NULL,
	[04/16 PaymentMethod] [varchar](50) NULL,
	[05/16 Source Sales] [float] NULL,
	[05/16 AAP Gen Rebate] [float] NULL,
	[05/16 Price Protection Rebate] [float] NULL,
	[05/16 COG Rebate] [float] NULL,
	[05/16 Avg%] [float] NULL,
	[05/16 HRTA%] [float] NULL,
	[05/16 PaymentMethod] [varchar](50) NULL,
	[06/16 Source Sales] [float] NULL,
	[06/16 AAP Gen Rebate] [float] NULL,
	[06/16 Price Protection Rebate] [float] NULL,
	[06/16 COG Rebate] [float] NULL,
	[06/16 Avg%] [float] NULL,
	[06/16 HRTA%] [float] NULL,
	[06/16 PaymentMethod] [varchar](50) NULL,
	[07/16 Source Sales] [float] NULL,
	[07/16 AAP Gen Rebate] [float] NULL,
	[07/16 Price Protection Rebate] [float] NULL,
	[07/16 COG Rebate] [float] NULL,
	[07/16 Avg%] [float] NULL,
	[07/16 HRTA%] [float] NULL,
	[07/16 PaymentMethod] [varchar](50) NULL,
	[08/16 Source Sales] [float] NULL,
	[08/16 AAP Gen Rebate] [float] NULL,
	[08/16 Price Protection Rebate] [float] NULL,
	[08/16 COG Rebate] [float] NULL,
	[08/16 Avg%] [float] NULL,
	[08/16 HRTA%] [float] NULL,
	[08/16 PaymentMethod] [varchar](50) NULL,
	[09/16 Source Sales] [float] NULL,
	[09/16 AAP Gen Rebate] [float] NULL,
	[09/16 Price Protection Rebate] [float] NULL,
	[09/16 COG Rebate] [float] NULL,
	[09/16 Avg%] [float] NULL,
	[09/16 HRTA%] [float] NULL,
	[09/16 PaymentMethod] [varchar](50) NULL,
	[10/16 Source Sales] [float] NULL,
	[10/16 AAP Gen Rebate] [float] NULL,
	[10/16 Price Protection Rebate] [float] NULL,
	[10/16 COG Rebate] [float] NULL,
	[10/16 Avg%] [float] NULL,
	[10/16 HRTA%] [float] NULL,
	[10/16 PaymentMethod] [varchar](50) NULL,
	[11/16 Source Sales] [float] NULL,
	[11/16 AAP Gen Rebate] [float] NULL,
	[11/16 Price Protection Rebate] [float] NULL,
	[11/16 COG Rebate] [float] NULL,
	[11/16 Avg%] [float] NULL,
	[11/16 HRTA%] [float] NULL,
	[11/16 PaymentMethod] [varchar](50) NULL,
	[12/16 Source Sales] [float] NULL,
	[12/16 AAP Gen Rebate] [float] NULL,
	[12/16 Price Protection Rebate] [float] NULL,
	[12/16 COG Rebate] [float] NULL,
	[12/16 Avg%] [float] NULL,
	[12/16 HRTA%] [float] NULL,
	[12/16 PaymentMethod] [varchar](50) NULL,
	[Total CH AAP Gen Rebate 2016] [float] NULL,
	[Total Price Protection Rebate 2016] [float] NULL,
	[Total COG Rebate 2016] [float] NULL,
	[Planogram Rebate 2016] [float] NULL,
	[API Generic Incentive 2016] [float] NULL,
	[AAP Patronage Dividend 2016] [float] NULL,
	[Total YTD All Rebates 2016] [float] NULL
) ON [PRIMARY]
GO
