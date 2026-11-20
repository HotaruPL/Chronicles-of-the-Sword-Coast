// Better Immersion for Trademeet
// AR2000 + AR2010. All new resources use QC prefixes.

BEGIN QCTHCOM
IF ~True()~ THEN BEGIN 0
  SAY @4
  IF ~~ THEN EXIT
END

BEGIN QCTHUM
IF ~True()~ THEN BEGIN 0
  SAY @5
  IF ~~ THEN EXIT
END

BEGIN QCTORC
IF ~True()~ THEN BEGIN 0
  SAY @6
  IF ~~ THEN EXIT
END

BEGIN QCTGNOL
IF ~True()~ THEN BEGIN 0
  SAY @7
  IF ~IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCTMazGnoll","GLOBAL",1)~ EXTERN MAZZYJ QCT_MAZ_GNOLL
  IF ~!IsValidForPartyDialog("Mazzy")~ THEN EXIT
END

IF ~~ THEN BEGIN MAZ_REPLY
  SAY @8
  IF ~~ THEN EXIT
END

BEGIN QCTFEM
IF ~True()~ THEN BEGIN 0
  SAY @9
  IF ~IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCTMazWoman","GLOBAL",1)~ EXTERN MAZZYJ QCT_MAZ_WOMAN
  IF ~!IsValidForPartyDialog("Mazzy")~ THEN EXIT
END

IF ~~ THEN BEGIN MAZ_REPLY
  SAY @10
  IF ~~ THEN EXIT
END

BEGIN QCTTIEF
IF ~True()~ THEN BEGIN 0
  SAY @11
  IF ~~ THEN EXIT
END

BEGIN QCTHALF
IF ~True()~ THEN BEGIN 0
  SAY @12
  IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("QCTAerieHalf","GLOBAL",1)~ EXTERN AERIEJ QCT_AER_HALF
  IF ~!IsValidForPartyDialog("Aerie")~ THEN EXIT
END

BEGIN QCTKOB1
IF ~True()~ THEN BEGIN 0
  SAY @13
  IF ~IsValidForPartyDialog("Cernd")~ THEN DO ~SetGlobal("QCTCerndKob","GLOBAL",1)~ EXTERN CERNDJ QCT_CER_KOB1
  IF ~!IsValidForPartyDialog("Cernd")~ THEN EXIT
END

IF ~~ THEN BEGIN CERND_REPLY1
  SAY @14
  IF ~~ THEN EXTERN CERNDJ QCT_CER_KOB2
END

IF ~~ THEN BEGIN CERND_REPLY2
  SAY @15
  IF ~~ THEN EXIT
END

BEGIN QCTKOB2
IF ~True()~ THEN BEGIN 0
  SAY @16
  IF ~IsValidForPartyDialog("Viconia")~ THEN DO ~SetGlobal("QCTVicKob","GLOBAL",1)~ EXTERN VICONIJ QCT_VIC_KOB
  IF ~!IsValidForPartyDialog("Viconia")~ THEN EXIT
END

// Night-only spectre and Trademeet Haunting quest.
BEGIN QCTSPECT
IF ~Global("QCTHaunt","GLOBAL",0)~ THEN BEGIN START
  SAY @17
  ++ @42 GOTO CHILD
  ++ @43 GOTO CHILD
  ++ @44 EXIT
END

IF ~~ THEN BEGIN CHILD
  SAY @18
  ++ @45 GOTO HODRIG
  ++ @46 EXIT
END

IF ~~ THEN BEGIN HODRIG
  SAY @19
  ++ @47 GOTO ACCEPT
  + ~IsValidForPartyDialog("Viconia")~ + @48 DO ~SetGlobal("QCTVicGhost","GLOBAL",1)~ EXTERN VICONIJ QCT_VIC_GHOST
  + ~IsValidForPartyDialog("Hexxat")~ + @49 DO ~SetGlobal("QCTHexGhost","GLOBAL",1)~ EXTERN HEXXATJ QCT_HEX_GHOST
  ++ @50 GOTO DECLINE
END

IF ~~ THEN BEGIN ACCEPT
  SAY @20
  IF ~~ THEN DO ~SetGlobal("QCTHaunt","GLOBAL",1) AddJournalEntry(@2,QUEST)~ EXIT
END

IF ~~ THEN BEGIN VIC_ACCEPT
  SAY @21
  IF ~~ THEN DO ~SetGlobal("QCTVicGhost","GLOBAL",0) SetGlobal("QCTHaunt","GLOBAL",1) AddJournalEntry(@2,QUEST)~ EXIT
END

IF ~~ THEN BEGIN DECLINE
  SAY @22
  IF ~~ THEN EXIT
END

// v69: if the party loots QCTBODY after killing Hodrig, the spectre must
// accept it even if the surrender flag QCTHaunt=2 was never set.
IF ~Global("QCTHaunt","GLOBAL",1) !PartyHasItem("QCTBODY")~ THEN BEGIN SEARCHING
  SAY @23
  ++ @51 GOTO STILL
END

IF ~OR(2) Global("QCTHaunt","GLOBAL",1) Global("QCTHaunt","GLOBAL",2)~ THEN BEGIN RETURN
  SAY @24
  + ~PartyHasItem("QCTBODY")~ + @52 GOTO COMPLETE
  ++ @53 GOTO STILL
END

IF ~~ THEN BEGIN STILL
  SAY @25
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN COMPLETE
  SAY @26
  IF ~~ THEN DO ~TakePartyItem("QCTBODY") DestroyItem("QCTBODY") EraseJournalEntry(@2) AddJournalEntry(@3,QUEST_DONE) ReputationInc(1) AddExperienceParty(13000) SetGlobal("QCTHaunt","GLOBAL",3) DestroySelf()~ EXIT
