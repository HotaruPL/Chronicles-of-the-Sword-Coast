// ---------------------------------------------------------------------------
// Better immersion for Athkatla - Docks District / Sea's Bounty pass
// AR0300 + AR0313. All added resources use QC prefixes.
// ---------------------------------------------------------------------------

BEGIN QCDHF1
IF ~True()~ THEN BEGIN 0
  SAY @6
  IF ~~ THEN EXIT
END

BEGIN QCDHF2
IF ~Global("QCDGullyReward","LOCALS",0)~ THEN BEGIN 0
  SAY @7
  ++ @8 GOTO 1
  ++ @9 GOTO 2
END

IF ~~ THEN BEGIN 1
  SAY @10
  IF ~~ THEN DO ~SetGlobal("QCDGullyReward","LOCALS",1) GiveItemCreate("AMUL22",Player1,1,0,0)~ EXIT
END

IF ~~ THEN BEGIN 2
  SAY @11
  IF ~~ THEN DO ~SetGlobal("QCDGullyReward","LOCALS",1)~ EXIT
END

IF ~Global("QCDGullyReward","LOCALS",1)~ THEN BEGIN 3
  SAY @12
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// Eulicia - automatic mugging encounter.
// ---------------------------------------------------------------------------
BEGIN QCDEULI
IF ~Global("QCEuliciaMet","LOCALS",2) Global("QCEuliciaDone","LOCALS",0)~ THEN BEGIN START
  SAY @13
  ++ @14 GOTO DEMAND
END

IF ~~ THEN BEGIN DEMAND
  SAY @15
  ++ @16 GOTO PUSHBACK
  ++ @17 GOTO NOGOLD
  ++ @18 GOTO LETGO
END

IF ~~ THEN BEGIN PUSHBACK
  SAY @19
  ++ @20 GOTO DRAWSTEEL
  ++ @21 GOTO GIVEGOLD
  ++ @22 GOTO NOGOLD
END

IF ~~ THEN BEGIN NOGOLD
  SAY @23
  IF ~~ THEN DO ~SetGlobal("QCEuliciaDone","LOCALS",1) CreateCreature("QCEGER",[2732.491],0) CreateCreature("QCEVEL",[2464.526],0) Enemy() AttackReevaluate(NearestEnemyOf(Myself),30)~ EXIT
END

IF ~~ THEN BEGIN LETGO
  SAY @24
  IF ~~ THEN DO ~SetGlobal("QCEuliciaDone","LOCALS",1) CreateCreature("QCEGER",[2732.491],0) CreateCreature("QCEVEL",[2464.526],0) Enemy() AttackReevaluate(NearestEnemyOf(Myself),30)~ EXIT
END

IF ~~ THEN BEGIN DRAWSTEEL
  SAY @25
  IF ~~ THEN DO ~SetGlobal("QCEuliciaDone","LOCALS",1) CreateCreature("QCEGER",[2732.491],0) CreateCreature("QCEVEL",[2464.526],0) Enemy() AttackReevaluate(NearestEnemyOf(Myself),30)~ EXIT
END

IF ~~ THEN BEGIN GIVEGOLD
  SAY @26
  IF ~~ THEN DO ~SetGlobal("QCEuliciaDone","LOCALS",1) TakePartyGold(2147483647) EscapeArea()~ EXIT
END

// ---------------------------------------------------------------------------
// Fistacio / Pilther - Hostile Request quest.
// ---------------------------------------------------------------------------
BEGIN QCDFIST
IF ~Global("QCDHostileRequest","GLOBAL",0)~ THEN BEGIN F0
  SAY @27
  ++ @28 GOTO F1
END

IF ~~ THEN BEGIN F1
  SAY @29
  ++ @30 GOTO F2
END

IF ~~ THEN BEGIN F2
  SAY @31
  ++ @32 GOTO FTHREAT
  ++ @33 GOTO FREWARD
END

IF ~~ THEN BEGIN FTHREAT
  SAY @34
  ++ @35 GOTO FACCEPT
  ++ @36 GOTO FATTACK
END

IF ~~ THEN BEGIN FREWARD
  SAY @37
  IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("QCDFistAer","GLOBAL",1)~ EXTERN AERIEJ QCD_AER_FIST
  IF ~!IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Minsc")~ THEN DO ~SetGlobal("QCDFistMin","GLOBAL",1)~ EXTERN MINSCJ QCD_MIN_FIST
  IF ~!IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Minsc")~ THEN GOTO FWARN
END

IF ~~ THEN BEGIN FWARN
  SAY @38
  ++ @39 GOTO FACCEPT
  ++ @40 GOTO FATTACK
END

IF ~~ THEN BEGIN FACCEPT
  SAY @41
  IF ~~ THEN DO ~SetGlobal("QCDHostileRequest","GLOBAL",1) AddJournalEntry(@2,QUEST)~ EXIT
END

IF ~~ THEN BEGIN FATTACK
  SAY @42
  IF ~~ THEN DO ~Enemy() Attack(Player1)~ EXIT
END

