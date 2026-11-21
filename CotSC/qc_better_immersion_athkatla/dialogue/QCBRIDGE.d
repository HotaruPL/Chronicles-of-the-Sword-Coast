// ---------------------------------------------------------------------------
// Better immersion for Athkatla - Bridge District / Five Flagons pass
// AR0500 + AR0513. All added resources use QC prefixes.
// ---------------------------------------------------------------------------

BEGIN QC50GBEG
IF ~True()~ THEN BEGIN 0
  SAY @4
  ++ @5 GOTO 1
  ++ @6 GOTO 2
END

IF ~~ THEN BEGIN 1
  SAY @7
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY @8
  IF ~~ THEN EXIT
END

BEGIN QC50GOBF
IF ~True()~ THEN BEGIN 0
  SAY @9
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN DO ~SetGlobal("QC50YosFish","GLOBAL",1)~ EXTERN YOSHJ QCA_YOS_50F
  IF ~~ THEN EXIT
END

BEGIN QC50IRV
IF ~Global("QC50Artist","GLOBAL",0)~ THEN BEGIN 0
  SAY @10
  ++ @11 GOTO 1
  ++ @12 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @13
  IF ~~ THEN DO ~SetGlobal("QC50Artist","GLOBAL",1) AddJournalEntry(@2,QUEST)~ EXIT
END

IF ~Global("QC50Artist","GLOBAL",1)~ THEN BEGIN 2
  SAY @14
  IF ~PartyHasItem("POTN37")~ THEN REPLY @15 DO ~TakePartyItem("POTN37") DestroyItem("POTN37")~ GOTO 3
  IF ~~ THEN REPLY @16 EXIT
END

IF ~~ THEN BEGIN 3
  SAY @17
  IF ~~ THEN DO ~SetGlobal("QC50Artist","GLOBAL",2) EraseJournalEntry(@2) AddJournalEntry(@3,QUEST_DONE) AddExperienceParty(4000) GiveItemCreate("QCBDRAW",Player1,1,0,0)~ EXIT
END

IF ~Global("QC50Artist","GLOBAL",2)~ THEN BEGIN 4
  SAY @18
  IF ~~ THEN EXIT
END

BEGIN QC50HALF
IF ~Global("QC50HalfTalked","LOCALS",0)~ THEN BEGIN 0
  SAY @19
  IF ~~ THEN REPLY @20 DO ~SetGlobal("QC50HalfTalked","LOCALS",1)~ GOTO 1
  IF ~~ THEN REPLY @21 DO ~SetGlobal("QC50HalfTalked","LOCALS",1)~ GOTO 2
END

IF ~~ THEN BEGIN 1
  SAY @22
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY @23
  IF ~~ THEN DO ~ReputationInc(-2) GiveGoldForce(80)~ EXIT
END

IF ~GlobalGT("QC50HalfTalked","LOCALS",0)~ THEN BEGIN 3
  SAY @24
  IF ~~ THEN EXIT
END

BEGIN QC50HOG
IF ~Global("QC50HogHostile","LOCALS",0)~ THEN BEGIN 0
  SAY @25
  IF ~IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("QC50KorHog","GLOBAL",1)~ EXTERN KORGANJ QCA_KOR_50H1
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @26
  IF ~~ THEN EXTERN KORGANJ QCA_KOR_50H2
END

IF ~~ THEN BEGIN 2
  SAY @27
  IF ~~ THEN DO ~SetGlobal("QC50KorHog","GLOBAL",0) SetGlobal("QC50HogHostile","LOCALS",1) Enemy() Attack(Player1)~ EXIT
END

BEGIN QC50HOB
IF ~True()~ THEN BEGIN 0
  SAY @28
  IF ~IsValidForPartyDialog("Anomen")~ THEN DO ~SetGlobal("QC50AnoHob","GLOBAL",1)~ EXTERN ANOMENJ QCA_ANO_50H
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @29
  IF ~~ THEN DO ~SetGlobal("QC50AnoHob","GLOBAL",0)~ EXIT
END

BEGIN QC50ALIN
IF ~True()~ THEN BEGIN 0
  SAY @30
  ++ @31 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @32
  IF ~IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("QC50JahAlina","GLOBAL",1)~ EXTERN JAHEIRAJ QCA_JAH_50A
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @33
  ++ @34 GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @35
  IF ~~ THEN EXIT
END

BEGIN QC513BOU
IF ~True()~ THEN BEGIN 0
  SAY @36
  IF ~~ THEN EXIT
END

BEGIN QC513GNO
IF ~True()~ THEN BEGIN 0
  SAY @37
  IF ~IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QC513MazGnome","GLOBAL",1)~ EXTERN MAZZYJ QCA_MAZ_513
  IF ~~ THEN EXIT
END

APPEND JAHEIRAJ
IF WEIGHT #-1 ~Global("QC50JahAlina","GLOBAL",1) IsValidForPartyDialog("Jaheira")~ THEN BEGIN QCA_JAH_50A
  SAY @38
  IF ~~ THEN DO ~SetGlobal("QC50JahAlina","GLOBAL",0)~ EXTERN QC50ALIN 2
END
END

// ---------------------------------------------------------------------------
// BG2 companion interjections. Each has a dedicated QC guard so the lines
// cannot become candidates in unrelated joined-NPC conversations.
// ---------------------------------------------------------------------------

APPEND YOSHJ
IF WEIGHT #-1 ~Global("QC50YosFish","GLOBAL",1) IsValidForPartyDialog("Yoshimo")~ THEN BEGIN QCA_YOS_50F
  SAY @39
  IF ~~ THEN DO ~SetGlobal("QC50YosFish","GLOBAL",0)~ EXIT
END
END

APPEND KORGANJ
IF WEIGHT #-1 ~Global("QC50KorHog","GLOBAL",1) IsValidForPartyDialog("Korgan")~ THEN BEGIN QCA_KOR_50H1
  SAY @40
  IF ~~ THEN EXTERN QC50HOG 1
END

IF WEIGHT #-1 ~Global("QC50KorHog","GLOBAL",1) IsValidForPartyDialog("Korgan")~ THEN BEGIN QCA_KOR_50H2
  SAY @41
  IF ~~ THEN EXTERN QC50HOG 2
END
END

APPEND ANOMENJ
IF WEIGHT #-1 ~Global("QC50AnoHob","GLOBAL",1) IsValidForPartyDialog("Anomen")~ THEN BEGIN QCA_ANO_50H
  SAY @42
  IF ~~ THEN EXTERN QC50HOB 1
END
END


APPEND MAZZYJ
IF WEIGHT #-1 ~Global("QC513MazGnome","GLOBAL",1) IsValidForPartyDialog("Mazzy")~ THEN BEGIN QCA_MAZ_513
  SAY @43
  IF ~~ THEN DO ~SetGlobal("QC513MazGnome","GLOBAL",0)~ EXIT
END
END