END

// Hodrig confrontation.
BEGIN QCTHODR
IF ~Global("QCTHodrigFight","GLOBAL",0) Global("QCTHodrigSurrender","GLOBAL",0)~ THEN BEGIN START
  SAY @27
  + ~Global("QCTHaunt","GLOBAL",1)~ + @54 GOTO CONFRONT
  ++ @55 EXIT
  ++ @56 EXIT
END

IF ~~ THEN BEGIN CONFRONT
  SAY @28
  IF ~~ THEN DO ~SetGlobal("QCTHodrigFight","GLOBAL",1) ChangeEnemyAlly(Myself,ENEMY) ActionOverride("QCTAC1",ChangeEnemyAlly(Myself,ENEMY)) ActionOverride("QCTAC2",ChangeEnemyAlly(Myself,ENEMY)) ActionOverride("QCTAC3",ChangeEnemyAlly(Myself,ENEMY))~ EXIT
END

IF ~Global("QCTHodrigSurrender","GLOBAL",1)~ THEN BEGIN SURRENDER
  SAY @29
  ++ @57 GOTO SPARE
  ++ @58 GOTO KILL
END

IF ~~ THEN BEGIN SPARE
  SAY @30
  IF ~~ THEN DO ~DestroyItem("QCTBODY") GiveItemCreate("QCTBODY",Player1,1,0,0) SetGlobal("QCTHaunt","GLOBAL",2) SetGlobal("QCTHodrigGone","GLOBAL",1) ActionOverride("QCTAC1",DestroySelf()) ActionOverride("QCTAC2",DestroySelf()) ActionOverride("QCTAC3",DestroySelf()) EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN KILL
  SAY @31
  IF ~~ THEN DO ~DestroyItem("QCTBODY") GiveItemCreate("QCTBODY",Player1,1,0,0) SetGlobal("QCTHaunt","GLOBAL",2) ChangeEnemyAlly(Myself,ENEMY) ActionOverride("QCTAC1",ChangeEnemyAlly(Myself,ENEMY)) ActionOverride("QCTAC2",ChangeEnemyAlly(Myself,ENEMY)) ActionOverride("QCTAC3",ChangeEnemyAlly(Myself,ENEMY))~ EXIT
END

BEGIN QCTCOOK
IF ~True()~ THEN BEGIN 0
  SAY @32
  IF ~~ THEN EXIT
END

BEGIN QCTBOUN
IF ~True()~ THEN BEGIN 0
  SAY @33
  IF ~~ THEN EXIT
END

// Guarded BG2 companion interjections.
APPEND MAZZYJ
IF WEIGHT #-1 ~Global("QCTMazGnoll","GLOBAL",1) IsValidForPartyDialog("Mazzy")~ THEN BEGIN QCT_MAZ_GNOLL
  SAY @34
  IF ~~ THEN DO ~SetGlobal("QCTMazGnoll","GLOBAL",0)~ EXTERN QCTGNOL MAZ_REPLY
END
IF WEIGHT #-1 ~Global("QCTMazWoman","GLOBAL",1) IsValidForPartyDialog("Mazzy")~ THEN BEGIN QCT_MAZ_WOMAN
  SAY @35
  IF ~~ THEN DO ~SetGlobal("QCTMazWoman","GLOBAL",0)~ EXTERN QCTFEM MAZ_REPLY
END
END

APPEND AERIEJ
IF WEIGHT #-1 ~Global("QCTAerieHalf","GLOBAL",1) IsValidForPartyDialog("Aerie")~ THEN BEGIN QCT_AER_HALF
  SAY @36
  IF ~~ THEN DO ~SetGlobal("QCTAerieHalf","GLOBAL",0)~ EXIT
END
END

APPEND CERNDJ
IF WEIGHT #-1 ~Global("QCTCerndKob","GLOBAL",1) IsValidForPartyDialog("Cernd")~ THEN BEGIN QCT_CER_KOB1
  SAY @37
  IF ~~ THEN EXTERN QCTKOB1 CERND_REPLY1
END
IF WEIGHT #-1 ~Global("QCTCerndKob","GLOBAL",1) IsValidForPartyDialog("Cernd")~ THEN BEGIN QCT_CER_KOB2
  SAY @38
  IF ~~ THEN DO ~SetGlobal("QCTCerndKob","GLOBAL",0)~ EXTERN QCTKOB1 CERND_REPLY2
END
END

APPEND VICONIJ
IF WEIGHT #-1 ~Global("QCTVicKob","GLOBAL",1) IsValidForPartyDialog("Viconia")~ THEN BEGIN QCT_VIC_KOB
  SAY @39
  IF ~~ THEN DO ~SetGlobal("QCTVicKob","GLOBAL",0)~ EXIT
END
IF WEIGHT #-1 ~Global("QCTVicGhost","GLOBAL",1) IsValidForPartyDialog("Viconia")~ THEN BEGIN QCT_VIC_GHOST
  SAY @40
  IF ~~ THEN EXTERN QCTSPECT VIC_ACCEPT
END
END

APPEND HEXXATJ
IF WEIGHT #-1 ~Global("QCTHexGhost","GLOBAL",1) IsValidForPartyDialog("Hexxat")~ THEN BEGIN QCT_HEX_GHOST
  SAY @41
  IF ~~ THEN DO ~SetGlobal("QCTHexGhost","GLOBAL",0) SetGlobal("QCTHaunt","GLOBAL",1) AddJournalEntry(@2,QUEST)~ EXIT
END
END
