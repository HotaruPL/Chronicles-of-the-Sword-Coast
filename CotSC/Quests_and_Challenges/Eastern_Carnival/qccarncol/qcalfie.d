BEGIN QCALFIE

IF ~Global("QCALFIE_STATE","GLOBAL",0)~ THEN BEGIN QCAF_INTRO
    SAY @1
    IF ~~ THEN REPLY @2 GOTO QCAF_INTRO_MERC
    IF ~~ THEN REPLY @3 GOTO QCAF_INTRO_PAY
    IF ~~ THEN REPLY @4 EXIT
    IF ~~ THEN REPLY @5 EXIT
END

IF ~~ THEN BEGIN QCAF_INTRO_MERC
    SAY @6
    IF ~InParty("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN EXTERN ALORAJ QCAF_ALORA
    IF ~!InParty("Alora") InParty("Faldorn") !StateCheck("Faldorn",CD_STATE_NOTVALID)~ THEN EXTERN FALDOJ QCAF_FALDORN
    IF ~!InParty("Alora") !InParty("Faldorn") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN EXTERN MINSCJ_ QCAF_MINSC
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCAF_AJANTIS
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCAF_NEERA
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ QCAF_DYNAHEIR
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN GOTO QCAF_MAIN
END

IF ~~ THEN BEGIN QCAF_INTRO_PAY
    SAY @7
    IF ~InParty("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN EXTERN ALORAJ QCAF_ALORA
    IF ~!InParty("Alora") InParty("Faldorn") !StateCheck("Faldorn",CD_STATE_NOTVALID)~ THEN EXTERN FALDOJ QCAF_FALDORN
    IF ~!InParty("Alora") !InParty("Faldorn") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN EXTERN MINSCJ_ QCAF_MINSC
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCAF_AJANTIS
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCAF_NEERA
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ QCAF_DYNAHEIR
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Alora") !InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN GOTO QCAF_MAIN
END

IF ~Global("QCALFIE_STATE","GLOBAL",0)~ THEN BEGIN QCAF_MAIN
    SAY @38
    IF ~~ THEN REPLY @8 GOTO QCAF_JOB
    IF ~~ THEN REPLY @9 GOTO QCAF_MONEY
    IF ~~ THEN REPLY @10 DO ~SetGlobal("QCALFIE_STATE","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN QCAF_JOB
    SAY @15
    IF ~~ THEN GOTO QCAF_JOB2
END

IF ~~ THEN BEGIN QCAF_JOB2
    SAY @16
    IF ~~ THEN GOTO QCAF_JOB3
END

IF ~~ THEN BEGIN QCAF_JOB3
    SAY @17
    IF ~~ THEN REPLY @18 GOTO QCAF_ACCEPT
    IF ~~ THEN REPLY @19 GOTO QCAF_GARRISON
    IF ~~ THEN REPLY @20 GOTO QCAF_FURNITURE
    IF ~Dead("QCKOB01") Dead("QCKOB02") Dead("QCKOB03") Dead("QCKOB04") Dead("QCKSH01")~ THEN REPLY @43 GOTO QCAF_COMPLETE
    IF ~~ THEN REPLY @21 EXIT
END

IF ~~ THEN BEGIN QCAF_MONEY
    SAY @39
    IF ~~ THEN REPLY @41 GOTO QCAF_JOB
    IF ~~ THEN REPLY @42 DO ~SetGlobal("QCALFIE_STATE","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN QCAF_ACCEPT
    SAY @22
    IF ~~ THEN DO ~SetGlobal("QCALFIE_STATE","GLOBAL",2) AddJournalEntry(@50,QUEST)~ EXIT
END

IF ~~ THEN BEGIN QCAF_GARRISON
    SAY @23
    IF ~~ THEN GOTO QCAF_JOB3
END

IF ~~ THEN BEGIN QCAF_FURNITURE
    SAY @24
    IF ~~ THEN GOTO QCAF_JOB3
END

IF ~Global("QCALFIE_STATE","GLOBAL",2)~ THEN BEGIN QCAF_RETURN
    SAY @25
    IF ~Dead("QCKOB01") Dead("QCKOB02") Dead("QCKOB03") Dead("QCKOB04") Dead("QCKSH01")~ THEN REPLY @26 GOTO QCAF_COMPLETE
    IF ~~ THEN REPLY @27 EXIT
END

IF ~~ THEN BEGIN QCAF_COMPLETE
    SAY @28
    IF ~~ THEN DO ~
        SetGlobal("QCALFIE_STATE","GLOBAL",3)
        AddJournalEntry(@51,QUEST_DONE)
        AddExperienceParty(200)
        GiveGoldForce(70)
        GiveItemCreate("QCALUCK",Player1,1,0,0)
    ~ EXIT
END

IF ~Global("QCALFIE_STATE","GLOBAL",3)~ THEN BEGIN QCAF_DONE
    SAY @52
    IF ~~ THEN EXIT
END

APPEND ALORAJ
IF ~~ THEN BEGIN QCAF_ALORA
    SAY @29
    IF ~InParty("Faldorn") !StateCheck("Faldorn",CD_STATE_NOTVALID)~ THEN EXTERN FALDOJ QCAF_FALDORN
    IF ~!InParty("Faldorn") InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN EXTERN MINSCJ_ QCAF_MINSC
    IF ~!InParty("Faldorn") !InParty("Minsc") InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCAF_AJANTIS
    IF ~!InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCAF_NEERA
    IF ~!InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ QCAF_DYNAHEIR
    IF ~!InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Faldorn") !InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND FALDOJ
IF ~~ THEN BEGIN QCAF_FALDORN
    SAY @30
    IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN EXTERN MINSCJ_ QCAF_MINSC
    IF ~!InParty("Minsc") InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCAF_AJANTIS
    IF ~!InParty("Minsc") !InParty("Ajantis") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCAF_NEERA
    IF ~!InParty("Minsc") !InParty("Ajantis") !InParty("Neera") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ QCAF_DYNAHEIR
    IF ~!InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Minsc") !InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND MINSCJ_
IF ~~ THEN BEGIN QCAF_MINSC
    SAY @31
    IF ~InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCAF_AJANTIS
    IF ~!InParty("Ajantis") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCAF_NEERA
    IF ~!InParty("Ajantis") !InParty("Neera") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ QCAF_DYNAHEIR
    IF ~!InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Ajantis") !InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND AJANTJ
IF ~~ THEN BEGIN QCAF_AJANTIS
    SAY @32
    IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCAF_NEERA
    IF ~!InParty("Neera") InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ QCAF_DYNAHEIR
    IF ~!InParty("Neera") !InParty("Dynaheir") InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Neera") !InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND NEERAJ_
IF ~~ THEN BEGIN QCAF_NEERA
    SAY @33
    IF ~InParty("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN EXTERN DYNAHJ QCAF_DYNAHEIR
    IF ~!InParty("Dynaheir") InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Dynaheir") !InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Dynaheir") !InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND DYNAHJ
IF ~~ THEN BEGIN QCAF_DYNAHEIR
    SAY @34
    IF ~InParty("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN EXTERN GARRIJ QCAF_GARRICK
    IF ~!InParty("Garrick") InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Garrick") !InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Garrick") !InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Garrick") !InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND GARRIJ
IF ~~ THEN BEGIN QCAF_GARRICK
    SAY @35
    IF ~InParty("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN EXTERN EDWINJ_ QCAF_EDWIN
    IF ~!InParty("Edwin") InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Edwin") !InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Edwin") !InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND EDWINJ_
IF ~~ THEN BEGIN QCAF_EDWIN
    SAY @36
    IF ~InParty("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN EXTERN SAFANJ QCAF_SAFANA
    IF ~!InParty("Safana") IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!InParty("Safana") !IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

APPEND SAFANJ
IF ~~ THEN BEGIN QCAF_SAFANA
    SAY @37
    IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2_ QCAF_IMOEN
    IF ~!IsValidForPartyDialog("Imoen2")~ THEN EXTERN QCALFIE QCAF_MAIN
END
END

// Optional BG1 Imoen interjection after the existing elephant reactions.
// The protagonist's single response prompts Imoen's follow-up, then Alfie
// continues his normal dialogue and player choice tree.
APPEND ~IMOEN2_~
IF ~~ THEN BEGIN QCAF_IMOEN
    SAY @53
    IF ~~ THEN REPLY @54 GOTO QCAF_IMOEN_PLEA
END
IF ~~ THEN BEGIN QCAF_IMOEN_PLEA
    SAY @55
    IF ~~ THEN EXTERN QCALFIE QCAF_MAIN
END
END
