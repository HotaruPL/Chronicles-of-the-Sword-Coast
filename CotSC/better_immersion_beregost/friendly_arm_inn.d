// ---------------------------------------------------------------------------
// BETTER IMMERSION FOR FRIENDLY ARM INN - DIALOGUES
// ---------------------------------------------------------------------------

BEGIN BIFATRV
IF ~True()~ THEN BEGIN 0
    SAY @1
    IF ~~ THEN EXIT
END

BEGIN BIFHAL01
IF ~True()~ THEN BEGIN 0
    SAY @2
    IF ~~ THEN EXIT
END

BEGIN BIFDWP01
IF ~True()~ THEN BEGIN 0
    SAY @3
    IF ~~ THEN EXIT
END

BEGIN BIFORC01
IF ~True()~ THEN BEGIN 0
    SAY @4
    IF ~~ THEN EXIT
END

BEGIN BIFELF01
IF ~Global("BIF_KIVAN_REWARD","GLOBAL",0)~ THEN BEGIN 0
    SAY @5
    IF ~InParty("Kivan") InMyArea("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QC37_FAI_KIVAN
    IF ~~ THEN EXIT
END

IF ~Global("BIF_KIVAN_REWARD","GLOBAL",1)~ THEN BEGIN 1
    SAY @6
    IF ~~ THEN EXIT
END

// Direct, party-guarded transition: the reply and reward cannot occur without Kivan.
APPEND ~KIVANJ~
IF ~~ THEN BEGIN QC37_FAI_KIVAN
  SAY @7
  IF ~~ THEN EXTERN BIFELF01 QC37_FAI_ELF_REPLY
END
END

APPEND ~BIFELF01~
IF ~~ THEN BEGIN QC37_FAI_ELF_REPLY
  SAY @8
  IF ~~ THEN DO ~SetGlobal("BIF_KIVAN_REWARD","GLOBAL",1) ActionOverride("Kivan",GiveItemCreate("POTN02",Myself,1,0,0))~ EXIT
END
END

BEGIN BIFFCOOK
IF ~True()~ THEN BEGIN 0
    SAY @9
    IF ~~ THEN EXIT
END

BEGIN BIFHAL02
IF ~True()~ THEN BEGIN 0
    SAY @10
    IF ~~ THEN EXIT
END

BEGIN BIFRAVOC
IF ~Global("BIF_RAVOC_TALKS","LOCALS",0)~ THEN BEGIN 0
    SAY @11
    IF ~~ THEN DO ~SetGlobal("BIF_RAVOC_TALKS","LOCALS",1)~ EXIT
END

IF ~Global("BIF_RAVOC_TALKS","LOCALS",1)~ THEN BEGIN 1
    SAY @12
    IF ~~ THEN DO ~SetGlobal("BIF_RAVOC_TALKS","LOCALS",2)~ EXIT
END

IF ~Global("BIF_RAVOC_TALKS","LOCALS",2)~ THEN BEGIN 2
    SAY @13
    IF ~~ THEN DO ~SetGlobal("BIF_RAVOC_TALKS","LOCALS",3) Enemy() Attack(LastTalkedToBy(Myself))~ EXIT
END

