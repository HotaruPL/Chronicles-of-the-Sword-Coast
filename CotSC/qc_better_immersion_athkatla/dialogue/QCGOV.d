// ---------------------------------------------------------------------------
// Better immersion for Athkatla - Government District / prison / Varun quest
// AR1000 + AR1005 + AR0020 + QCVRUN + BG4800.
// All added resources use QC prefixes.
// ---------------------------------------------------------------------------

BEGIN QC10HAL
IF ~True()~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN EXIT
END

BEGIN QCVVARUN
IF ~Global("QCVarunQuest","GLOBAL",0)~ THEN BEGIN V0
  SAY @5
  ++ @6 GOTO V1
END

IF ~~ THEN BEGIN V1
  SAY @7
  IF ~IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("QCVarunJaheira","GLOBAL",1)~ EXTERN JAHEIRAJ QCV_JAH1
  ++ @8 EXIT
END

IF ~~ THEN BEGIN VACC
  SAY @9
  IF ~~ THEN DO ~SetGlobal("QCVarunQuest","GLOBAL",1) AddJournalEntry(@2,QUEST) EscapeArea()~ EXIT
END

IF ~Global("QCVarunQuest","GLOBAL",1)~ THEN BEGIN VGATE
  SAY @10
  IF ~~ THEN REPLY @11 DO ~
    SetGlobal("QCVarunQuest","GLOBAL",2)
    ActionOverride(Player1,LeaveAreaLUA("QCVRUN","",[565.585],0))
    ActionOverride(Player2,LeaveAreaLUA("QCVRUN","",[535.585],0))
    ActionOverride(Player3,LeaveAreaLUA("QCVRUN","",[595.585],0))
    ActionOverride(Player4,LeaveAreaLUA("QCVRUN","",[565.615],0))
    ActionOverride(Player5,LeaveAreaLUA("QCVRUN","",[535.615],0))
    ActionOverride(Player6,LeaveAreaLUA("QCVRUN","",[595.615],0))
  ~ EXIT
  ++ @12 EXIT
END

IF ~Global("QCVarunQuest","GLOBAL",2)~ THEN BEGIN VAMB
  SAY @13
  IF ~~ THEN DO ~SetGlobal("QCVarunQuest","GLOBAL",3)~ EXIT
END

IF ~Global("QCVarunQuest","GLOBAL",4)~ THEN BEGIN VPOST
  SAY @14
  IF ~~ THEN REPLY @15 DO ~
    SetGlobal("QCVarunQuest","GLOBAL",5)
    ActionOverride(Player1,LeaveAreaLUA("BG4800","",[2847.3731],0))
    ActionOverride(Player2,LeaveAreaLUA("BG4800","",[2817.3731],0))
    ActionOverride(Player3,LeaveAreaLUA("BG4800","",[2877.3731],0))
    ActionOverride(Player4,LeaveAreaLUA("BG4800","",[2847.3761],0))
    ActionOverride(Player5,LeaveAreaLUA("BG4800","",[2817.3761],0))
    ActionOverride(Player6,LeaveAreaLUA("BG4800","",[2877.3761],0))
  ~ EXIT
  ++ @16 EXIT
END

IF ~Global("QCVarunQuest","GLOBAL",5)~ THEN BEGIN VFIN
  SAY @17
  IF ~~ THEN DO ~EraseJournalEntry(@2) AddJournalEntry(@3,QUEST_DONE) AddExperienceParty(9000) GiveItemCreate("SCRL8O",Player1,1,0,0) SetGlobal("QCVarunQuest","GLOBAL",6) EscapeArea()~ EXIT
END

BEGIN QC10KOB
IF ~True()~ THEN BEGIN 0
  SAY @18
  IF ~IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("QC10KorKob","GLOBAL",1)~ EXTERN KORGANJ QC10_KOR_KOB
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @19
  IF ~~ THEN DO ~SetGlobal("QC10KorKob","GLOBAL",0)~ EXIT
