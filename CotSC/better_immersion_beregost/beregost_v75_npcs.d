// CotSC v75 - last ambient Beregost dialogue additions.
// I_C_T3 lets independently optional companions speak even when earlier speakers are absent.

BEGIN BIBHLF75
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN EXIT
END

I_C_T3 BIBHLF75 0 QCBV75HALF
  == MONTAJ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @2
  == JAHEIJ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @3
  == MONTAJ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @4
  == KHALIJ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @5
END

BEGIN BIBKAV75
IF ~InParty("Kagain") InMyArea("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN BEGIN 0
  SAY @6
  IF ~~ THEN EXTERN KAGAIJ QCBV75K1
END
IF ~True()~ THEN BEGIN 1
  SAY @7
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN QCBV75KAVA2
  SAY @8
  IF ~~ THEN EXTERN KAGAIJ QCBV75K2
END

APPEND KAGAIJ
IF ~~ THEN BEGIN QCBV75K1
  SAY @9
  IF ~~ THEN EXTERN BIBKAV75 QCBV75KAVA2
END
IF ~~ THEN BEGIN QCBV75K2
  SAY @10
  IF ~~ THEN REPLY @11 GOTO QCBV75K3
END
IF ~~ THEN BEGIN QCBV75K3
  SAY @12
  IF ~~ THEN EXIT
END
END

BEGIN BIBWIN75
IF ~True()~ THEN BEGIN 0
  SAY @13
  ++ @14 + 1
  ++ @15 + 2
  ++ @16 + 3
END
IF ~~ THEN BEGIN 1
  SAY @17
  IF ~~ THEN DO ~GiveItemCreate("QCBWINE",Player1,1,0,0)~ EXIT
END
IF ~~ THEN BEGIN 2
  SAY @18
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN 3
  SAY @19
  IF ~~ THEN EXIT
END

I_C_T3 BIBWIN75 1 QCBV75WINE
  == MONTAJ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID) InParty("Xzar") InMyArea("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @20
  == XZARJ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID) InParty("Xzar") InMyArea("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @21
  == MONTAJ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID) InParty("Xzar") InMyArea("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @22
  == IMOEN2_ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @23
  == KHALIJ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @24
  == IMOEN2_ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @25
  == KHALIJ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @26
  == JAHEIJ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @27
  == IMOEN2_ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @28
END

BEGIN BIBBOY75
IF ~True()~ THEN BEGIN 0
  SAY @29
  IF ~~ THEN EXIT
END

I_C_T3 BIBBOY75 0 QCBV75BOY
  == VICONJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @30
  == KIVANJ IF ~InParty("Kivan") InMyArea("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN @31
  == BRANWJ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @32
END
