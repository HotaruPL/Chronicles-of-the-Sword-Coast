// Old Friend in Saradush v1.2 — explicit-dialogue transitions.
// Every optional interjection has both a present and absent path.
// No conditional CHAIN sections; every spoken line has an unconditional
// onward transition or an explicitly mutually exclusive pair.
// Portal uses his own DLG and never changes companions' DLG assignments.

BEGIN ~QOPORT~

IF ~Global("QOP_DONE","GLOBAL",0)~ THEN BEGIN Opening
  SAY @1
  ++ @2 GOTO Recognition
  ++ @3 GOTO Recognition
  ++ @4 GOTO Impatient
END

IF ~~ THEN BEGIN Recognition
  SAY @5
  IF ~~ THEN GOTO Watching
END

IF ~~ THEN BEGIN Impatient
  SAY @6
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN VICON25J QOPViconia
  IF ~!IsValidForPartyDialog("Viconia")~ THEN GOTO RasaadGate
END

IF ~~ THEN BEGIN RasaadCheck
  SAY @7
  IF ~~ THEN GOTO Watching
END

// This intermediate line is spoken only on the impatient branch; it keeps
// Rasaad's interjection separate from the same Portal line which follows it.
IF ~~ THEN BEGIN RasaadGate
  SAY @8
  IF ~IsValidForPartyDialog("Rasaad")~ THEN EXTERN RASAA25J QOPRasaad
  IF ~!IsValidForPartyDialog("Rasaad")~ THEN GOTO RasaadCheck
END

IF ~~ THEN BEGIN ViconiaBridge
  SAY @9
  IF ~~ THEN GOTO RasaadGate
END

IF ~~ THEN BEGIN Watching
  SAY @10
  IF ~~ THEN GOTO Coin
END

IF ~~ THEN BEGIN Coin
  SAY @11
  IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN MAZZY25J QOPMazzy
  IF ~!IsValidForPartyDialog("Mazzy")~ THEN GOTO Catalyst
END

IF ~~ THEN BEGIN Catalyst
  SAY @12
  ++ @13 GOTO Revelation
END

IF ~~ THEN BEGIN Revelation
  SAY @14
  IF ~IsValidForPartyDialog("Imoen2")~ THEN GOTO ImoenNotice
  IF ~!IsValidForPartyDialog("Imoen2")~ THEN GOTO Companions
END

IF ~~ THEN BEGIN ImoenNotice
  SAY @15
  IF ~~ THEN EXTERN IMOEN25J QOPImoen
END

IF ~~ THEN BEGIN ImoenComfort
  SAY @16
  IF ~~ THEN GOTO Companions
END

IF ~~ THEN BEGIN Companions
  SAY @17
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEI25J QOPJaheira1
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN GOTO SarevokGate
END

IF ~~ THEN BEGIN JaheiraAnswer
  SAY @18
  IF ~~ THEN EXTERN JAHEI25J QOPJaheira2
END

IF ~~ THEN BEGIN JaheiraFarewell
  SAY @19
  IF ~~ THEN GOTO SarevokGate
END

IF ~~ THEN BEGIN SarevokGate
  SAY @20
  IF ~IsValidForPartyDialog("Sarevok")~ THEN EXTERN SAREV25J QOPSarevok
  IF ~!IsValidForPartyDialog("Sarevok")~ THEN GOTO Counsel
END

IF ~~ THEN BEGIN SarevokAnswer
  SAY @21
  IF ~~ THEN GOTO Counsel
END

IF ~~ THEN BEGIN Counsel
  SAY @22
  IF ~~ THEN GOTO Gift
END

IF ~~ THEN BEGIN Gift
  SAY @23
  IF ~~ THEN DO ~GiveItemCreate("QOPHELM",Player1,1,1,1)~ GOTO Farewell
END

IF ~~ THEN BEGIN Farewell
  SAY @24
  IF ~~ THEN DO ~SetGlobal("QOP_DONE","GLOBAL",1) EscapeAreaDestroy(10)~ EXIT
END

// Optional interjections are explicit APPEND states in companions' normal
// ToB joined-dialogue files.  Each one always returns to QOPORT's next state.
APPEND VICON25J
  IF ~~ THEN BEGIN QOPViconia
    SAY @25
    IF ~~ THEN EXTERN QOPORT ViconiaBridge
  END
END

APPEND RASAA25J
  IF ~~ THEN BEGIN QOPRasaad
    SAY @26
    IF ~~ THEN EXTERN QOPORT RasaadCheck
  END
END

APPEND MAZZY25J
  IF ~~ THEN BEGIN QOPMazzy
    SAY @27
    IF ~~ THEN EXTERN QOPORT Catalyst
  END
END

APPEND IMOEN25J
  IF ~~ THEN BEGIN QOPImoen
    SAY @28
    IF ~~ THEN EXTERN QOPORT ImoenComfort
  END
END

APPEND JAHEI25J
  IF ~~ THEN BEGIN QOPJaheira1
    SAY @29
    IF ~~ THEN EXTERN QOPORT JaheiraAnswer
  END
  IF ~~ THEN BEGIN QOPJaheira2
    SAY @30
    IF ~~ THEN EXTERN QOPORT JaheiraFarewell
  END
END

APPEND SAREV25J
  IF ~~ THEN BEGIN QOPSarevok
    SAY @31
    IF ~~ THEN EXTERN QOPORT SarevokAnswer
  END
END
