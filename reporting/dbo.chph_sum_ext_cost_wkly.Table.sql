USE [reporting]
GO
/****** Object:  Table [dbo].[chph_sum_ext_cost_wkly]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_sum_ext_cost_wkly](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[YEAR] [int] NOT NULL,
	[STORE] [varchar](50) NOT NULL,
	[WEEK_1_RX] [float] NULL,
	[WEEK_1_OTC] [float] NULL,
	[WEEK_2_RX] [float] NULL,
	[WEEK_2_OTC] [float] NULL,
	[WEEK_3_RX] [float] NULL,
	[WEEK_3_OTC] [float] NULL,
	[WEEK_4_RX] [float] NULL,
	[WEEK_4_OTC] [float] NULL,
	[WEEK_5_RX] [float] NULL,
	[WEEK_5_OTC] [float] NULL,
	[WEEK_6_RX] [float] NULL,
	[WEEK_6_OTC] [float] NULL,
	[WEEK_7_RX] [float] NULL,
	[WEEK_7_OTC] [float] NULL,
	[WEEK_8_RX] [float] NULL,
	[WEEK_8_OTC] [float] NULL,
	[WEEK_9_RX] [float] NULL,
	[WEEK_9_OTC] [float] NULL,
	[WEEK_10_RX] [float] NULL,
	[WEEK_10_OTC] [float] NULL,
	[WEEK_11_RX] [float] NULL,
	[WEEK_11_OTC] [float] NULL,
	[WEEK_12_RX] [float] NULL,
	[WEEK_12_OTC] [float] NULL,
	[WEEK_13_RX] [float] NULL,
	[WEEK_13_OTC] [float] NULL,
	[WEEK_14_RX] [float] NULL,
	[WEEK_14_OTC] [float] NULL,
	[WEEK_15_RX] [float] NULL,
	[WEEK_15_OTC] [float] NULL,
	[WEEK_16_RX] [float] NULL,
	[WEEK_16_OTC] [float] NULL,
	[WEEK_17_RX] [float] NULL,
	[WEEK_17_OTC] [float] NULL,
	[WEEK_18_RX] [float] NULL,
	[WEEK_18_OTC] [float] NULL,
	[WEEK_19_RX] [float] NULL,
	[WEEK_19_OTC] [float] NULL,
	[WEEK_20_RX] [float] NULL,
	[WEEK_20_OTC] [float] NULL,
	[WEEK_21_RX] [float] NULL,
	[WEEK_21_OTC] [float] NULL,
	[WEEK_22_RX] [float] NULL,
	[WEEK_22_OTC] [float] NULL,
	[WEEK_23_RX] [float] NULL,
	[WEEK_23_OTC] [float] NULL,
	[WEEK_24_RX] [float] NULL,
	[WEEK_24_OTC] [float] NULL,
	[WEEK_25_RX] [float] NULL,
	[WEEK_25_OTC] [float] NULL,
	[WEEK_26_RX] [float] NULL,
	[WEEK_26_OTC] [float] NULL,
	[WEEK_27_RX] [float] NULL,
	[WEEK_27_OTC] [float] NULL,
	[WEEK_28_RX] [float] NULL,
	[WEEK_28_OTC] [float] NULL,
	[WEEK_29_RX] [float] NULL,
	[WEEK_29_OTC] [float] NULL,
	[WEEK_30_RX] [float] NULL,
	[WEEK_30_OTC] [float] NULL,
	[WEEK_31_RX] [float] NULL,
	[WEEK_31_OTC] [float] NULL,
	[WEEK_32_RX] [float] NULL,
	[WEEK_32_OTC] [float] NULL,
	[WEEK_33_RX] [float] NULL,
	[WEEK_33_OTC] [float] NULL,
	[WEEK_34_RX] [float] NULL,
	[WEEK_34_OTC] [float] NULL,
	[WEEK_35_RX] [float] NULL,
	[WEEK_35_OTC] [float] NULL,
	[WEEK_36_RX] [float] NULL,
	[WEEK_36_OTC] [float] NULL,
	[WEEK_37_RX] [float] NULL,
	[WEEK_37_OTC] [float] NULL,
	[WEEK_38_RX] [float] NULL,
	[WEEK_38_OTC] [float] NULL,
	[WEEK_39_RX] [float] NULL,
	[WEEK_39_OTC] [float] NULL,
	[WEEK_40_RX] [float] NULL,
	[WEEK_40_OTC] [float] NULL,
	[WEEK_41_RX] [float] NULL,
	[WEEK_41_OTC] [float] NULL,
	[WEEK_42_RX] [float] NULL,
	[WEEK_42_OTC] [float] NULL,
	[WEEK_43_RX] [float] NULL,
	[WEEK_43_OTC] [float] NULL,
	[WEEK_44_RX] [float] NULL,
	[WEEK_44_OTC] [float] NULL,
	[WEEK_45_RX] [float] NULL,
	[WEEK_45_OTC] [float] NULL,
	[WEEK_46_RX] [float] NULL,
	[WEEK_46_OTC] [float] NULL,
	[WEEK_47_RX] [float] NULL,
	[WEEK_47_OTC] [float] NULL,
	[WEEK_48_RX] [float] NULL,
	[WEEK_48_OTC] [float] NULL,
	[WEEK_49_RX] [float] NULL,
	[WEEK_49_OTC] [float] NULL,
	[WEEK_50_RX] [float] NULL,
	[WEEK_50_OTC] [float] NULL,
	[WEEK_51_RX] [float] NULL,
	[WEEK_51_OTC] [float] NULL,
	[WEEK_52_RX] [float] NULL,
	[WEEK_52_OTC] [float] NULL,
	[WEEK_53_RX] [float] NULL,
	[WEEK_53_OTC] [float] NULL,
	[WEEK_54_RX] [float] NULL,
	[WEEK_54_OTC] [float] NULL,
 CONSTRAINT [PK_chph_sum_ext_cost_wkly] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_1_RX]  DEFAULT ((0)) FOR [WEEK_1_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_1_OTC]  DEFAULT ((0)) FOR [WEEK_1_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_2_RX]  DEFAULT ((0)) FOR [WEEK_2_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_2_OTC]  DEFAULT ((0)) FOR [WEEK_2_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_3_RX]  DEFAULT ((0)) FOR [WEEK_3_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_3_OTC]  DEFAULT ((0)) FOR [WEEK_3_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_4_RX]  DEFAULT ((0)) FOR [WEEK_4_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_4_OTC]  DEFAULT ((0)) FOR [WEEK_4_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_5_RX]  DEFAULT ((0)) FOR [WEEK_5_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_5_OTC]  DEFAULT ((0)) FOR [WEEK_5_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_6_RX]  DEFAULT ((0)) FOR [WEEK_6_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_6_OTC]  DEFAULT ((0)) FOR [WEEK_6_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_7_RX]  DEFAULT ((0)) FOR [WEEK_7_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_7_OTC]  DEFAULT ((0)) FOR [WEEK_7_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_8_RX]  DEFAULT ((0)) FOR [WEEK_8_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_8_OTC]  DEFAULT ((0)) FOR [WEEK_8_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_9_RX]  DEFAULT ((0)) FOR [WEEK_9_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_9_OTC]  DEFAULT ((0)) FOR [WEEK_9_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_10_RX]  DEFAULT ((0)) FOR [WEEK_10_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_10_OTC]  DEFAULT ((0)) FOR [WEEK_10_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_11_RX]  DEFAULT ((0)) FOR [WEEK_11_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_11_OTC]  DEFAULT ((0)) FOR [WEEK_11_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_12_RX]  DEFAULT ((0)) FOR [WEEK_12_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_12_OTC]  DEFAULT ((0)) FOR [WEEK_12_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_13_RX]  DEFAULT ((0)) FOR [WEEK_13_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_13_OTC]  DEFAULT ((0)) FOR [WEEK_13_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_14_RX]  DEFAULT ((0)) FOR [WEEK_14_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_14_OTC]  DEFAULT ((0)) FOR [WEEK_14_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_15_RX]  DEFAULT ((0)) FOR [WEEK_15_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_15_OTC]  DEFAULT ((0)) FOR [WEEK_15_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_16_RX]  DEFAULT ((0)) FOR [WEEK_16_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_16_OTC]  DEFAULT ((0)) FOR [WEEK_16_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_17_RX]  DEFAULT ((0)) FOR [WEEK_17_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_17_OTC]  DEFAULT ((0)) FOR [WEEK_17_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_18_RX]  DEFAULT ((0)) FOR [WEEK_18_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_18_OTC]  DEFAULT ((0)) FOR [WEEK_18_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_19_RX]  DEFAULT ((0)) FOR [WEEK_19_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_19_OTC]  DEFAULT ((0)) FOR [WEEK_19_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_20_RX]  DEFAULT ((0)) FOR [WEEK_20_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_20_OTC]  DEFAULT ((0)) FOR [WEEK_20_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_21_RX]  DEFAULT ((0)) FOR [WEEK_21_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_21_OTC]  DEFAULT ((0)) FOR [WEEK_21_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_22_RX]  DEFAULT ((0)) FOR [WEEK_22_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_22_OTC]  DEFAULT ((0)) FOR [WEEK_22_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_23_RX]  DEFAULT ((0)) FOR [WEEK_23_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_23_OTC]  DEFAULT ((0)) FOR [WEEK_23_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_24_RX]  DEFAULT ((0)) FOR [WEEK_24_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_24_OTC]  DEFAULT ((0)) FOR [WEEK_24_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_25_RX]  DEFAULT ((0)) FOR [WEEK_25_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_25_OTC]  DEFAULT ((0)) FOR [WEEK_25_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_26_RX]  DEFAULT ((0)) FOR [WEEK_26_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_26_OTC]  DEFAULT ((0)) FOR [WEEK_26_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_27_RX]  DEFAULT ((0)) FOR [WEEK_27_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_27_OTC]  DEFAULT ((0)) FOR [WEEK_27_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_28_RX]  DEFAULT ((0)) FOR [WEEK_28_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_28_OTC]  DEFAULT ((0)) FOR [WEEK_28_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_29_RX]  DEFAULT ((0)) FOR [WEEK_29_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_29_OTC]  DEFAULT ((0)) FOR [WEEK_29_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_30_RX]  DEFAULT ((0)) FOR [WEEK_30_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_30_OTC]  DEFAULT ((0)) FOR [WEEK_30_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_31_RX]  DEFAULT ((0)) FOR [WEEK_31_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_31_OTC]  DEFAULT ((0)) FOR [WEEK_31_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_32_RX]  DEFAULT ((0)) FOR [WEEK_32_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_32_OTC]  DEFAULT ((0)) FOR [WEEK_32_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_33_RX]  DEFAULT ((0)) FOR [WEEK_33_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_33_OTC]  DEFAULT ((0)) FOR [WEEK_33_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_34_RX]  DEFAULT ((0)) FOR [WEEK_34_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_34_OTC]  DEFAULT ((0)) FOR [WEEK_34_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_35_RX]  DEFAULT ((0)) FOR [WEEK_35_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_35_OTC]  DEFAULT ((0)) FOR [WEEK_35_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_36_RX]  DEFAULT ((0)) FOR [WEEK_36_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_36_OTC]  DEFAULT ((0)) FOR [WEEK_36_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_37_RX]  DEFAULT ((0)) FOR [WEEK_37_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_37_OTC]  DEFAULT ((0)) FOR [WEEK_37_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_38_RX]  DEFAULT ((0)) FOR [WEEK_38_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_38_OTC]  DEFAULT ((0)) FOR [WEEK_38_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_39_RX]  DEFAULT ((0)) FOR [WEEK_39_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_39_OTC]  DEFAULT ((0)) FOR [WEEK_39_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_40_RX]  DEFAULT ((0)) FOR [WEEK_40_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_40_OTC]  DEFAULT ((0)) FOR [WEEK_40_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_41_RX]  DEFAULT ((0)) FOR [WEEK_41_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_41_OTC]  DEFAULT ((0)) FOR [WEEK_41_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_42_RX]  DEFAULT ((0)) FOR [WEEK_42_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_42_OTC]  DEFAULT ((0)) FOR [WEEK_42_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_43_RX]  DEFAULT ((0)) FOR [WEEK_43_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_43_OTC]  DEFAULT ((0)) FOR [WEEK_43_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_44_RX]  DEFAULT ((0)) FOR [WEEK_44_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_44_OTC]  DEFAULT ((0)) FOR [WEEK_44_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_45_RX]  DEFAULT ((0)) FOR [WEEK_45_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_45_OTC]  DEFAULT ((0)) FOR [WEEK_45_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_46_RX]  DEFAULT ((0)) FOR [WEEK_46_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_46_OTC]  DEFAULT ((0)) FOR [WEEK_46_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_47_RX]  DEFAULT ((0)) FOR [WEEK_47_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_47_OTC]  DEFAULT ((0)) FOR [WEEK_47_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_48_RX]  DEFAULT ((0)) FOR [WEEK_48_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_48_OTC]  DEFAULT ((0)) FOR [WEEK_48_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_49_RX]  DEFAULT ((0)) FOR [WEEK_49_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_49_OTC]  DEFAULT ((0)) FOR [WEEK_49_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_50_RX]  DEFAULT ((0)) FOR [WEEK_50_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_50_OTC]  DEFAULT ((0)) FOR [WEEK_50_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_51_RX]  DEFAULT ((0)) FOR [WEEK_51_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_51_OTC]  DEFAULT ((0)) FOR [WEEK_51_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_52_RX]  DEFAULT ((0)) FOR [WEEK_52_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_52_OTC]  DEFAULT ((0)) FOR [WEEK_52_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_53_RX]  DEFAULT ((0)) FOR [WEEK_53_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_53_OTC]  DEFAULT ((0)) FOR [WEEK_53_OTC]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_54_RX]  DEFAULT ((0)) FOR [WEEK_54_RX]
GO
ALTER TABLE [dbo].[chph_sum_ext_cost_wkly] ADD  CONSTRAINT [DF_chph_sum_ext_cost_wkly_WEEK_54_OTC]  DEFAULT ((0)) FOR [WEEK_54_OTC]
GO
