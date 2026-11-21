BEGIN QCZARA

// Zara the Mummy. The first encounter has the mummy-language exchange and party reactions.
IF ~Global("QCZARA_MET","LOCALS",0)~ THEN BEGIN QZ_INTRO
    SAY @1
    IF ~~ THEN REPLY @2 DO ~SetGlobal("QCZARA_MET","LOCALS",1)~ GOTO QZ_REPLY1
    IF ~~ THEN REPLY @3 DO ~SetGlobal("QCZARA_MET","LOCALS",1)~ GOTO QZ_REPLY2
    IF ~~ THEN REPLY @4 DO ~SetGlobal("QCZARA_MET","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN QZ_REPLY1
    SAY @5
    IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN EXTERN JAHEIJ QCZARA_JAHEIRA
    IF ~!InParty("Jaheira") InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCZARA_AJANTIS
    IF ~!InParty("Jaheira") !InParty("Ajantis") InParty("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN EXTERN BRANWJ QCZARA_BRANWEN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") InParty("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN EXTERN KAGAIJ QCZARA_KAGAIN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") InParty("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN EXTERN CORANJ QCZARA_CORAN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") InParty("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QCZARA_KIVAN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN GOTO QZ_MAIN
END

IF ~~ THEN BEGIN QZ_REPLY2
    SAY @6
    IF ~InParty("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN EXTERN JAHEIJ QCZARA_JAHEIRA
    IF ~!InParty("Jaheira") InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCZARA_AJANTIS
    IF ~!InParty("Jaheira") !InParty("Ajantis") InParty("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN EXTERN BRANWJ QCZARA_BRANWEN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") InParty("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN EXTERN KAGAIJ QCZARA_KAGAIN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") InParty("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN EXTERN CORANJ QCZARA_CORAN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") InParty("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QCZARA_KIVAN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Jaheira") !InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN GOTO QZ_MAIN
END

IF ~Global("QCZARA_MET","LOCALS",1)~ THEN BEGIN QZ_MAIN
    SAY @7
    IF ~~ THEN REPLY @8 DO ~StartStore("QCZARA",LastTalkedToBy())~ EXIT
    IF ~~ THEN REPLY @9 EXIT
END

APPEND JAHEIJ
IF ~~ THEN BEGIN QCZARA_JAHEIRA
    SAY @10
    IF ~InParty("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN EXTERN AJANTJ QCZARA_AJANTIS
    IF ~!InParty("Ajantis") InParty("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN EXTERN BRANWJ QCZARA_BRANWEN
    IF ~!InParty("Ajantis") !InParty("Branwen") InParty("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN EXTERN KAGAIJ QCZARA_KAGAIN
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") InParty("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN EXTERN CORANJ QCZARA_CORAN
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") InParty("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QCZARA_KIVAN
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Ajantis") !InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND AJANTJ
IF ~~ THEN BEGIN QCZARA_AJANTIS
    SAY @11
    IF ~InParty("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN EXTERN BRANWJ QCZARA_BRANWEN
    IF ~!InParty("Branwen") InParty("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN EXTERN KAGAIJ QCZARA_KAGAIN
    IF ~!InParty("Branwen") !InParty("Kagain") InParty("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN EXTERN CORANJ QCZARA_CORAN
    IF ~!InParty("Branwen") !InParty("Kagain") !InParty("Coran") InParty("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QCZARA_KIVAN
    IF ~!InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Branwen") !InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND BRANWJ
IF ~~ THEN BEGIN QCZARA_BRANWEN
    SAY @12
    IF ~InParty("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN EXTERN KAGAIJ QCZARA_KAGAIN
    IF ~!InParty("Kagain") InParty("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN EXTERN CORANJ QCZARA_CORAN
    IF ~!InParty("Kagain") !InParty("Coran") InParty("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QCZARA_KIVAN
    IF ~!InParty("Kagain") !InParty("Coran") !InParty("Kivan") InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Kagain") !InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND KAGAIJ
IF ~~ THEN BEGIN QCZARA_KAGAIN
    SAY @13
    IF ~InParty("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN EXTERN CORANJ QCZARA_CORAN
    IF ~!InParty("Coran") InParty("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QCZARA_KIVAN
    IF ~!InParty("Coran") !InParty("Kivan") InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Coran") !InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND CORANJ
IF ~~ THEN BEGIN QCZARA_CORAN
    SAY @14
    IF ~InParty("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN EXTERN KIVANJ QCZARA_KIVAN
    IF ~!InParty("Kivan") InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("Kivan") !InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Kivan") !InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND KIVANJ
IF ~~ THEN BEGIN QCZARA_KIVAN
    SAY @15
    IF ~InParty("SHARTEEL")~ THEN EXTERN SHARTJ QCZARA_SHARTEEL
    IF ~!InParty("SHARTEEL") InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("SHARTEEL") !InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("SHARTEEL") !InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND SHARTJ
IF ~~ THEN BEGIN QCZARA_SHARTEEL
    SAY @16
    IF ~InParty("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN EXTERN VICONJ QCZARA_VICONIA
    IF ~!InParty("Viconia") InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Viconia") !InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Viconia") !InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Viconia") !InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND VICONJ
IF ~~ THEN BEGIN QCZARA_VICONIA
    SAY @17
    IF ~InParty("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN EXTERN XANJ QCZARA_XAN
    IF ~!InParty("Xan") InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Xan") !InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Xan") !InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND XANJ
IF ~~ THEN BEGIN QCZARA_XAN
    SAY @18
    IF ~InParty("Neera") !StateCheck("Neera",CD_STATE_NOTVALID)~ THEN EXTERN NEERAJ_ QCZARA_NEERA
    IF ~!InParty("Neera") InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("Neera") !InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND NEERAJ_
IF ~~ THEN BEGIN QCZARA_NEERA
    SAY @19
    IF ~InParty("RASAAD")~ THEN EXTERN RASAADJ QCZARA_RASAAD
    IF ~!InParty("RASAAD")~ THEN EXTERN QCZARA QZ_MAIN
END
END

APPEND RASAADJ
IF ~~ THEN BEGIN QCZARA_RASAAD
    SAY @20
    IF ~~ THEN EXTERN QCZARA QZ_MAIN
END
END
