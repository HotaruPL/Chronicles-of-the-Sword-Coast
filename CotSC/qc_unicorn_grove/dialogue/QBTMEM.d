// QCBTEM ritual memory: single continuous encounter with real party actors.
BEGIN ~QBTALIA~
IF ~False()~ THEN BEGIN dormant
  SAY @1
  IF ~~ THEN EXIT
END
BEGIN ~QBTGEHR~
IF ~False()~ THEN BEGIN dormant
  SAY @2
  IF ~~ THEN EXIT
END
BEGIN ~QBTGOR~
IF ~False()~ THEN BEGIN dormant
  SAY @3
  IF ~~ THEN EXIT
END
BEGIN ~QBTMADE~
IF ~False()~ THEN BEGIN dormant
  SAY @4
  IF ~~ THEN EXIT
END

// Opening dialogue, no actor becomes hostile while speaking.
CHAIN IF ~Global("QBT_STAGE","GLOBAL",0)~ THEN ~QBTALIA~ INTRO
  @5
  == ~QBTGEHR~ @6
  == ~QBTALIA~ @7
  == ~QBTGOR~ @8
  == ~QBTALIA~ @9
  == ~QBTGOR~ @10
  == ~QBTALIA~ @11
END
  IF ~IsValidForPartyDialog("Jaheira")~ THEN REPLY @12 EXTERN ~JAHEIRAJ~ JA_STAGE
  IF ~!IsValidForPartyDialog("Jaheira") InParty("Imoen2")~ THEN REPLY @13 EXTERN ~IMOEN2J~ IMO_STAGE
  IF ~!IsValidForPartyDialog("Jaheira") InParty("Imoen") !InParty("Imoen2")~ THEN REPLY @14 EXTERN ~IMOENJ~ IMO_STAGE_EARLY
  IF ~!IsValidForPartyDialog("Jaheira") !InParty("Imoen2") !InParty("Imoen")~ THEN REPLY @15 EXTERN ~QBTGOR~ FINISH

// After the player speaks, Jaheira can recognise the discrepancy.
CHAIN ~JAHEIRAJ~ JA_STAGE
  @16
END
  IF ~~ THEN REPLY @17 EXTERN ~JAHEIRAJ~ JA_REPLY

CHAIN ~JAHEIRAJ~ JA_REPLY
  @18
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Jan")~ THEN @19
  == ~JANJ~ IF ~IsValidForPartyDialog("Jan")~ THEN @20
END
  IF ~InParty("Imoen2")~ THEN EXTERN ~IMOEN2J~ IMO_STAGE
  IF ~InParty("Imoen") !InParty("Imoen2")~ THEN EXTERN ~IMOENJ~ IMO_STAGE_EARLY
  IF ~!InParty("Imoen2") !InParty("Imoen")~ THEN EXTERN ~QBTGOR~ FINISH

CHAIN ~IMOEN2J~ IMO_STAGE
  @21
END
  IF ~~ THEN REPLY @22 EXTERN ~IMOEN2J~ IMO_REPLY

CHAIN ~IMOEN2J~ IMO_REPLY
  @23
  = ~At first I thought it was one of his tricks, that he was trying to show me something... I don't think it was his doing. I saw this temple through someone else's eyes. That boy... I saw it through his eyes. He's standing in precisely the same spot from which I watched these events in my visions.~
  == ~KELDORJ~ IF ~IsValidForPartyDialog("Keldorn")~ THEN @24
END ~QBTGOR~ FINISH

// Freshly started-game Imoen variant; same lines, correct joined dialogue.
CHAIN ~IMOENJ~ IMO_STAGE_EARLY
  @25
END
  IF ~~ THEN REPLY @26 EXTERN ~IMOENJ~ IMO_REPLY_EARLY

CHAIN ~IMOENJ~ IMO_REPLY_EARLY
  @27
  = ~At first I thought it was one of his tricks, that he was trying to show me something... I don't think it was his doing. I saw this temple through someone else's eyes. That boy... I saw it through his eyes. He's standing in precisely the same spot from which I watched these events in my visions.~
  == ~KELDORJ~ IF ~IsValidForPartyDialog("Keldorn")~ THEN @28
END ~QBTGOR~ FINISH

// The fight flag is set only on the last response.
CHAIN ~QBTGOR~ FINISH
  @29
  == ~QBTMADE~ @30
  == ~QBTALIA~ @31
  == ~QBTGOR~ @32
END
  IF ~~ THEN DO ~SetGlobal("QBT_STAGE","GLOBAL",1)~ EXIT