IF ~GlobalGT("QCDHostileRequest","GLOBAL",0) GlobalLT("QCDHostileRequest","GLOBAL",3)~ THEN BEGIN FRETURN
  SAY @43
  IF ~PartyHasItem("QCFAMUL")~ THEN REPLY @44 GOTO FHANDIN
  IF ~~ THEN REPLY @45 GOTO FNOTYET
  IF ~Global("QCDHostileRequest","GLOBAL",2)~ THEN REPLY @46 GOTO FSIDEATTACK
END

IF ~~ THEN BEGIN FHANDIN
  SAY @47
  IF ~~ THEN DO ~TakePartyItem("QCFAMUL") DestroyItem("QCFAMUL") EraseJournalEntry(@2) EraseJournalEntry(@3) AddJournalEntry(@4,QUEST_DONE) AddExperienceParty(10000) SetGlobal("QCDHostileRequest","GLOBAL",3) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN FNOTYET
  SAY @48
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN FSIDEATTACK
  SAY @49
  IF ~~ THEN DO ~Enemy() Attack(Player1)~ EXIT
END

BEGIN QCDPILT
IF ~Global("QCDHostileRequest","GLOBAL",0)~ THEN BEGIN P0
  SAY @50
  IF ~~ THEN EXIT
END

IF ~Global("QCDHostileRequest","GLOBAL",1)~ THEN BEGIN P1
  SAY @51
  ++ @52 GOTO PTALK
  ++ @53 GOTO PDENY
  ++ @54 EXIT
END

IF ~~ THEN BEGIN PTALK
  SAY @55
  ++ @56 GOTO PDENY
  ++ @57 GOTO PSTORY1
  ++ @58 GOTO PKILL
END

IF ~~ THEN BEGIN PDENY
  SAY @59
  ++ @60 GOTO PSURE
  ++ @61 GOTO PSTORY1
END

IF ~~ THEN BEGIN PSURE
  SAY @62
  IF ~~ THEN GOTO PSTORY1
END

IF ~~ THEN BEGIN PSTORY1
  SAY @63
  IF ~~ THEN GOTO PSTORY2
END

IF ~~ THEN BEGIN PSTORY2
  SAY @64
  IF ~~ THEN GOTO PSTORY3
END

IF ~~ THEN BEGIN PSTORY3
  SAY @65
  IF ~~ THEN GOTO PSTORY4
END

IF ~~ THEN BEGIN PSTORY4
  SAY @66
  IF ~~ THEN GOTO PSTORY5
END

IF ~~ THEN BEGIN PSTORY5
  SAY @67
  IF ~~ THEN GOTO PSTORY6
END

IF ~~ THEN BEGIN PSTORY6
  SAY @68
  IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("QCDPilAer","GLOBAL",1)~ EXTERN AERIEJ QCD_AER_PILT
  IF ~!IsValidForPartyDialog("Aerie")~ THEN REPLY @69 GOTO PSIDE
  IF ~!IsValidForPartyDialog("Aerie")~ THEN REPLY @70 GOTO PGUILD
  IF ~!IsValidForPartyDialog("Aerie")~ THEN REPLY @71 GOTO PKILL2
END

IF ~~ THEN BEGIN PSIDE
  SAY @72
  IF ~~ THEN DO ~SetGlobal("QCDHostileRequest","GLOBAL",2) EraseJournalEntry(@2) AddJournalEntry(@3,QUEST)~ EXIT
END

IF ~~ THEN BEGIN PGUILD
  SAY @73
  ++ @74 GOTO PSIDE
  ++ @75 GOTO PKILL2
END

IF ~~ THEN BEGIN PKILL
  SAY @76
  IF ~~ THEN DO ~Enemy() Attack(Player1)~ EXIT
END

IF ~~ THEN BEGIN PKILL2
  SAY @77
  IF ~~ THEN DO ~Enemy() Attack(Player1)~ EXIT
END

IF ~Global("QCDHostileRequest","GLOBAL",2) !Dead("QCDFIST")~ THEN BEGIN PWAIT
  SAY @78
  IF ~~ THEN EXIT
END

IF ~Global("QCDHostileRequest","GLOBAL",2) Dead("QCDFIST")~ THEN BEGIN PDONE
  SAY @79
  ++ @80 GOTO PDONE2
END

IF ~~ THEN BEGIN PDONE2
  SAY @81
  IF ~~ THEN DO ~EraseJournalEntry(@2) EraseJournalEntry(@3) AddJournalEntry(@5,QUEST_DONE) AddExperienceParty(11000) SetGlobal("QCDHostileRequest","GLOBAL",4) EscapeArea()~ EXIT
END

// ---------------------------------------------------------------------------
// Potion Merchant.
// ---------------------------------------------------------------------------
BEGIN QCDPOTM
IF ~True()~ THEN BEGIN START
  SAY @82
  ++ @83 DO ~StartStore("QCDPOTS",LastTalkedToBy())~ EXIT
  ++ @84 EXIT
END

