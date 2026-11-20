BEGIN BICGRD01
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN EXIT
END

BEGIN BICGRD02
IF ~True()~ THEN BEGIN 0
  SAY @2
  IF ~~ THEN EXIT
END

BEGIN BICGRD03
IF ~True()~ THEN BEGIN 0
  SAY @3
  IF ~~ THEN EXIT
END

BEGIN BICGRD04
IF ~True()~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN EXIT
END

BEGIN BICGRD05
IF ~True()~ THEN BEGIN 0
  SAY @5
  IF ~~ THEN EXIT
END

BEGIN BICHALF1
IF ~True()~ THEN BEGIN 0
  SAY @6
  IF ~~ THEN EXIT
END

BEGIN BICORC01
IF ~True()~ THEN BEGIN 0
  SAY @7
  IF ~~ THEN EXIT
END

BEGIN BICHALF2
IF ~True()~ THEN BEGIN 0
  SAY @8
  IF ~~ THEN EXIT
END

BEGIN BICSLVR
IF ~Global("BIC_STATUE_REACT","GLOBAL",1) !Global("BIC_STATUE_DONE","GLOBAL",1)~ THEN BEGIN 1
  SAY @9
  IF ~~ THEN EXTERN BRANWJ BIC_STATUE_BRANWEN
END

IF ~!Global("BIC_STATUE_REACT","GLOBAL",1) !Global("BIC_STATUE_DONE","GLOBAL",1)~ THEN BEGIN 0
  SAY @10
  IF ~~ THEN EXIT
END

IF ~Global("BIC_STATUE_REACT","GLOBAL",1) !Global("BIC_STATUE_DONE","GLOBAL",1)~ THEN BEGIN BIC_STATUE_REPLY
  SAY @11
  IF ~~ THEN DO ~ActionOverride("Branwen",GiveItemCreate("SCRL5B",Myself,1,0,0)) SetGlobal("BIC_STATUE_DONE","GLOBAL",1) SetGlobal("BIC_STATUE_REACT","GLOBAL",0)~ EXIT
END

APPEND ~BRANWJ~
IF ~~ THEN BEGIN BIC_STATUE_BRANWEN
  SAY @12
  IF ~~ THEN EXTERN BICSLVR BIC_STATUE_REPLY
END
END


// Fire Eater: all eligible party members speak in one continuous chain.
// Imoen's player choices are handled by Imoen, not spoken by the performer.
BEGIN BICFIRE1
IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN BEGIN 0
  SAY @13
  IF ~~ THEN EXTERN ~IMOEN2_~ QC41_FIR_IMOEN
END

// Without Imoen, the full conditional companion chain starts directly below.

APPEND ~IMOEN2_~
IF ~~ THEN BEGIN QC41_FIR_IMOEN
  SAY @14
  IF ~~ THEN REPLY @15 EXTERN ~IMOEN2_~ QC41_FIR_AFTER_IMOEN
  IF ~~ THEN REPLY @16 EXTERN ~IMOEN2_~ QC41_FIR_AFTER_IMOEN
END
END

CHAIN ~IMOEN2_~ QC41_FIR_AFTER_IMOEN
  @17
  == ~EDWINJ_~ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN
    @18
  == ~MINSCJ_~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN
    @19
  == ~BICFIRE1~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN
    @20
  == ~ALORAJ~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN
    @21
  == ~BRANWJ~ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN
    @22
  == ~NEERAJ_~ IF ~InParty("Neera") InMyArea("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN
    @23
  == ~XZARJ~ IF ~InParty("Xzar") InMyArea("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN
    @24
EXIT

CHAIN IF ~!InParty("Imoen2")~ THEN ~BICFIRE1~ QC41_FIR_NO_IMOEN
  @25
  == ~MINSCJ_~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN
    @26
  == ~BICFIRE1~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN
    @27
  == ~ALORAJ~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN
    @28
  == ~BRANWJ~ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN
    @29
  == ~NEERAJ_~ IF ~InParty("Neera") InMyArea("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN
    @30
  == ~XZARJ~ IF ~InParty("Xzar") InMyArea("Xzar") !StateCheck("Xzar",CD_STATE_NOTVALID)~ THEN
    @31
EXIT

BEGIN BICWLF01
IF ~True()~ THEN BEGIN 0
  SAY @32
  ++ @33 + 1
  ++ @34 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @35
  IF ~~ THEN EXIT
END

BEGIN BICOGRE1
IF ~True()~ THEN BEGIN 0
  SAY @36
  IF ~~ THEN EXIT
END

BEGIN BICFATM1
IF ~True()~ THEN BEGIN 0
  SAY @37
  IF ~~ THEN EXIT
END
