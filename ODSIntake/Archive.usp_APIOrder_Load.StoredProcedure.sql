USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Archive].[usp_APIOrder_Load]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Archive].[usp_APIOrder_Load]
AS

SET NOCOUNT ON;

BEGIN

INSERT INTO [Archive].[APIOrder]([IDINVN], [IDTYPP], [IDINYY], [IDORNO], [IDLINE], [IDIDAT], [IDCUNO], [IDPRDC], [IDDESC], [IDQTY], [IDDECC], [IDSQTY], [IDDECU], [IDUNIT], [IDDDAT], [IDDTIM], [IDSALP], 
								 [IDDCPR], [IDDCAM], [IDAMOU], [IDFOCC], [IDOVDC], [IDVAHC], [IDSHPM], [IDCONO], [IDRPRV], [IDTRTY], [IDCOSP], [IDPGRP], [IDPAGR], [IDPCA1], [IDPCA2], [IDPCA3], [IDPCA4], 
								 [IDPCA5], [IDPCA6], [IDCGRP], [IDCAGR], [IDCCA1], [IDCCA2], [IDCCA3], [IDDGRP], [IDCOUN], [IDAREA], [IDHAND], [IDSROM], [IDORDT], [IDSUPP], [IDODIS], [IDSALE], [IDNPRC], 
								 [IDEXR3], [IDSTRU], [IDRDTE], [IDRDTI], [IDTDCD], [IDDDCD], [IDPOTP], [IDPORN], [IDPLIN], [IDPCOD], [IDPERI], [IDSENC], [IDOLIN], [IDGWGT], [IDNWGT], [IDGVOL], [IDNVOL], 
								 [IDICNO], [IDSTCF], [IDSVCC], [IDAGMC], [IDTECN], [IDPTPE], [IDODAT], [IDNOTR], [IDPOVA], [IDCSNO], [IDOCOU], [IDNSVA], [IDDLBU], [IDCIPO], [IDIORD], [IDIOTY], [IDLCVA], 
								 [IDEDPC], [IDBTCC], [IDPODR], [IDPROD], [IDDENO], [IDDIS2], [IDDIS3], [IDDIS4], [IDDIS5], [IDDIS6], [IDDIS7], [IDDIS8], [IDDIS9], [IDITET], [IDITIT], [IDITT], [IDTAXF], 
								 [IDUPBA], [IDVATI], [IDLAOC], [IDVAOC], [IDTAXC], [IDTSRM], [IDCIOL], [IDCCOD], [IDHCOD], [IDLBCD], [IDNCCN], [IDPCKT], [IDREAS], [IDIVTP], [IDROCO], [IDAGMT], [IDPDGR], 
								 [IDINUM], [IDINLN], [IDQUNO], [IDVRNO], [IDQULN], [IDDECCH1], [IDDECCH2], [IDDECCH3], [IDDECCH4], [IDDECCH5], [IDDECCH6], [IDDECCH7], [IDDECCH8], [IDDECCH9], [IDDECCF1], 
								 [IDDECCF2], [IDDECCF3], [IDDECCF4], [IDDECCF5], [IDDECCUN], [IDDEDCUN], [IDDEPST1], [IDDEPST2], [IDDEPST3], [IDDEPST4], [IDDEPST5], [IDDEPST6], [IDDEPST7], [IDDEPST8], 
								 [IDDEPST9], [IDAMCF], [IDCPCF], [IDPPGR], [IDPRFA], [IDPRSE], [IDPROI], [IDPRPH], [IDPROL], [IDPLAN], [IDPRCL], [IDPRIL], [IDSOPR], [IDBOPR], [IDTXKY], [IDCPRD], [IDCPDS], 
								 [IDCSTS], [IDDIVN], [IDCOPO], [IDIS01], [IDIS02], [IDIS03], [IDIS04], [IDIS05], [IDIS06], [IDISPR], [IDAGTP], [IDJNBR], [IDOPRD], [IDOSEN], [IDRECQ], [IDREC1], [IDACQT], 
								 [IDACT1], [IDIREC], [IDPDDT], [IDPDRD], [IDDEBI], [IDRESP], [IDCCGR], [IDPCGR], [IDSPGR], [IDSDAG], [IDSDCA], [IDSATX], [IDPRME], [IDSHPA], [IDROUT], [IDDEST], [IDTPRC], 
								 [IDDLVD], [IDRDVD], [IDTRPT], [IDDEPA], [IDPCKD], [IDPTQT], [IDUSPUNT], [IDUSPCNV], [IDUSPQTY], [IDUSRRAQ], [IDUSRRUQ], [IDUSPRQY], [IDRBPR], [IDUSCURB], [IDUSPACU], [IDRPAB], 
								 [IDUSPSLN], [IDGTPE], [IDSHPG], [IDLTYP])
