// ---------------------------------------------------------------------------
// Better immersion for Athkatla - Graveyard District pass
// AR0800. All added resources use QC prefixes.
// ---------------------------------------------------------------------------

BEGIN QCGSUI
IF ~Global("QC80Suicide","GLOBAL",0)~ THEN BEGIN START
  SAY @1
  ++ @2 GOTO EXPLAIN1
  ++ @3 GOTO WALKAWAY
END

IF ~~ THEN BEGIN EXPLAIN1
  SAY @4
  IF ~~ THEN GOTO EXPLAIN2
END

IF ~~ THEN BEGIN EXPLAIN2
  SAY @5
  IF ~IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("QC80JahSuicide","GLOBAL",1)~ EXTERN JAHEIRAJ QC80_JAH_SUI
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY @6 GOTO HELPSTART
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN REPLY @7 GOTO DONTINTERFERE
END

IF ~~ THEN BEGIN WALKAWAY
  SAY @8
  IF ~~ THEN DO ~SetGlobal("QC80Suicide","GLOBAL",3) Kill(Myself)~ EXIT
END

IF ~~ THEN BEGIN DONTINTERFERE
  SAY @9
  IF ~~ THEN DO ~SetGlobal("QC80Suicide","GLOBAL",3) Kill(Myself)~ EXIT
END

IF ~~ THEN BEGIN HELPSTART
  SAY @10
  IF ~CheckStatLT(Player1,16,CHR)~ THEN REPLY @11 GOTO CHARFAIL
  IF ~CheckStatGT(Player1,15,CHR)~ THEN REPLY @12 GOTO CHARSUCCESS
  IF ~IsValidForPartyDialog("Keldorn")~ THEN REPLY @13 DO ~SetGlobal("QC80KelSuicide","GLOBAL",1)~ EXTERN KELDORJ QC80_KEL_SUI1
  IF ~IsValidForPartyDialog("Hexxat")~ THEN REPLY @14 DO ~SetGlobal("QC80HexSuicide","GLOBAL",1)~ EXTERN HEXXATJ QC80_HEX_SUI1
  IF ~IsValidForPartyDialog("HaerDalis")~ THEN REPLY @15 DO ~SetGlobal("QC80HaerSuicide","GLOBAL",1)~ EXTERN HAERDAJ QC80_HAE_SUI1
  IF ~IsValidForPartyDialog("Dorn")~ THEN REPLY @16 DO ~SetGlobal("QC80DornSuicide","GLOBAL",1)~ EXTERN DORNJ QC80_DOR_SUI1
END

IF ~~ THEN BEGIN CHARFAIL
  SAY @17
  IF ~~ THEN DO ~SetGlobal("QC80Suicide","GLOBAL",3) Kill(Myself)~ EXIT
END

IF ~~ THEN BEGIN CHARSUCCESS
  SAY @18
  ++ @19 GOTO KIND_SUCCESS
  ++ @20 GOTO GRIM_SUCCESS
  ++ @21 GOTO CRUEL_FAIL
END

