// ---------------------------------------------------------------------------
// VHAIDRA - ULUA QUEST
// ---------------------------------------------------------------------------

BEGIN PWYVHAI

// Viconia route: mirror Ulua's working entry structure exactly.
IF ~Global("PWY_ULUA_VHAIDRA_ACTIVE","GLOBAL",1) InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN BEGIN 0
  SAY @9054
  IF ~~ THEN EXTERN VICONJ PWY_VHAI_VIC1
END

// Normal route when Viconia is not present.
IF ~Global("PWY_ULUA_VHAIDRA_ACTIVE","GLOBAL",1) !InParty("Viconia")~ THEN BEGIN 1
  SAY @9055
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 2
  SAY @9056
  IF ~~ THEN EXTERN VICONJ PWY_VHAI_VIC2
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @9057
  ++ @9058 GOTO 5
  ++ @9059 GOTO 11
  ++ @9060 GOTO 8
END

IF ~~ THEN BEGIN 5
  SAY @9061
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @9062
  ++ @9063 GOTO 7
  ++ @9064 GOTO 12
END

IF ~~ THEN BEGIN 7
  SAY @9065
  IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ PWY_VHAI_VIC3
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 8
  SAY @9066
  IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ PWY_VHAI_VIC3
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9
  SAY @9067
  ++ @9068 GOTO 10
  ++ @9069 GOTO 13
END

IF ~~ THEN BEGIN 10
  SAY @9070
  IF ~~ THEN DO ~SetGlobal("PWY_VHAIDRA_REUNITED","GLOBAL",1) SetGlobal("PWY_ULUA_VHAIDRA_RESOLVED","GLOBAL",1) AddExperienceParty(1200) DestroySelf()~ SOLVED_JOURNAL @9011 EXIT
END

// Hostile branch from the first set of options. Vhaidra speaks first, then attacks.
IF ~~ THEN BEGIN 11
  SAY @9071
  IF ~~ THEN DO ~Enemy() Attack(LastTalkedToBy(Myself))~ EXIT
END

// Hostile branch from the second set of options. Vhaidra speaks first, then attacks.
IF ~~ THEN BEGIN 12
  SAY @9072
  IF ~~ THEN DO ~Enemy() Attack(LastTalkedToBy(Myself))~ EXIT
END

// Hostile branch from the final set of options. Vhaidra speaks first, then attacks.
IF ~~ THEN BEGIN 13
  SAY @9073
  IF ~~ THEN DO ~Enemy() Attack(LastTalkedToBy(Myself))~ EXIT
END

APPEND VICONJ
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_VHAI_VIC1
  SAY @9074
  IF ~~ THEN EXTERN PWYVHAI 2
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_VHAI_VIC2
  SAY @9075
  IF ~~ THEN EXTERN PWYVHAI 4
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_VHAI_VIC3
  SAY @9076
  IF ~~ THEN EXTERN PWYVHAI 9
END
END
