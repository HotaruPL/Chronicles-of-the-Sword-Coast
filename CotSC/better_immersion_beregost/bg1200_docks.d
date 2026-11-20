// ---------------------------------------------------------------------------
// BETTER IMMERSION FOR BALDUR'S GATE - BG1200 / Docks
// ---------------------------------------------------------------------------

BEGIN BIBPOR12
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN EXIT
END

BEGIN BIBKOB15
IF ~True()~ THEN BEGIN 0
  SAY @2
  IF ~~ THEN EXIT
END

BEGIN BIBDCK12
IF ~True()~ THEN BEGIN 0
  SAY @3
  IF ~~ THEN EXIT
END

BEGIN BIBDCK13
IF ~True()~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN EXIT
END

BEGIN BIBHOB14
IF ~True()~ THEN BEGIN 0
  SAY @5
  IF ~~ THEN EXIT
END

BEGIN BIBELF14
IF ~True()~ THEN BEGIN 0
  SAY @6
  IF ~~ THEN EXIT
END

BEGIN BIBELF15
IF ~True()~ THEN BEGIN 0
  SAY @7
  IF ~~ THEN EXIT
END

BEGIN BIBHOB15
IF ~True()~ THEN BEGIN 0
  SAY @8
  IF ~~ THEN EXIT
END

BEGIN BIBHAL15
IF ~True()~ THEN BEGIN 0
  SAY @9
  IF ~~ THEN EXIT
END

BEGIN BIBDWR14
IF ~True()~ THEN BEGIN 0
  SAY @10
  IF ~~ THEN EXIT
END

BEGIN BIBDCK14
IF ~True()~ THEN BEGIN 0
  SAY @11
  IF ~~ THEN EXIT
END

BEGIN BIBFFO02
IF ~True()~ THEN BEGIN 0
  SAY @12
  IF ~~ THEN EXIT
END

BEGIN BIBFFO03
IF ~True()~ THEN BEGIN 0
  SAY @13
  IF ~~ THEN EXIT
END

BEGIN BIBKOB16
IF ~True()~ THEN BEGIN 0
  SAY @14
  IF ~~ THEN EXIT
END

BEGIN BIBK17D1
IF ~True()~ THEN BEGIN 0
  SAY @15
  IF ~~ THEN EXIT
END

BEGIN BIBGIT12
IF ~True()~ THEN BEGIN 0
  SAY @16
  ++ @17 + 1
  ++ @18 + 2
  ++ @19 + 3
  ++ @20 + 4
END

IF ~~ THEN BEGIN 1
SAY @21
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
SAY @22
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 3
SAY @23
IF ~~ THEN DO ~Enemy() Attack(LastTalkedToBy(Myself))~ EXIT
END

IF ~~ THEN BEGIN 4
SAY @24
IF ~~ THEN EXIT
END

I_C_T3 BIBGIT12 0 BIBGITRX
  == KHALIJ IF ~InParty("Khalid")~ THEN @25
  == MINSCJ_ IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @26
  == KIVANJ IF ~InParty("Kivan")~ THEN @27
  == XANJ IF ~InParty("Xan")~ THEN @28
END

// ---------------------------------------------------------------------------
// v70: Two BG1200 civilians previously spawned with no compiled dialogue.
// ---------------------------------------------------------------------------

BEGIN BIBDWR15
IF ~True()~ THEN BEGIN 0
  SAY @29
  IF ~~ THEN EXIT
END

BEGIN BIBFFO04
IF ~True()~ THEN BEGIN 0
  SAY @30
  IF ~~ THEN EXIT
END
