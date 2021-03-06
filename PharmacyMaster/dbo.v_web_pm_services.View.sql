USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_web_pm_services]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_web_pm_services]
as
select
PMID,
case when DiabetesEducatorCertified=1 then 'Yes' else 'No' end as [Diabetes Educator - Certified],
case when DiabetesEducatorNonCertified=1 then 'Yes' else 'No' end as [Diabetes Educator - Not Certified],
case when HypertensionTesting=1 then 'Yes' else 'No' end as [Hypertension Testing],
case when AsthmaServices=1 then 'Yes' else 'No' end as [Asthma Services],
case when CholesterolServices=1 then 'Yes' else 'No' end as [Cholesterol Services],
case when CompoundingLevel1thru3=1 then 'Yes' else 'No' end as [Compounding - Level 1 thru 3],
case when CompoundingLevel4Sterile=1 then 'Yes' else 'No' end as [Compounding - Level 4 Sterile],
case when DMELight=1 then 'Yes' else 'No' end as [DME - Light],
case when DMEHeavy=1 then 'Yes' else 'No' end as [DME - Heavy],
case when DMEAccreditedPharmacy=1 then 'Yes' else 'No' end as [DME - Accredited Pharmacy],
case when Contracted340BSelfAdministered=1 then 'Yes' else 'No' end as [340B - Contracted Self-administered],
case when Contracted340BThirdPartyAdministered=1 then 'Yes' else 'No' end as [340B - Contracted Third-party Administered],
Contracted340BExplain as [340B - Administered By],
case when ImmunizationsFLUVaccines=1 then 'Yes' else 'No' end as [Immunizations - Flu Vaccines],
case when ImmunizationsTravelVaccines=1 then 'Yes' else 'No' end as [Immunizations - Travel Vaccines],
ImmunizationsOtherExplain as [Immunizations - Other],
case when WeightLossClinics=1 then 'Yes' else 'No' end as [Weight Loss Clinics],
case when NutritionServices=1 then 'Yes' else 'No' end as [Nutrition Services],
case when OtherRetirementCommunities=1 then 'Yes' else 'No' end as [Service Retirement Communities],
case when OtherAssistedLivingFacilities=1 then 'Yes' else 'No' end as [Service Assisted Living Facilities],
case when OtherHospiceCenters=1 then 'Yes' else 'No' end as [Service Hospice Centers],
case when OtherSkilledNursingFacilities=1 then 'Yes' else 'No' end as [Service Skilled Nursing Facilities],
case when DeliveryServicesNoCharge=1 then 'Yes' else 'No' end as [Delivery Services - No Charge],
case when DeliveryServicesChargeFee=1 then 'Yes' else 'No' end as [Delivery Services - Charge Fee]
FROM         dbo.PM_ServicesSurvey
GO