// ---------------------------------------------------------------------------
// Docks ambient commoners.
// ---------------------------------------------------------------------------
BEGIN QCDKOB
IF ~IsValidForPartyDialog("Yoshimo")~ THEN BEGIN Y0
  SAY @85
  IF ~~ THEN DO ~SetGlobal("QCDYosKob","GLOBAL",1)~ EXTERN YOSHJ QCD_YOS_KOB
END

IF ~!IsValidForPartyDialog("Yoshimo")~ THEN BEGIN N0
  SAY @86
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN YRESP
  SAY @87
  IF ~~ THEN DO ~SetGlobal("QCDYosKob","GLOBAL",0)~ EXIT
END

BEGIN QCDLIF1
IF ~True()~ THEN BEGIN 0
  SAY @88
  IF ~~ THEN EXIT
END

BEGIN QCDFISH
IF ~True()~ THEN BEGIN 0
  SAY @89
  IF ~~ THEN EXIT
END

BEGIN QCDTHUG
IF ~True()~ THEN BEGIN 0
  SAY @90
  IF ~IsValidForPartyDialog("Dorn")~ THEN DO ~SetGlobal("QCDDornThug","GLOBAL",1)~ EXTERN DORNJ QCD_DOR_THUG
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @91
  IF ~~ THEN DO ~SetGlobal("QCDDornThug","GLOBAL",0)~ EXIT
END

BEGIN QCDLIF2
IF ~True()~ THEN BEGIN 0
  SAY @92
  IF ~~ THEN EXIT
END

BEGIN QCDLIF3
IF ~True()~ THEN BEGIN 0
  SAY @93
  IF ~~ THEN EXIT
END

BEGIN QCDLIF4
IF ~True()~ THEN BEGIN 0
  SAY @94
  IF ~~ THEN EXIT
END

BEGIN QCD13BOU
IF ~True()~ THEN BEGIN 0
  SAY @95
  IF ~~ THEN EXIT
END

BEGIN QCD13KOB
IF ~True()~ THEN BEGIN 0
  SAY @96
  IF ~IsValidForPartyDialog("Neera")~ THEN DO ~SetGlobal("QCDNeeraKob","GLOBAL",1)~ EXTERN BNEERA QCD_NEE_KOB
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @97
  IF ~~ THEN DO ~SetGlobal("QCDNeeraKob","GLOBAL",0)~ EXIT
END

// ---------------------------------------------------------------------------
// Guarded BG2 companion interjections.
// ---------------------------------------------------------------------------
APPEND AERIEJ
IF WEIGHT #-1 ~Global("QCDFistAer","GLOBAL",1) IsValidForPartyDialog("Aerie")~ THEN BEGIN QCD_AER_FIST
  SAY @98
  IF ~IsValidForPartyDialog("Minsc")~ THEN DO ~SetGlobal("QCDFistAer","GLOBAL",0) SetGlobal("QCDFistMin","GLOBAL",1)~ EXTERN MINSCJ QCD_MIN_FIST
  IF ~~ THEN DO ~SetGlobal("QCDFistAer","GLOBAL",0)~ EXTERN QCDFIST FWARN
END

IF WEIGHT #-1 ~Global("QCDPilAer","GLOBAL",1) IsValidForPartyDialog("Aerie")~ THEN BEGIN QCD_AER_PILT
  SAY @99
  IF ~~ THEN REPLY @100 DO ~SetGlobal("QCDPilAer","GLOBAL",0)~ EXTERN QCDPILT PSIDE
  IF ~~ THEN REPLY @101 DO ~SetGlobal("QCDPilAer","GLOBAL",0)~ EXTERN QCDPILT PGUILD
  IF ~~ THEN REPLY @102 DO ~SetGlobal("QCDPilAer","GLOBAL",0)~ EXTERN QCDPILT PKILL2
END
END

APPEND MINSCJ
IF WEIGHT #-1 ~Global("QCDFistMin","GLOBAL",1) IsValidForPartyDialog("Minsc")~ THEN BEGIN QCD_MIN_FIST
  SAY @103
  IF ~~ THEN DO ~SetGlobal("QCDFistMin","GLOBAL",0)~ EXTERN QCDFIST FWARN
END
END

APPEND YOSHJ
IF WEIGHT #-1 ~Global("QCDYosKob","GLOBAL",1) IsValidForPartyDialog("Yoshimo")~ THEN BEGIN QCD_YOS_KOB
  SAY @104
  IF ~~ THEN EXTERN QCDKOB YRESP
END
END

APPEND DORNJ
IF WEIGHT #-1 ~Global("QCDDornThug","GLOBAL",1) IsValidForPartyDialog("Dorn")~ THEN BEGIN QCD_DOR_THUG
  SAY @105
  IF ~~ THEN EXTERN QCDTHUG 1
END
END

APPEND BNEERA
IF WEIGHT #-1 ~Global("QCDNeeraKob","GLOBAL",1) IsValidForPartyDialog("Neera")~ THEN BEGIN QCD_NEE_KOB
  SAY @106
  IF ~~ THEN EXTERN QCD13KOB 1
END
END
