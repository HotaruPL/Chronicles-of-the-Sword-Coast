// ---------------------------------------------------------------------------
// TORM'S HAND - HOUSE RESIDENTS
// ---------------------------------------------------------------------------

BEGIN T48BFEMD
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN EXIT
END

BEGIN T48ADWRD
IF ~True()~ THEN BEGIN 0
  SAY @2
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @3
  IF ~~ THEN EXIT
END

// Safana's line is injected into the dwarf's opening state only when she is
// present and valid, then the conversation continues to the blush line.
INTERJECT T48ADWRD 0 T48ADWRD_SAFANA
  == SAFANJ IF ~InParty("Safana") InMyArea("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @4
END T48ADWRD 1

BEGIN T18FARMD
IF ~True()~ THEN BEGIN 0
  SAY @5
  IF ~~ THEN EXIT
END
