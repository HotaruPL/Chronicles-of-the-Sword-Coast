// ---------------------------------------------------------------------------
// ULUA - Purple Wyrm Inn
// Quest dialogue is only available when Viconia is in the party.
// ---------------------------------------------------------------------------

BEGIN PWYULUA

IF ~Global("PWY_ULUA_REFUSED","LOCALS",1)~ THEN BEGIN 900
  SAY @9012
  IF ~~ THEN EXIT
END

// Quest already accepted: avoid replaying the Viconia introduction.
IF ~Global("PWY_ULUA_VHAIDRA_ACTIVE","GLOBAL",1) Global("PWY_VHAIDRA_KILLED","GLOBAL",0)~ THEN BEGIN 901
  SAY @9013
  IF ~~ THEN EXIT
END

IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) !Global("PWY_VHAIDRA_KILLED","GLOBAL",1)~ THEN BEGIN 0
  SAY @9014
  IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ PWY_ULUA_VIC1
  IF ~~ THEN EXIT
END

IF ~!InParty("Viconia")~ THEN BEGIN 10
  SAY @9015
  ++ @9016 GOTO 11
  ++ @9017 GOTO 12
  ++ @9018 EXIT
END

IF ~~ THEN BEGIN 11
  SAY @9019
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 12
  SAY @9020
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// Viconia route
// ---------------------------------------------------------------------------

IF ~~ THEN BEGIN 20
  SAY @9021
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC2
END

IF ~~ THEN BEGIN 21
  SAY @9022
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC3
END

IF ~~ THEN BEGIN 22
  SAY @9023
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC4
END

IF ~~ THEN BEGIN 23
  SAY @9024
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC5
END

IF ~~ THEN BEGIN 24
  SAY @9025
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC6
END

IF ~~ THEN BEGIN 25
  SAY @9026
  IF ~~ THEN GOTO 30
END

IF ~~ THEN BEGIN 30
  SAY @9027
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC7
END

IF ~~ THEN BEGIN 31
  SAY @9028
  IF ~~ THEN GOTO 32
END

IF ~~ THEN BEGIN 32
  SAY @9029
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC8
END

IF ~~ THEN BEGIN 33
  SAY @9030
  IF ~~ THEN GOTO 34
END

IF ~~ THEN BEGIN 34
  SAY @9031
  IF ~~ THEN GOTO 35
END

IF ~~ THEN BEGIN 35
  SAY @9032
  ++ @9033 DO ~SetGlobal("PWY_ULUA_VHAIDRA_ACTIVE","GLOBAL",1)~ UNSOLVED_JOURNAL @9010 GOTO 40
  ++ @9034 GOTO 41
  ++ @9035 GOTO 42
  ++ @9036 GOTO 43
END

IF ~~ THEN BEGIN 40
  SAY @9037
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 41
  SAY @9038
  IF ~~ THEN DO ~SetGlobal("PWY_ULUA_REFUSED","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 42
  SAY ~~
  IF ~~ THEN EXTERN VICONJ PWY_ULUA_VIC9
END

IF ~~ THEN BEGIN 43
  SAY @9039
  ++ @9040 GOTO 44
END

IF ~~ THEN BEGIN 44
  SAY @9041
  IF ~~ THEN DO ~SetGlobal("PWY_ULUA_REFUSED","LOCALS",1)~ EXIT
END



// ---------------------------------------------------------------------------
// VHAIDRA QUEST - RETURN AFTER VHAIDRA IS KILLED
// ---------------------------------------------------------------------------
// This is a separate follow-up state. Existing Ulua dialogue and all existing
// Viconia interjections above remain otherwise unchanged.

IF ~Global("PWY_VHAIDRA_KILLED","GLOBAL",1)~ THEN BEGIN 1
  SAY @9042
  IF ~~ THEN REPLY @9043 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @9044
  IF ~~ THEN DO ~SetGlobal("PWY_ULUA_VHAIDRA_RESOLVED","GLOBAL",1) MoveToPoint([1215.1278]) DestroySelf()~ SOLVED_JOURNAL @9011 EXIT
END

// ---------------------------------------------------------------------------
// VICONIA INTERJECTIONS
// ---------------------------------------------------------------------------

APPEND VICONJ
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC1
  SAY @9045
  IF ~~ THEN EXTERN PWYULUA 20
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC2
  SAY @9046
  IF ~~ THEN EXTERN PWYULUA 21
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC3
  SAY @9047
  IF ~~ THEN EXTERN PWYULUA 22
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC4
  SAY @9048
  IF ~~ THEN EXTERN PWYULUA 23
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC5
  SAY @9049
  IF ~~ THEN EXTERN PWYULUA 24
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC6
  SAY @9050
  IF ~~ THEN EXTERN PWYULUA 25
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC7
  SAY @9051
  IF ~~ THEN EXTERN PWYULUA 31
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC8
  SAY @9052
  IF ~~ THEN EXTERN PWYULUA 33
END
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_ULUA_VIC9
  SAY @9053
  IF ~~ THEN EXTERN PWYULUA 35
END
END
