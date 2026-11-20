// ---------------------------------------------------------------------------
// Better immersion for Athkatla - Slums / Copper Coronet pass
// AR0400 + AR0406.  All added resources use QC prefixes.
// ---------------------------------------------------------------------------

BEGIN QC40OBEG
IF ~Global("QC40OBTalked","LOCALS",0)~ THEN BEGIN 0
  SAY @1
  IF ~PartyGoldGT(0)~ THEN REPLY @2 DO ~TakePartyGold(1) SetGlobal("QC40OBTalked","LOCALS",1)~ GOTO 1
  IF ~~ THEN REPLY @3 DO ~SetGlobal("QC40OBTalked","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("QC40KorBeggar","GLOBAL",1)~ EXTERN KORGANJ QCA_KOR_40B
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @5
  IF ~~ THEN DO ~SetGlobal("QC40KorBeggar","GLOBAL",0) AddExperienceParty(200)~ EXIT
END

IF ~GlobalGT("QC40OBTalked","LOCALS",0)~ THEN BEGIN 3
  SAY @6
  IF ~~ THEN EXIT
END

BEGIN QC40KOB
IF ~True()~ THEN BEGIN 0
  SAY @7
  IF ~~ THEN EXIT
END

BEGIN QC40GNOL
IF ~True()~ THEN BEGIN 0
  SAY @8
  IF ~~ THEN EXIT
END

BEGIN QC40ORC
IF ~True()~ THEN BEGIN 0
  SAY @9
  IF ~~ THEN REPLY @10 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @11
  IF ~~ THEN EXIT
END

BEGIN QC40GNOM
IF ~True()~ THEN BEGIN 0
  SAY @12
  IF ~IsValidForPartyDialog("Nalia")~ THEN DO ~SetGlobal("QC40NalGnome","GLOBAL",1)~ EXTERN NALIAJ QCA_NAL_40G1
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1
  SAY @13
  IF ~~ THEN EXTERN NALIAJ QCA_NAL_40G2
END

IF ~~ THEN BEGIN 2
  SAY @14
  IF ~~ THEN DO ~SetGlobal("QC40NalGnome","GLOBAL",0)~ EXIT
END

BEGIN QC40EBEG
IF ~~ THEN BEGIN 6
  SAY @15
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 7
  SAY @16
  IF ~~ THEN EXIT
END

CHAIN
  IF ~Gender(Player1,MALE)~ THEN QC40EBEG QC40EB_M
  @17
  == NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @18
  == AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @19
  == VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @20
END
  IF ~PartyGoldGT(0)~ THEN REPLY @21 DO ~TakePartyGold(1)~ GOTO 6
  IF ~~ THEN REPLY @22 GOTO 7

CHAIN
  IF ~Gender(Player1,FEMALE)~ THEN QC40EBEG QC40EB_F
  @23
  == NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @24
  == AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @25
  == VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @26
END
  IF ~PartyGoldGT(0)~ THEN REPLY @27 DO ~TakePartyGold(1)~ GOTO 6
  IF ~~ THEN REPLY @28 GOTO 7

BEGIN QC40DOG
IF ~True()~ THEN BEGIN 0
  SAY @29
  IF ~~ THEN DO ~Enemy()~ EXIT
END

BEGIN QC40DWAR
IF ~True()~ THEN BEGIN 0
  SAY @30
  IF ~~ THEN EXIT
END

BEGIN QC40HALF
IF ~True()~ THEN BEGIN 0
  SAY @31
  IF ~~ THEN EXIT
END

BEGIN QC46ELF
IF ~True()~ THEN BEGIN 0
  SAY @32
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN DO ~SetGlobal("QC46YosElf","GLOBAL",1)~ EXTERN YOSHJ QCA_YOS_46E
  IF ~~ THEN EXIT
END

BEGIN QC46HOB
IF ~True()~ THEN BEGIN 0
  SAY @33
  IF ~IsValidForPartyDialog("Korgan")~ THEN DO ~SetGlobal("QC46KorHob","GLOBAL",1)~ EXTERN KORGANJ QCA_KOR_46H
  IF ~~ THEN EXIT
END

BEGIN QC46HOG
IF ~True()~ THEN BEGIN 0
  SAY @34
  IF ~~ THEN EXIT
END

BEGIN QC46ORC
IF ~True()~ THEN BEGIN 0
  SAY @35
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// BG2 companion interjections.  Every state has a dedicated QC guard so it
// cannot leak into unrelated joined-NPC dialogue.
// ---------------------------------------------------------------------------

APPEND KORGANJ
IF WEIGHT #-1 ~Global("QC40KorBeggar","GLOBAL",1) IsValidForPartyDialog("Korgan")~ THEN BEGIN QCA_KOR_40B
  SAY @36
  IF ~~ THEN EXTERN QC40OBEG 2
END

IF WEIGHT #-1 ~Global("QC46KorHob","GLOBAL",1) IsValidForPartyDialog("Korgan")~ THEN BEGIN QCA_KOR_46H
  SAY @37
  IF ~~ THEN DO ~SetGlobal("QC46KorHob","GLOBAL",0)~ EXIT
END
END

APPEND NALIAJ
IF WEIGHT #-1 ~Global("QC40NalGnome","GLOBAL",1) IsValidForPartyDialog("Nalia")~ THEN BEGIN QCA_NAL_40G1
  SAY @38
  IF ~~ THEN EXTERN QC40GNOM 1
END

IF WEIGHT #-1 ~Global("QC40NalGnome","GLOBAL",1) IsValidForPartyDialog("Nalia")~ THEN BEGIN QCA_NAL_40G2
  SAY @39
  IF ~~ THEN EXTERN QC40GNOM 2
END


END

APPEND YOSHJ
IF WEIGHT #-1 ~Global("QC46YosElf","GLOBAL",1) IsValidForPartyDialog("Yoshimo")~ THEN BEGIN QCA_YOS_46E
  SAY @40
  IF ~~ THEN DO ~SetGlobal("QC46YosElf","GLOBAL",0)~ EXIT
END
END
