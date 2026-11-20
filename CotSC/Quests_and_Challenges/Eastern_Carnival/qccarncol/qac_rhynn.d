BEGIN QACRHYN

IF ~Global("QAC_LASLO_STARTED","GLOBAL",1) Global("QAC_LASLO_RETURNED","GLOBAL",0)~ THEN BEGIN QAC_LASLO_CHECK
    SAY @9
    IF ~PartyHasItem("QCLASLO")~ THEN REPLY @10 GOTO QAC_LASLO_RETURN
    IF ~~ THEN REPLY @11 EXIT
END

IF ~~ THEN BEGIN QAC_LASLO_RETURN
    SAY @12
    IF ~IsValidForPartyDialog("Alora")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ EXTERN ALORAJ QAC_LASLO_RHYNN_ALORA
    IF ~!IsValidForPartyDialog("Alora") IsValidForPartyDialog("Kivan")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ EXTERN KIVANJ QAC_LASLO_RHYNN_KIVAN
    IF ~!IsValidForPartyDialog("Alora") !IsValidForPartyDialog("Kivan") IsValidForPartyDialog("Minsc")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ EXTERN MINSCJ_ QAC_LASLO_RHYNN_MINSC
    IF ~!IsValidForPartyDialog("Alora") !IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") IsValidForPartyDialog("Kagain")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ EXTERN KAGAIJ QAC_LASLO_RHYNN_KAGAIN
    IF ~!IsValidForPartyDialog("Alora") !IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") IsValidForPartyDialog("Branwen")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ EXTERN BRANWJ QAC_LASLO_RHYNN_BRANWEN
    IF ~!IsValidForPartyDialog("Alora") !IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") IsValidForPartyDialog("Dorn")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ EXTERN DORNJ_ QAC_LASLO_RHYNN_DORN
    IF ~!IsValidForPartyDialog("Alora") !IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Skie")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ EXTERN SKIEJ QAC_LASLO_RHYNN_SKIE
    IF ~!IsValidForPartyDialog("Alora") !IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Skie")~ THEN DO ~TakePartyItem("QCLASLO") DestroyItem("QCLASLO") SetGlobal("QAC_LASLO_RETURNED","GLOBAL",1) AddJournalEntry(@5,QUEST_DONE) AddexperienceParty(200) GiveGoldForce(250) ReputationInc(1)~ GOTO QAC_LASLO_FINISH
END

IF ~Global("QAC_LASLO_RETURNED","GLOBAL",1)~ THEN BEGIN QAC_LASLO_FINISH
    SAY @13
    IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN 0
    SAY @14
    IF ~~ THEN REPLY @15 GOTO 1
    IF ~Global("QAC_LASLO_OPTION1","GLOBAL",0)~ THEN REPLY @16 GOTO 2
    IF ~~ THEN REPLY @17 GOTO 3
END

IF ~~ THEN BEGIN 1
    SAY @18
    IF ~~ THEN DO ~SetGlobal("QAC_LASLO_OPTION1","GLOBAL",1)~ GOTO 7
END

IF ~~ THEN BEGIN 7
    SAY @19
    IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 2
    SAY @20
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 3
    SAY @21
    IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4
    SAY @22
    IF ~~ THEN REPLY @23 GOTO 5
    IF ~~ THEN REPLY @24 GOTO 6
    IF ~~ THEN REPLY @25 EXIT
END

IF ~~ THEN BEGIN 5
    SAY @26
    IF ~~ THEN DO ~SetGlobal("QAC_LASLO_STARTED","GLOBAL",1) AddJournalEntry(@4,QUEST)~ EXIT
END

IF ~~ THEN BEGIN 6
    SAY @27
    IF ~~ THEN EXIT
END

APPEND ~ALORAJ~
IF ~~ THEN BEGIN QAC_LASLO_RHYNN_ALORA
    SAY @28
    IF ~IsValidForPartyDialog("Kivan")~ THEN EXTERN KIVANJ QAC_LASLO_RHYNN_KIVAN
    IF ~!IsValidForPartyDialog("Kivan") IsValidForPartyDialog("Minsc")~ THEN EXTERN MINSCJ_ QAC_LASLO_RHYNN_MINSC
    IF ~!IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") IsValidForPartyDialog("Kagain")~ THEN EXTERN KAGAIJ QAC_LASLO_RHYNN_KAGAIN
    IF ~!IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") IsValidForPartyDialog("Branwen")~ THEN EXTERN BRANWJ QAC_LASLO_RHYNN_BRANWEN
    IF ~!IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") IsValidForPartyDialog("Dorn")~ THEN EXTERN DORNJ_ QAC_LASLO_RHYNN_DORN
    IF ~!IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Skie")~ THEN EXTERN SKIEJ QAC_LASLO_RHYNN_SKIE
    IF ~!IsValidForPartyDialog("Kivan") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Skie")~ THEN EXTERN QACRHYN QAC_LASLO_FINISH
