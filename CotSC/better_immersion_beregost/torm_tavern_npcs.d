// ---------------------------------------------------------------------------
// TORM'S HAND - SHRIVELED POTATO TAVERN NPCs
// ---------------------------------------------------------------------------

BEGIN BITBARTD
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("BIPOTATO",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @3 EXIT
END

BEGIN BITMALD
IF ~True()~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN EXIT
END

BEGIN BITFEMD
IF ~True()~ THEN BEGIN 0
  SAY @5
  IF ~~ THEN EXIT
END

BEGIN BITNYRDL
IF ~!Global("TCR_ALMA_DEAD","GLOBAL",1)~ THEN BEGIN 0
  SAY @6
  IF ~Global("BIT_NYR_Q1","GLOBAL",0)~ THEN REPLY @7 DO ~SetGlobal("BIT_NYR_Q1","GLOBAL",1)~ GOTO 10
  IF ~~ THEN REPLY @8 GOTO 20
  IF ~~ THEN REPLY @9 GOTO 21
END

IF ~~ THEN BEGIN 10
  SAY @10
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @11
  IF ~~ THEN GOTO 13
END

IF ~~ THEN BEGIN 13
  SAY @12
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14
  SAY @13
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 15
  SAY @14
  IF ~~ THEN REPLY @15 GOTO 20
  IF ~~ THEN REPLY @16 GOTO 21
END

IF ~~ THEN BEGIN 20
  SAY @17
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 21
  SAY @18
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// POST-ALMA NYRIEL - TORM'S FORTRESS REPLACEMENT
// ---------------------------------------------------------------------------
IF ~Global("TCR_ALMA_DEAD","GLOBAL",1) Global("TCR_NYR_POSTALMA","GLOBAL",0)~ THEN BEGIN 100
  SAY @19
  IF ~~ THEN DO ~SetGlobal("TCR_NYR_POSTALMA","GLOBAL",1)~ GOTO 101
END

IF ~Global("TCR_ALMA_DEAD","GLOBAL",1) Global("TCR_NYR_POSTALMA","GLOBAL",1) Global("TCR_NYR_REWARD_FIXED","GLOBAL",0) !Global("TCR_NYR_REWARDED","GLOBAL",1)~ THEN BEGIN 101
  SAY @20
  IF ~~ THEN DO ~SetGlobal("TCR_NYR_REWARD_FIXED","GLOBAL",1) SetGlobal("TCR_NYR_REWARDED","GLOBAL",1) AddExperienceParty(4000) GiveGoldForce(2000) GiveItemCreate("SCRL04",Player1,1,0,0) GiveItemCreate("SCRL07",Player1,1,0,0) GiveItemCreate("SCRL15",Player1,1,0,0)~ EXIT
END

IF ~Global("TCR_ALMA_DEAD","GLOBAL",1) Global("TCR_NYR_POSTALMA","GLOBAL",1) Global("TCR_NYR_REWARD_FIXED","GLOBAL",0) Global("TCR_NYR_REWARDED","GLOBAL",1)~ THEN BEGIN 102
  SAY @21
  IF ~~ THEN DO ~SetGlobal("TCR_NYR_REWARD_FIXED","GLOBAL",1) GiveGoldForce(2000) GiveItemCreate("SCRL04",Player1,1,0,0) GiveItemCreate("SCRL07",Player1,1,0,0) GiveItemCreate("SCRL15",Player1,1,0,0)~ EXIT
END

// Conditional Jaheira exchange is attached to Nyriel's state so the party
// member actually speaks, then the conversation returns to Nyriel.
I_C_T3 ~BITNYRDL~ 11 BIT_NYR_JAHEIRA
  == ~JAHEIJ~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @22
  == ~BITNYRDL~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @23
END

BEGIN BITBOUNC
IF ~True()~ THEN BEGIN 0
  SAY @24
  IF ~~ THEN REPLY @25 GOTO 1
  IF ~~ THEN REPLY @26 GOTO 4
END

IF ~~ THEN BEGIN 1
  SAY @27
  IF ~~ THEN REPLY @28 GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @29
  IF ~~ THEN REPLY @30 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @31
  IF ~~ THEN REPLY @32 EXIT
END

IF ~~ THEN BEGIN 4
  SAY @33
  IF ~~ THEN EXIT
END
