// ---------------------------------------------------------------------------
// BETTER IMMERSION FOR BALDUR'S GATE - BG1100
// ---------------------------------------------------------------------------

BEGIN BIKIRA
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 GOTO 3
  IF ~~ THEN REPLY @5 GOTO 4
END

IF ~~ THEN BEGIN 1
  SAY @6
  IF ~~ THEN DO ~TakePartyGold(5000) SetGlobal("BIB_KIRA_LEAVE","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN DO ~TakePartyGold(5000) SetGlobal("BIB_KIRA_LEAVE","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN DO ~Enemy() Attack(Player1)~ EXIT
END

IF ~~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN DO ~SetGlobal("BIB_KIRA_LEAVE","LOCALS",1)~ EXIT
END

BEGIN BIBORC11
IF ~True()~ THEN BEGIN 0
  SAY @10
  IF ~~ THEN EXIT
END

BEGIN BIBELF16
IF ~True()~ THEN BEGIN 0
  SAY @11
  IF ~~ THEN EXIT
END

BEGIN BIBDWR16
IF ~True()~ THEN BEGIN 0
  SAY @12
  IF ~~ THEN EXIT
END

BEGIN BIBHOB16
IF ~True()~ THEN BEGIN 0
  SAY @13
  IF ~~ THEN EXIT
END

BEGIN BIBHUM14
IF ~True()~ THEN BEGIN 0
  SAY @14
  IF ~~ THEN EXIT
END

BEGIN BIBKOB18
IF ~True()~ THEN BEGIN 0
  SAY @15
  IF ~~ THEN EXIT
END

BEGIN BIBGNM11
IF ~True()~ THEN BEGIN 0
  SAY @16
  IF ~~ THEN EXIT
END

INTERJECT_COPY_TRANS ~BIBGNM11~ 0 ~BIBGNM11T~
  == ~TIAXJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @17
  == ~MONTAJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID) InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @18
  == ~BIBGNM11~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @19
END

BEGIN BIBELF17
IF ~True()~ THEN BEGIN 0
  SAY @20
  IF ~~ THEN EXIT
END

BEGIN BIBHAL16
IF ~True()~ THEN BEGIN 0
  SAY @21
  IF ~~ THEN EXIT
END

BEGIN BIBGOB11
IF ~True()~ THEN BEGIN 0
  SAY @22
  IF ~~ THEN JOURNAL @23 EXIT
END