END

BEGIN QC10NOB
IF ~True()~ THEN BEGIN 0
  SAY @20
  IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("QC10KelNob","GLOBAL",1)~ EXTERN KELDORJ QC10_KEL_NOB1
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @21
  IF ~~ THEN EXTERN KELDORJ QC10_KEL_NOB2
END

BEGIN QC10NOL
IF ~True()~ THEN BEGIN 0
  SAY @22
  IF ~IsValidForPartyDialog("Nalia")~ THEN DO ~SetGlobal("QC10NalLady","GLOBAL",1)~ EXTERN NALIAJ QC10_NAL_LADY
  IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("QC10KelLady","GLOBAL",1)~ EXTERN KELDORJ QC10_KEL_LADY
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @23
  IF ~~ THEN DO ~SetGlobal("QC10NalLady","GLOBAL",0) SetGlobal("QC10KelLady","GLOBAL",0)~ EXIT
END

BEGIN QC10HLF
IF ~True()~ THEN BEGIN 0
  SAY @24
  IF ~~ THEN EXIT
END

BEGIN QC10PRS
IF ~True()~ THEN BEGIN 0
  SAY @25
  IF ~~ THEN EXIT
END

// Varun's Jaheira route.  This state can only be entered explicitly from Varun.
CHAIN
  IF ~Global("QCVarunJaheira","GLOBAL",1) IsValidForPartyDialog("Jaheira")~ THEN JAHEIRAJ QCV_JAH1
  @26
  == QCVVARUN @27
  == JAHEIRAJ @28
  == JAHEIRAJ @29
  == JAHEIRAJ @30
  == JAHEIRAJ @31
  == QCVVARUN @32
END
  IF ~~ THEN REPLY @33 DO ~SetGlobal("QCVarunJaheira","GLOBAL",0)~ EXTERN QCVVARUN VACC
  IF ~~ THEN REPLY @34 DO ~SetGlobal("QCVarunJaheira","GLOBAL",0) SetGlobal("QCVarunQuest","GLOBAL",9) EscapeArea()~ EXIT

// Government District companion interjections.  Every appended state has a
// dedicated QC guard so it cannot leak into unrelated BG2 dialogue.
APPEND KORGANJ
IF WEIGHT #-1 ~Global("QC10KorKob","GLOBAL",1) IsValidForPartyDialog("Korgan")~ THEN BEGIN QC10_KOR_KOB
  SAY @35
  IF ~~ THEN EXTERN QC10KOB 1
END
END

APPEND KELDORJ
IF WEIGHT #-1 ~Global("QC10KelNob","GLOBAL",1) IsValidForPartyDialog("Keldorn")~ THEN BEGIN QC10_KEL_NOB1
  SAY @36
  IF ~~ THEN EXTERN QC10NOB 1
END

IF WEIGHT #-1 ~Global("QC10KelNob","GLOBAL",1) IsValidForPartyDialog("Keldorn")~ THEN BEGIN QC10_KEL_NOB2
  SAY @37
  IF ~~ THEN DO ~SetGlobal("QC10KelNob","GLOBAL",0)~ EXIT
END

IF WEIGHT #-1 ~Global("QC10KelLady","GLOBAL",1) IsValidForPartyDialog("Keldorn")~ THEN BEGIN QC10_KEL_LADY
  SAY @38
  IF ~~ THEN EXTERN QC10NOL 1
END
END

APPEND NALIAJ
IF WEIGHT #-1 ~Global("QC10NalLady","GLOBAL",1) IsValidForPartyDialog("Nalia")~ THEN BEGIN QC10_NAL_LADY
  SAY @39
  IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("QC10KelLady","GLOBAL",1)~ EXTERN KELDORJ QC10_KEL_LADY
  IF ~~ THEN DO ~SetGlobal("QC10NalLady","GLOBAL",0)~ EXIT
END
END