END
END

APPEND ~KIVANJ~
IF ~~ THEN BEGIN QAC_LASLO_RHYNN_KIVAN
    SAY @29
    IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN MINSCJ_ QAC_LASLO_RHYNN_MINSC
    IF ~!IsValidForPartyDialog("Minsc") IsValidForPartyDialog("Kagain")~ THEN EXTERN KAGAIJ QAC_LASLO_RHYNN_KAGAIN
    IF ~!IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") IsValidForPartyDialog("Branwen")~ THEN EXTERN BRANWJ QAC_LASLO_RHYNN_BRANWEN
    IF ~!IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") IsValidForPartyDialog("Dorn")~ THEN EXTERN DORNJ_ QAC_LASLO_RHYNN_DORN
    IF ~!IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Skie")~ THEN EXTERN SKIEJ QAC_LASLO_RHYNN_SKIE
    IF ~!IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Skie")~ THEN EXTERN QACRHYN QAC_LASLO_FINISH
END
END

APPEND ~MINSCJ_~
IF ~~ THEN BEGIN QAC_LASLO_RHYNN_MINSC
    SAY @30
    IF ~IsValidForPartyDialog("Kagain")~ THEN EXTERN KAGAIJ QAC_LASLO_RHYNN_KAGAIN
    IF ~!IsValidForPartyDialog("Kagain") IsValidForPartyDialog("Branwen")~ THEN EXTERN BRANWJ QAC_LASLO_RHYNN_BRANWEN
    IF ~!IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") IsValidForPartyDialog("Dorn")~ THEN EXTERN DORNJ_ QAC_LASLO_RHYNN_DORN
    IF ~!IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Skie")~ THEN EXTERN SKIEJ QAC_LASLO_RHYNN_SKIE
    IF ~!IsValidForPartyDialog("Kagain") !IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Skie")~ THEN EXTERN QACRHYN QAC_LASLO_FINISH
END
END

APPEND ~KAGAIJ~
IF ~~ THEN BEGIN QAC_LASLO_RHYNN_KAGAIN
    SAY @31
    IF ~IsValidForPartyDialog("Branwen")~ THEN EXTERN BRANWJ QAC_LASLO_RHYNN_BRANWEN
    IF ~!IsValidForPartyDialog("Branwen") IsValidForPartyDialog("Dorn")~ THEN EXTERN DORNJ_ QAC_LASLO_RHYNN_DORN
    IF ~!IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Skie")~ THEN EXTERN SKIEJ QAC_LASLO_RHYNN_SKIE
    IF ~!IsValidForPartyDialog("Branwen") !IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Skie")~ THEN EXTERN QACRHYN QAC_LASLO_FINISH
END
END

APPEND ~BRANWJ~
IF ~~ THEN BEGIN QAC_LASLO_RHYNN_BRANWEN
    SAY @32
    IF ~IsValidForPartyDialog("Dorn")~ THEN EXTERN DORNJ_ QAC_LASLO_RHYNN_DORN
    IF ~!IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Skie")~ THEN EXTERN SKIEJ QAC_LASLO_RHYNN_SKIE
    IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Skie")~ THEN EXTERN QACRHYN QAC_LASLO_FINISH
END
END

APPEND ~DORNJ_~
IF ~~ THEN BEGIN QAC_LASLO_RHYNN_DORN
    SAY @33
    IF ~IsValidForPartyDialog("Skie")~ THEN EXTERN SKIEJ QAC_LASLO_RHYNN_SKIE
    IF ~!IsValidForPartyDialog("Skie")~ THEN EXTERN QACRHYN QAC_LASLO_FINISH
END
END

APPEND ~SKIEJ~
IF ~~ THEN BEGIN QAC_LASLO_RHYNN_SKIE
    SAY @34
    IF ~~ THEN EXTERN QACRHYN QAC_LASLO_FINISH
END
END
