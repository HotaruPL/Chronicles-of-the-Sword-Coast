BEGIN QCVIRAGE

// First encounter. Once Virage has introduced himself, the conversation
// can be resumed directly at the request for help.
IF ~Global("QCVIRAGE_STATE","GLOBAL",0)~ THEN BEGIN QV_INTRO
    SAY @35
    IF ~~ THEN REPLY @36 GOTO QV_DOWN
END

IF ~~ THEN BEGIN QV_DOWN
    SAY @37
    IF ~~ THEN REPLY @38 GOTO QV_SPEAK
END

IF ~~ THEN BEGIN QV_SPEAK
    SAY @39
    IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN DO ~AddJournalEntry(@7,QUEST)~ EXTERN JAHEIJ QV_JAHEIRA
    IF ~!InParty("Jaheira")~ THEN DO ~AddJournalEntry(@7,QUEST)~ GOTO QV_INTRO_HELP
    IF ~InParty("Jaheira") StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN DO ~AddJournalEntry(@7,QUEST)~ GOTO QV_INTRO_HELP
END

IF ~~ THEN BEGIN QV_INTRO_HELP
    SAY @40
    IF ~~ THEN GOTO QV_PLEASE
END

IF ~~ THEN BEGIN QV_PLEASE
    SAY @41
    IF ~~ THEN REPLY @42 GOTO QV_TRICK
    IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN REPLY @43 EXTERN JAHEIJ QV_JAHEIRA_HELP
    IF ~InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN REPLY @44 EXTERN EDWINJ_ QV_EDWIN
    IF ~InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN REPLY @45 EXTERN DYNAHJ QV_DYNAHEIR
    IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN REPLY @46 EXTERN NEERAJ_ QV_NEERA
    IF ~~ THEN REPLY @47 GOTO QV_USELESS
END

IF ~~ THEN BEGIN QV_TRICK
    SAY @48
    IF ~~ THEN GOTO QV_TRICK2
END

IF ~~ THEN BEGIN QV_TRICK2
    SAY @49
    IF ~~ THEN GOTO QV_PLEASE
END

IF ~~ THEN BEGIN QV_USELESS
    SAY @50
    IF ~~ THEN DO ~SetGlobal("QCVIRAGE_STATE","GLOBAL",1)~ EXIT
END

IF ~Global("QCVIRAGE_STATE","GLOBAL",2)~ THEN BEGIN QV_CURED
    SAY @51
    IF ~~ THEN REPLY @52 GOTO QV_REWARD_GOOD
    IF ~~ THEN REPLY @53 GOTO QV_REWARD_GOLD
END

IF ~~ THEN BEGIN QV_REWARD_GOOD
    SAY @54
    IF ~~ THEN DO ~AddExperienceParty(150) GiveItemCreate("POTN09",Player1,1,0,0) AddJournalEntry(@8,QUEST_DONE) SetGlobal("QCVIRAGE_STATE","GLOBAL",3)~ EXIT
END

IF ~~ THEN BEGIN QV_REWARD_GOLD
    SAY @55
    IF ~~ THEN DO ~AddExperienceParty(150) GivePartyGold(200) AddJournalEntry(@8,QUEST_DONE) SetGlobal("QCVIRAGE_STATE","GLOBAL",3)~ EXIT
END

// Companion reactions during the initial conversation.
APPEND JAHEIJ
IF ~~ THEN BEGIN QV_JAHEIRA
    SAY @56
    IF ~~ THEN EXTERN QCVIRAGE QV_INTRO_HELP
END

IF ~~ THEN BEGIN QV_JAHEIRA_HELP
    SAY @57
    IF ~~ THEN EXTERN QCVIRAGE QV_PLEASE
END
END

APPEND EDWINJ_
IF ~~ THEN BEGIN QV_EDWIN
    SAY @58
    IF ~~ THEN DO ~ActionOverride("QCVIRAGE",Polymorph(MAGE_MALE_HUMAN)) ActionOverride("QCVIRAGE",ChangeGeneral(Myself,HUMANOID)) ActionOverride("QCVIRAGE",ChangeRace(Myself,HUMAN)) ActionOverride("QCVIRAGE",ChangeClass(Myself,MAGE)) SetGlobal("QCVIRAGE_STATE","GLOBAL",2)~ EXTERN QCVIRAGE QV_CURED
END
END

APPEND DYNAHJ
IF ~~ THEN BEGIN QV_DYNAHEIR
    SAY @59
    IF ~~ THEN DO ~ActionOverride("QCVIRAGE",Polymorph(MAGE_MALE_HUMAN)) ActionOverride("QCVIRAGE",ChangeGeneral(Myself,HUMANOID)) ActionOverride("QCVIRAGE",ChangeRace(Myself,HUMAN)) ActionOverride("QCVIRAGE",ChangeClass(Myself,MAGE)) SetGlobal("QCVIRAGE_STATE","GLOBAL",2)~ EXTERN QCVIRAGE QV_CURED
END
END

APPEND NEERAJ_
IF ~~ THEN BEGIN QV_NEERA
    SAY @60
    IF ~~ THEN DO ~ActionOverride("QCVIRAGE",Polymorph(MAGE_MALE_HUMAN)) ActionOverride("QCVIRAGE",ChangeGeneral(Myself,HUMANOID)) ActionOverride("QCVIRAGE",ChangeRace(Myself,HUMAN)) ActionOverride("QCVIRAGE",ChangeClass(Myself,MAGE)) SetGlobal("QCVIRAGE_STATE","GLOBAL",2)~ EXTERN QCVIRAGE QV_CURED
END
END