IF ~~ THEN BEGIN KIND_SUCCESS
  SAY @22
  IF ~~ THEN DO ~SetGlobal("QC80Suicide","GLOBAL",2) AddExperienceParty(7000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN GRIM_SUCCESS
  SAY @23
  IF ~~ THEN DO ~SetGlobal("QC80Suicide","GLOBAL",2) AddExperienceParty(7000) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN CRUEL_FAIL
  SAY @24
  IF ~~ THEN DO ~SetGlobal("QC80Suicide","GLOBAL",3) Kill(Myself)~ EXIT
END

// Keldorn route return states.
IF ~~ THEN BEGIN KEL_REPLY
  SAY @25
  IF ~~ THEN EXTERN KELDORJ QC80_KEL_SUI2
END

IF ~~ THEN BEGIN KEL_SUCCESS
  SAY @26
  IF ~~ THEN DO ~SetGlobal("QC80KelSuicide","GLOBAL",0) SetGlobal("QC80Suicide","GLOBAL",2) AddExperienceParty(7000) EscapeArea()~ EXIT
END

// Hexxat route return state.
IF ~~ THEN BEGIN HEX_PANIC
  SAY @27
  IF ~~ THEN DO ~SetGlobal("QC80Suicide","GLOBAL",3)~ EXTERN HEXXATJ QC80_HEX_SUI2
END

// Haer'Dalis route return states.
IF ~~ THEN BEGIN HAE_REPLY
  SAY @28
  IF ~~ THEN EXTERN HAERDAJ QC80_HAE_SUI2
END

IF ~~ THEN BEGIN HAE_SUCCESS
  SAY @29
  IF ~~ THEN DO ~SetGlobal("QC80HaerSuicide","GLOBAL",0) SetGlobal("QC80Suicide","GLOBAL",2) AddExperienceParty(7000) EscapeArea()~ EXIT
END

// Dorn route return states.
IF ~~ THEN BEGIN DOR_REPLY1
  SAY @30
  IF ~~ THEN EXTERN DORNJ QC80_DOR_SUI2
END

IF ~~ THEN BEGIN DOR_REPLY2
  SAY @31
  IF ~~ THEN EXTERN DORNJ QC80_DOR_SUI3
END

BEGIN QCGMOUR
IF ~True()~ THEN BEGIN 0
  SAY @32
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// Guarded BG2 companion states.  Each can only be entered from QCGSUI.
// ---------------------------------------------------------------------------
APPEND JAHEIRAJ
IF WEIGHT #-1 ~Global("QC80JahSuicide","GLOBAL",1) IsValidForPartyDialog("Jaheira")~ THEN BEGIN QC80_JAH_SUI
  SAY @33
  IF ~~ THEN REPLY @34 DO ~SetGlobal("QC80JahSuicide","GLOBAL",0)~ EXTERN QCGSUI HELPSTART
  IF ~~ THEN REPLY @35 DO ~SetGlobal("QC80JahSuicide","GLOBAL",0)~ EXTERN QCGSUI DONTINTERFERE
END
END

APPEND KELDORJ
IF WEIGHT #-1 ~Global("QC80KelSuicide","GLOBAL",1) IsValidForPartyDialog("Keldorn")~ THEN BEGIN QC80_KEL_SUI1
  SAY @36
  IF ~~ THEN EXTERN QCGSUI KEL_REPLY
END

IF WEIGHT #-1 ~Global("QC80KelSuicide","GLOBAL",1) IsValidForPartyDialog("Keldorn")~ THEN BEGIN QC80_KEL_SUI2
  SAY @37
  IF ~~ THEN EXTERN QCGSUI KEL_SUCCESS
END
END

APPEND HEXXATJ
IF WEIGHT #-1 ~Global("QC80HexSuicide","GLOBAL",1) IsValidForPartyDialog("Hexxat")~ THEN BEGIN QC80_HEX_SUI1
  SAY @38
  IF ~~ THEN EXTERN QCGSUI HEX_PANIC
END

IF WEIGHT #-1 ~Global("QC80HexSuicide","GLOBAL",1) IsValidForPartyDialog("Hexxat")~ THEN BEGIN QC80_HEX_SUI2
  SAY @39
  IF ~~ THEN DO ~SetGlobal("QC80HexSuicide","GLOBAL",0) ActionOverride("QCGSUI",Kill(Myself))~ EXIT
END
END

APPEND HAERDAJ
IF WEIGHT #-1 ~Global("QC80HaerSuicide","GLOBAL",1) IsValidForPartyDialog("HaerDalis")~ THEN BEGIN QC80_HAE_SUI1
  SAY @40
  IF ~~ THEN EXTERN QCGSUI HAE_REPLY
END

IF WEIGHT #-1 ~Global("QC80HaerSuicide","GLOBAL",1) IsValidForPartyDialog("HaerDalis")~ THEN BEGIN QC80_HAE_SUI2
  SAY @41
  IF ~~ THEN EXTERN QCGSUI HAE_SUCCESS
END
END

APPEND DORNJ
IF WEIGHT #-1 ~Global("QC80DornSuicide","GLOBAL",1) IsValidForPartyDialog("Dorn")~ THEN BEGIN QC80_DOR_SUI1
  SAY @42
  IF ~~ THEN EXTERN QCGSUI DOR_REPLY1
END

IF WEIGHT #-1 ~Global("QC80DornSuicide","GLOBAL",1) IsValidForPartyDialog("Dorn")~ THEN BEGIN QC80_DOR_SUI2
  SAY @43
  IF ~~ THEN EXTERN QCGSUI DOR_REPLY2
END

IF WEIGHT #-1 ~Global("QC80DornSuicide","GLOBAL",1) IsValidForPartyDialog("Dorn")~ THEN BEGIN QC80_DOR_SUI3
  SAY @44
  IF ~~ THEN DO ~SetGlobal("QC80DornSuicide","GLOBAL",0) SetGlobal("QC80Suicide","GLOBAL",2) AddExperienceParty(7000) ActionOverride("QCGSUI",EscapeArea())~ EXIT
END
END
