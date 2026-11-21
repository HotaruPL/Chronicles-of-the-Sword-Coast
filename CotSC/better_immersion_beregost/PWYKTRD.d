// ---------------------------------------------------------------------------
// KAEIRA - RED FANG MARAUDERS WILDERNESS SITE
// ---------------------------------------------------------------------------

BEGIN PWYKTRD
IF ~Global("PWY_KAEIRA_COMPLETED","GLOBAL",0) Global("PWY_KAEIRA_WILDERNESS_INTRO","GLOBAL",0)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN DO ~SetGlobal("PWY_KAEIRA_WILDERNESS_INTRO","GLOBAL",1)~ EXIT
END

IF ~Global("PWY_KAEIRA_COMPLETED","GLOBAL",0) Global("PWY_KAEIRA_WILDERNESS_INTRO","GLOBAL",1)~ THEN BEGIN 1
  SAY @2
  IF ~Dead("PWYREDQ") PartyHasItem("PWYSPICE")~ THEN REPLY @3 GOTO 2
  IF ~~ THEN REPLY @4 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN REPLY @6 DO ~TakePartyItem("PWYSPICE") AddExperienceParty(500) GivePartyGold(400) SetGlobal("PWY_KAEIRA_COMPLETED","GLOBAL",1) SetGlobal("PWY_KAEIRA_RETURN","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @7 EXIT
END

