// ---------------------------------------------------------------------------
// PURPLE WYRM INN - UPSTAIRS NPCs
// ---------------------------------------------------------------------------

BEGIN PWYPATR

IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN REPLY @4 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN GOTO 3
  IF ~InParty("Dynaheir") InMyArea("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ PWY_PATR_DYNA
END

IF ~~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN EXIT
END

// Dynaheir interjection uses her joined-party dialogue resource, matching the working Alphyra implementation.
APPEND DYNAHJ
IF ~~ THEN BEGIN PWY_PATR_DYNA
  SAY @7
  IF ~~ THEN EXTERN PWYPATR 3
END
END

BEGIN PWYKOBUP
IF ~True()~ THEN BEGIN 0
  SAY @8
  IF ~~ THEN EXIT
END
