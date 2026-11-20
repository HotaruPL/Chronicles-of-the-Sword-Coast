BEGIN QCFMANTC

IF ~Global("QCFMantDead","GLOBAL",0) Global("QCFMantSpared","GLOBAL",1)~ THEN BEGIN SPARED_AGAIN
  SAY @1
  IF ~~ THEN REPLY @2 EXTERN QCFMANTC FINAL_KILL
  IF ~~ THEN REPLY @3 EXIT
END

IF ~Global("QCFMantDead","GLOBAL",0) Global("QCFMantSpared","GLOBAL",0)~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN REPLY @5 DO ~SetGlobal("QCFMantIntro","GLOBAL",1)~ EXTERN QCFMANTC INTRO_KIND
  IF ~~ THEN REPLY @6 DO ~SetGlobal("QCFMantIntro","GLOBAL",1)~ EXTERN QCFMANTC INTRO_CHAINS
END

IF ~~ THEN BEGIN WHY_CHAINS
  SAY @7
  IF ~~ THEN REPLY @8 EXTERN QCFMANTC MAGIC_TUNNELS
  IF ~~ THEN REPLY @9 EXTERN QCFMANTC HELP
END

IF ~~ THEN BEGIN REFUSE_KILL
  SAY @10
  IF ~~ THEN REPLY @11 EXTERN QCFMANTC FINAL_KILL
  IF ~~ THEN REPLY @12 DO ~SetGlobal("QCFMantSpared","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN FINAL_KILL
  SAY @13
  IF ~~ THEN DO ~SetGlobal("QCFMantDead","GLOBAL",1) AddExperienceParty(1200) GiveItemCreate("QCFMHIDE",Player1,1,0,0) DestroySelf()~ EXIT
END

CHAIN QCFMANTC INTRO_KIND
@14
  == DYNAHJ IF ~InParty("Dynaheir") InMyArea("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @15
  == BRANWJ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @16
  == CORANJ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @17
  == AJANTJ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @18
  == EDWINJ_ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @19
  == FALDOJ IF ~InParty("Faldorn") InMyArea("Faldorn") !StateCheck("Faldorn",CD_STATE_NOTVALID)~ THEN @20
  == GARRIJ IF ~InParty("Garrick") InMyArea("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN @21
  == JAHEIJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @22
  == KHALIJ IF ~InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @23
  == TIAXJ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @24
  == XZARJ IF ~InParty("Xzar") InMyArea("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @25
  == NEERAJ_ IF ~InParty("Neera") InMyArea("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN @26
  == RASAADJ_ IF ~InParty("Rasaad") InMyArea("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)~ THEN @27
  == IMOEN2_ IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @28
  == QCFMANTC @29
  == QCFMANTC @30
END
  IF ~~ THEN REPLY @31 EXTERN QCFMANTC WHY_CHAINS
  IF ~~ THEN REPLY @32 EXTERN QCFMANTC MAGIC_TUNNELS
  IF ~~ THEN REPLY @33 EXTERN QCFMANTC HELP

CHAIN QCFMANTC INTRO_CHAINS
@34
  == DYNAHJ IF ~InParty("Dynaheir") InMyArea("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @35
  == BRANWJ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @36
  == CORANJ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @37
  == AJANTJ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @38
  == EDWINJ_ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @39
  == FALDOJ IF ~InParty("Faldorn") InMyArea("Faldorn") !StateCheck("Faldorn",CD_STATE_NOTVALID)~ THEN @40
  == GARRIJ IF ~InParty("Garrick") InMyArea("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN @41
  == JAHEIJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @42
  == KHALIJ IF ~InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @43
  == TIAXJ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @44
  == XZARJ IF ~InParty("Xzar") InMyArea("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN @45
  == NEERAJ_ IF ~InParty("Neera") InMyArea("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN @46
  == RASAADJ_ IF ~InParty("Rasaad") InMyArea("Rasaad") !StateCheck("Rasaad",CD_STATE_NOTVALID)~ THEN @47
  == IMOEN2_ IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @48
  == QCFMANTC @49
  == QCFMANTC @50
END
  IF ~~ THEN REPLY @51 EXTERN QCFMANTC WHY_CHAINS
  IF ~~ THEN REPLY @52 EXTERN QCFMANTC MAGIC_TUNNELS
  IF ~~ THEN REPLY @53 EXTERN QCFMANTC HELP

CHAIN QCFMANTC MAGIC_TUNNELS
@54
  == QCFMANTC @55
END
  IF ~~ THEN REPLY @56 EXTERN QCFMANTC TUNNEL_PURPOSE
  IF ~~ THEN REPLY @57 EXTERN QCFMANTC HELP

CHAIN QCFMANTC TUNNEL_PURPOSE
@58
  == QCFMANTC @59
  == DYNAHJ IF ~InParty("Dynaheir") InMyArea("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @60
  == QCFMANTC @61
END
  IF ~~ THEN REPLY @62 EXTERN QCFMANTC WHY_CHAINS
  IF ~~ THEN REPLY @63 EXTERN QCFMANTC HELP

CHAIN QCFMANTC HELP
@64
  == AJANTJ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @65
  == QCFMANTC @66
  == JAHEIJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @67
  == QCFMANTC @68
END
  IF ~~ THEN REPLY @69 EXTERN QCFMANTC AGREE_KILL
  IF ~~ THEN REPLY @70 EXTERN QCFMANTC REFUSE_KILL

CHAIN QCFMANTC AGREE_KILL
@71
  == QCFMANTC @72
  == FALDOJ IF ~InParty("Faldorn") InMyArea("Faldorn") !StateCheck("Faldorn",CD_STATE_NOTVALID)~ THEN @73
END
  IF ~~ THEN REPLY @74 EXTERN QCFMANTC FINAL_KILL
  IF ~~ THEN REPLY @75 DO ~SetGlobal("QCFMantSpared","GLOBAL",1)~ EXIT
