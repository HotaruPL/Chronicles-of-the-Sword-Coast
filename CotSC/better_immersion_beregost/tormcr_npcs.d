// ---------------------------------------------------------------------------
// TORM'S HAND - TORMCR CAVERN NPC / ISAAC
// Stage 1: entrance, undead population, Isaac dialogue, party interjections.
// The later Asmodeus-symbol / Alma encounter is deliberately left untouched
// until this baseline is tested in-game.
// ---------------------------------------------------------------------------

BEGIN TCRISAC

// Normal first conversation.
IF ~Global("TCR_ISAAC_FINISHED","GLOBAL",0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 DO ~SetGlobal("TCR_ISAAC_INTRO1","GLOBAL",1)~ GOTO 1
  IF ~~ THEN REPLY @3 DO ~SetGlobal("TCR_ISAAC_INTRO2","GLOBAL",1)~ GOTO 2
  IF ~~ THEN REPLY @4 DO ~SetGlobal("TCR_ISAAC_INTRO3","GLOBAL",1)~ GOTO 8
END


// Player chose to threaten Isaac. He immediately becomes hostile and attacks.
IF ~~ THEN BEGIN 8
  SAY @5
  IF ~~ THEN DO ~SetGlobal("TCR_ISAAC_FINISHED","GLOBAL",1) Enemy() Attack(LastTalkedToBy(Myself))~ EXIT
END

// Player option 1.
IF ~~ THEN BEGIN 1
  SAY @6
  IF ~~ THEN GOTO 4
END

// Player option 2. Jaheira interjects here when she is present.
IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN GOTO 4
END

// The conversation continues after any of the introductory choices.
IF ~~ THEN BEGIN 4
  SAY @8
  IF ~Global("TCR_ISAAC_ALMA","GLOBAL",0)~ THEN REPLY @9 DO ~SetGlobal("TCR_ISAAC_ALMA","GLOBAL",1)~ GOTO 5
  IF ~Global("TCR_ISAAC_EXITS","GLOBAL",0)~ THEN REPLY @10 DO ~SetGlobal("TCR_ISAAC_EXITS","GLOBAL",1)~ GOTO 6
  IF ~Global("TCR_ISAAC_MISSING","GLOBAL",0)~ THEN REPLY @11 DO ~SetGlobal("TCR_ISAAC_MISSING","GLOBAL",1)~ GOTO 7
  IF ~Global("TCR_ISAAC_ALMA","GLOBAL",1) Global("TCR_ISAAC_EXITS","GLOBAL",1) Global("TCR_ISAAC_MISSING","GLOBAL",1)~ THEN GOTO 12
END

IF ~~ THEN BEGIN 5
  SAY @12
  IF ~Global("TCR_ISAAC_ALMA","GLOBAL",1) Global("TCR_ISAAC_EXITS","GLOBAL",1) Global("TCR_ISAAC_MISSING","GLOBAL",1)~ THEN GOTO 12
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 6
  SAY @13
  IF ~Global("TCR_ISAAC_ALMA","GLOBAL",1) Global("TCR_ISAAC_EXITS","GLOBAL",1) Global("TCR_ISAAC_MISSING","GLOBAL",1)~ THEN GOTO 12
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 7
  SAY @14
  IF ~Global("TCR_ISAAC_ALMA","GLOBAL",1) Global("TCR_ISAAC_EXITS","GLOBAL",1) Global("TCR_ISAAC_MISSING","GLOBAL",1)~ THEN GOTO 12
  IF ~~ THEN GOTO 4
END

// After the three investigative options have all been exhausted, Isaac gives his
// observation about the cavern population and presents the next player option.
IF ~Global("TCR_ISAAC_ALMA","GLOBAL",1) Global("TCR_ISAAC_EXITS","GLOBAL",1) Global("TCR_ISAAC_MISSING","GLOBAL",1)~ THEN BEGIN 12
  SAY @15
  IF ~~ THEN REPLY @16 GOTO 13
END

IF ~~ THEN BEGIN 13
  SAY @17
  IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN GOTO 15
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14
  SAY @18
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 15
  SAY @19
  IF ~~ THEN DO ~SetGlobal("TCR_ISAAC_FINISHED","GLOBAL",1) SetGlobal("TCR_ISAAC_WARNING","GLOBAL",1)~ EXIT
END

// After the complete conversation, future talks use only the brief warning.
IF ~Global("TCR_ISAAC_WARNING","GLOBAL",1)~ THEN BEGIN 16
  SAY @20
  IF ~~ THEN EXIT
END

// Party-member interjections are kept after the complete dialogue so WeiDU can
// apply them to the already-defined Isaac states without interrupting parsing.
INTERJECT_COPY_TRANS TCRISAC 2 TCR_ISAAC_JAHEIRA
  == ~JAHEIJ~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @21
  == ~TCRISAC~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @22
END

I_C_T3 ~TCRISAC~ 13 TCR_ISAAC_AJANTIS
  == ~AJANTJ~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @23
  == ~TCRISAC~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @24
END
