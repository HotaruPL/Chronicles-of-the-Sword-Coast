// ---------------------------------------------------------------------------
// BETTER IMMERSION FOR BALDUR'S GATE - BG0600
// ---------------------------------------------------------------------------

BEGIN BIBELF18
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN EXIT
END

BEGIN BIBHUM15
IF ~True()~ THEN BEGIN 0
  SAY @2
  IF ~~ THEN EXIT
END

BEGIN BIBHAL17
IF ~True()~ THEN BEGIN 0
  SAY @3
  IF ~~ THEN EXIT
END

BEGIN BIBORC12
IF ~True()~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN EXIT
END

BEGIN BIBORC13
IF ~True()~ THEN BEGIN 0
  SAY @5
  IF ~~ THEN EXIT
END

BEGIN BIBKOB20
IF ~True()~ THEN BEGIN 0
  SAY @6
  IF ~~ THEN REPLY @7 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @8
  IF ~~ THEN EXIT
END

BEGIN BIBDWR17
IF ~True()~ THEN BEGIN 0
  SAY @9
  IF ~~ THEN EXIT
END

// Human baker diagnostic NPC.  The dialogue itself is deliberately simple.
// The Dorn exchange is implemented directly in the baker's dialogue and by
// appending two states to DORNJ_.  This avoids EXTEND_TOP/APPEND on a newly
// created dialogue resource.
BEGIN BIBBAK01
IF ~True()~ THEN BEGIN 0
  SAY @10
  IF ~InParty("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID) Global("BIB_DORN_BAKER_DONE","GLOBAL",0)~ THEN EXTERN DORNJ_ BIB_DORN_BAKER_1
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN BIB_DORN_BAKER_2
  SAY @11
  IF ~~ THEN EXTERN DORNJ_ BIB_DORN_BAKER_3
END

IF ~~ THEN BEGIN BIB_DORN_BAKER_4
  SAY @12
  IF ~~ THEN DO ~SetGlobal("BIB_DORN_BAKER_DONE","GLOBAL",1) SetGlobal("BIB_BAKER_BG0600_LEAVE","LOCALS",1)~ EXIT
END

// Dorn's side of the exchange.  DORNJ_ is an existing game dialogue, so APPEND
// is valid here; the baker's own states are defined directly in BEGIN above.
APPEND DORNJ_
IF ~~ THEN BEGIN BIB_DORN_BAKER_1
  SAY @13
  IF ~~ THEN EXTERN BIBBAK01 BIB_DORN_BAKER_2
END

IF ~~ THEN BEGIN BIB_DORN_BAKER_3
  SAY @14
  IF ~~ THEN EXTERN BIBBAK01 BIB_DORN_BAKER_4
END
END