SELECT [IDINVN], [IDTYPP], [IDINYY], [IDORNO], [IDLINE], [IDIDAT], [IDCUNO], [IDPRDC], [IDDESC], [IDQTY], [IDDECC], [IDSQTY], [IDDECU], [IDUNIT], [IDDDAT], [IDDTIM], [IDSALP], 
	   [IDDCPR], [IDDCAM], [IDAMOU], [IDFOCC], [IDOVDC], [IDVAHC], [IDSHPM], [IDCONO], [IDRPRV], [IDTRTY], [IDCOSP], [IDPGRP], [IDPAGR], [IDPCA1], [IDPCA2], [IDPCA3], [IDPCA4], 
	   [IDPCA5], [IDPCA6], [IDCGRP], [IDCAGR], [IDCCA1], [IDCCA2], [IDCCA3], [IDDGRP], [IDCOUN], [IDAREA], [IDHAND], [IDSROM], [IDORDT], [IDSUPP], [IDODIS], [IDSALE], [IDNPRC], 
	   [IDEXR3], [IDSTRU], [IDRDTE], [IDRDTI], [IDTDCD], [IDDDCD], [IDPOTP], [IDPORN], [IDPLIN], [IDPCOD], [IDPERI], [IDSENC], [IDOLIN], [IDGWGT], [IDNWGT], [IDGVOL], [IDNVOL], 
	   [IDICNO], [IDSTCF], [IDSVCC], [IDAGMC], [IDTECN], [IDPTPE], [IDODAT], [IDNOTR], [IDPOVA], [IDCSNO], [IDOCOU], [IDNSVA], [IDDLBU], [IDCIPO], [IDIORD], [IDIOTY], [IDLCVA], 
	   [IDEDPC], [IDBTCC], [IDPODR], [IDPROD], [IDDENO], [IDDIS2], [IDDIS3], [IDDIS4], [IDDIS5], [IDDIS6], [IDDIS7], [IDDIS8], [IDDIS9], [IDITET], [IDITIT], [IDITT], [IDTAXF], 
	   [IDUPBA], [IDVATI], [IDLAOC], [IDVAOC], [IDTAXC], [IDTSRM], [IDCIOL], [IDCCOD], [IDHCOD], [IDLBCD], [IDNCCN], [IDPCKT], [IDREAS], [IDIVTP], [IDROCO], [IDAGMT], [IDPDGR], 
	   [IDINUM], [IDINLN], [IDQUNO], [IDVRNO], [IDQULN], [IDDECCH1], [IDDECCH2], [IDDECCH3], [IDDECCH4], [IDDECCH5], [IDDECCH6], [IDDECCH7], [IDDECCH8], [IDDECCH9], [IDDECCF1], 
	   [IDDECCF2], [IDDECCF3], [IDDECCF4], [IDDECCF5], [IDDECCUN], [IDDEDCUN], [IDDEPST1], [IDDEPST2], [IDDEPST3], [IDDEPST4], [IDDEPST5], [IDDEPST6], [IDDEPST7], [IDDEPST8], 
	   [IDDEPST9], [IDAMCF], [IDCPCF], [IDPPGR], [IDPRFA], [IDPRSE], [IDPROI], [IDPRPH], [IDPROL], [IDPLAN], [IDPRCL], [IDPRIL], [IDSOPR], [IDBOPR], [IDTXKY], [IDCPRD], [IDCPDS], 
	   [IDCSTS], [IDDIVN], [IDCOPO], [IDIS01], [IDIS02], [IDIS03], [IDIS04], [IDIS05], [IDIS06], [IDISPR], [IDAGTP], [IDJNBR], [IDOPRD], [IDOSEN], [IDRECQ], [IDREC1], [IDACQT], 
	   [IDACT1], [IDIREC], [IDPDDT], [IDPDRD], [IDDEBI], [IDRESP], [IDCCGR], [IDPCGR], [IDSPGR], [IDSDAG], [IDSDCA], [IDSATX], [IDPRME], [IDSHPA], [IDROUT], [IDDEST], [IDTPRC], 
	   [IDDLVD], [IDRDVD], [IDTRPT], [IDDEPA], [IDPCKD], [IDPTQT], [IDUSPUNT], [IDUSPCNV], [IDUSPQTY], [IDUSRRAQ], [IDUSRRUQ], [IDUSPRQY], [IDRBPR], [IDUSCURB], [IDUSPACU], [IDRPAB], 
	   [IDUSPSLN], [IDGTPE], [IDSHPG], [IDLTYP]
FROM [Staging].[APIOrder]

END
GO
