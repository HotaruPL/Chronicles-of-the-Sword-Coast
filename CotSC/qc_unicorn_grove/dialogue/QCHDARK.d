// v13: continuous Dark Imoen / real Imoen CHAIN.
// The dialogue starts from Dark Imoen's own CRE and stays inside one dialogue.
 // Do not re-evaluate IsValidForPartyDialog during each speaker transition.
BEGIN ~QCHDARK~
IF ~Global("QCH_DARK_FIGHT","GLOBAL",0) !InParty("Imoen2") !InParty("Imoen")~ THEN BEGIN solo_greet
  SAY @1
  ++ @2 GOTO solo_lonely
  ++ @3 GOTO solo_unmasked
END
IF ~False()~ THEN BEGIN solo_lonely
  SAY @4
  IF ~~ THEN GOTO solo_seek
END
IF ~False()~ THEN BEGIN solo_seek
  SAY @5
  ++ @6 GOTO solo_unmasked
END
IF ~False()~ THEN BEGIN solo_unmasked
  SAY @7
  IF ~~ THEN DO ~SetGlobal("QCH_DARK_FIGHT","GLOBAL",1)~ EXIT
END

CHAIN IF ~Global("QCH_DARK_FIGHT","GLOBAL",0) InParty("Imoen2")~ THEN ~QCHDARK~ QCHDI_PARTY
  @8
  == ~IMOEN2J~
     @9
  == ~QCHDARK~
     @10
  == ~IMOEN2J~
     @11
  == ~QCHDARK~
     @12
  == ~IMOEN2J~
     @13
  == ~QCHDARK~
     @14
END
  IF ~~ THEN DO ~SetGlobal("QCH_DARK_FIGHT","GLOBAL",1)~ EXIT

// Initial-game Imoen has script name Imoen and joined DLG IMOENJ.
CHAIN IF ~Global("QCH_DARK_FIGHT","GLOBAL",0) InParty("Imoen") !InParty("Imoen2")~ THEN ~QCHDARK~ QCHDI_PARTY_EARLY
  @15
  == ~IMOENJ~
     @16
  == ~QCHDARK~
     @17
  == ~IMOENJ~
     @18
  == ~QCHDARK~
     @19
  == ~IMOENJ~
     @20
  == ~QCHDARK~
     @21
END
  IF ~~ THEN DO ~SetGlobal("QCH_DARK_FIGHT","GLOBAL",1)~ EXIT
