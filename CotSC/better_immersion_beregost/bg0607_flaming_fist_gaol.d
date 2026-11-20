// ---------------------------------------------------------------------------
// BETTER IMMERSION FOR FLAMING FIST GAOL - BG0607
// ---------------------------------------------------------------------------

BEGIN BIBDRO07
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN EXIT
END

// Viconia's full exchange. I_C_T3 is used so that every conditional line is
// independent, while the final passback returns control to the drow/original state.
I_C_T3 ~BIBDRO07~ 0 BIB_DROW0607_REACTIONS
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @2
  == ~BIBDRO07~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @3
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @4
  == ~BIBDRO07~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @5
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @6
  == ~BIBDRO07~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @7
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @8
  == ~KIVANJ~ IF ~InParty("Kivan") InMyArea("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN @9
  == ~AJANTJ~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @10
  == DORNJ_ IF ~IsValidForPartyDialog("Dorn")~ THEN @11
  == ~ALORAJ~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN @12
  == ~BIBDRO07~ @13
END

BEGIN BIBHCON7
IF ~True()~ THEN BEGIN 0
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 1
  IF ~~ THEN REPLY @16 GOTO 2
  IF ~~ THEN REPLY @17 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @18
  IF ~~ THEN GOTO 0
END

IF ~~ THEN BEGIN 2
  SAY @19
  IF ~~ THEN GOTO 0
END


// ---------------------------------------------------------------------------
// KOBOLD COMMONER - BG1114
// ---------------------------------------------------------------------------

BEGIN BIBKOB19
IF ~True()~ THEN BEGIN 0
  SAY @20
  IF ~~ THEN REPLY @21 GOTO 1
  IF ~~ THEN REPLY @22 GOTO 2
END
IF ~~ THEN BEGIN 1
  SAY @23
  IF ~~ THEN DO ~SetGlobal("QC37KobBye","LOCALS",1)~ EXIT
END
IF ~~ THEN BEGIN 2
  SAY @24
  IF ~~ THEN DO ~SetGlobal("QC37KobBye","LOCALS",1)~ EXIT
END
