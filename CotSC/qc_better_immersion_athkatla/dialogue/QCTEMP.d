// ---------------------------------------------------------------------------
// Better immersion for Athkatla - Temple District pass
// AR0900 + AR0902. All added resources use QC prefixes.
// ---------------------------------------------------------------------------

BEGIN QC90GNOL
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("QC90AerGnoll","GLOBAL",1)~ EXTERN AERIEJ QC90_AER_G1
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @2
  IF ~~ THEN EXTERN AERIEJ QC90_AER_G2
END

IF ~~ THEN BEGIN 2
  SAY @3
  IF ~~ THEN EXTERN AERIEJ QC90_AER_G3
END

IF ~~ THEN BEGIN 3
  SAY @4
  IF ~~ THEN EXTERN AERIEJ QC90_AER_G4
END

BEGIN QC90RUDE
IF ~Global("QC90PettyGone","GLOBAL",0)~ THEN BEGIN 0
  SAY @5
  IF ~IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("QC90KorRude","GLOBAL",1)~ EXTERN KORGANJ QC90_KOR_R1
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @6
  IF ~~ THEN DO ~SetGlobal("QC90KorRude","GLOBAL",0) SetGlobal("QC90PettyGone","GLOBAL",1) EscapeArea()~ EXIT
END

BEGIN QC90KOB
IF ~Global("QC90PettyGone","GLOBAL",0)~ THEN BEGIN 0
  SAY @7
  IF ~~ THEN EXIT
END

IF ~Global("QC90PettyGone","GLOBAL",1)~ THEN BEGIN 1
  SAY @8
  IF ~~ THEN EXIT
END

BEGIN QC90DWAR
IF ~~ THEN BEGIN 1
  SAY @9
  IF ~~ THEN DO ~TakePartyGold(100) ReputationInc(1) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @10
  IF ~~ THEN DO ~EscapeArea()~ EXIT
END

CHAIN
  IF ~True()~ THEN QC90DWAR QC90_D_START
  @11
  == AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @12
  == KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @13
  == NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @14
  == JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @15
END
  IF ~PartyGoldGT(99)~ THEN REPLY @16 EXTERN QC90DWAR 1
  IF ~~ THEN REPLY @17 EXTERN QC90DWAR 2

BEGIN QC92VAND
IF ~True()~ THEN BEGIN 0
  SAY @18
  ++ @19 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @20
  IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("QC92KelVand","GLOBAL",1)~ EXTERN KELDORJ QC92_KEL_V1
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY @21
  IF ~~ THEN DO ~SetGlobal("QC92KelVand","GLOBAL",0)~ EXIT
END

// Explicit guarded BG2 companion states.
APPEND AERIEJ
IF WEIGHT #-1 ~Global("QC90AerGnoll","GLOBAL",1) IsValidForPartyDialog("Aerie")~ THEN BEGIN QC90_AER_G1
  SAY @22
  IF ~~ THEN EXTERN QC90GNOL 1
END

IF WEIGHT #-1 ~Global("QC90AerGnoll","GLOBAL",1) IsValidForPartyDialog("Aerie")~ THEN BEGIN QC90_AER_G2
  SAY @23
  IF ~~ THEN EXTERN QC90GNOL 2
END

IF WEIGHT #-1 ~Global("QC90AerGnoll","GLOBAL",1) IsValidForPartyDialog("Aerie")~ THEN BEGIN QC90_AER_G3
  SAY @24
  IF ~~ THEN EXTERN QC90GNOL 3
END

IF WEIGHT #-1 ~Global("QC90AerGnoll","GLOBAL",1) IsValidForPartyDialog("Aerie")~ THEN BEGIN QC90_AER_G4
  SAY @25
  IF ~~ THEN DO ~SetGlobal("QC90AerGnoll","GLOBAL",0)~ EXIT
END
END

APPEND KORGANJ
IF WEIGHT #-1 ~Global("QC90KorRude","GLOBAL",1) IsValidForPartyDialog("Korgan")~ THEN BEGIN QC90_KOR_R1
  SAY @26
  IF ~~ THEN EXTERN QC90RUDE 1
END
END

APPEND KELDORJ
IF WEIGHT #-1 ~Global("QC92KelVand","GLOBAL",1) IsValidForPartyDialog("Keldorn")~ THEN BEGIN QC92_KEL_V1
  SAY @27
  IF ~~ THEN EXTERN QC92VAND 2
END
END
