// One uninterrupted exchange, triggered by Dark Khalid; never assigns his CRE Imoen's scriptname.
BEGIN ~QCJJAHE~
IF ~False()~ THEN BEGIN dormant
  SAY @1
  IF ~~ THEN EXIT
END

BEGIN ~QCJKHAL~

CHAIN IF ~Global("QCJ_FIGHT","GLOBAL",0) IsValidForPartyDialog("Jaheira") InParty("Imoen2")~ THEN ~QCJKHAL~ BOTH
  @2
  == ~JAHEIRAJ~
     @3
  == ~QCJJAHE~
     @4
  == ~QCJJAHE~
     @5
  == ~IMOEN2J~
     @6
  == ~JAHEIRAJ~
     @7
  == ~QCJKHAL~
     @8
  == ~JAHEIRAJ~
     @9
  == ~QCJJAHE~
     @10
  == ~QCJKHAL~
     @11
END
  IF ~~ THEN DO ~SetGlobal("QCJ_FIGHT","GLOBAL",1)~ EXIT

CHAIN IF ~Global("QCJ_FIGHT","GLOBAL",0) IsValidForPartyDialog("Jaheira") !InParty("Imoen2") !InParty("Imoen")~ THEN ~QCJKHAL~ JAH
  @12
  == ~JAHEIRAJ~
     @13
  == ~QCJJAHE~
     @14
  == ~QCJJAHE~
     @15
  == ~QCJJAHE~
     @16
  == ~QCJKHAL~
     @17
END
  IF ~~ THEN DO ~SetGlobal("QCJ_FIGHT","GLOBAL",1)~ EXIT

CHAIN IF ~Global("QCJ_FIGHT","GLOBAL",0) !IsValidForPartyDialog("Jaheira") InParty("Imoen2")~ THEN ~QCJKHAL~ IMO
  @18
  == ~QCJJAHE~
     @19
  == ~QCJJAHE~
     @20
  == ~IMOEN2J~
     @21
  == ~QCJJAHE~
     @22
  == ~QCJKHAL~
     @23
END
  IF ~~ THEN DO ~SetGlobal("QCJ_FIGHT","GLOBAL",1)~ EXIT

CHAIN IF ~Global("QCJ_FIGHT","GLOBAL",0) !IsValidForPartyDialog("Jaheira") !InParty("Imoen2") !InParty("Imoen")~ THEN ~QCJKHAL~ ALONE
  @24
  == ~QCJJAHE~
     @25
  == ~QCJJAHE~
     @26
  == ~QCJJAHE~
     @27
  == ~QCJKHAL~
     @28
END
  IF ~~ THEN DO ~SetGlobal("QCJ_FIGHT","GLOBAL",1)~ EXIT


// Early-game Imoen dialogue variant.
CHAIN IF ~Global("QCJ_FIGHT","GLOBAL",0) IsValidForPartyDialog("Jaheira") InParty("Imoen") !InParty("Imoen2")~ THEN ~QCJKHAL~ BOTH_EARLY
  @29
  == ~JAHEIRAJ~
     @30
  == ~QCJJAHE~
     @31
  == ~QCJJAHE~
     @32
  == ~IMOENJ~
     @33
  == ~JAHEIRAJ~
     @34
  == ~QCJKHAL~
     @35
  == ~JAHEIRAJ~
     @36
  == ~QCJJAHE~
     @37
  == ~QCJKHAL~
     @38
END
  IF ~~ THEN DO ~SetGlobal("QCJ_FIGHT","GLOBAL",1)~ EXIT

// Early-game Imoen dialogue variant.
CHAIN IF ~Global("QCJ_FIGHT","GLOBAL",0) !IsValidForPartyDialog("Jaheira") InParty("Imoen") !InParty("Imoen2")~ THEN ~QCJKHAL~ IMO_EARLY
  @39
  == ~QCJJAHE~
     @40
  == ~QCJJAHE~
     @41
  == ~IMOENJ~
     @42
  == ~QCJJAHE~
     @43
  == ~QCJKHAL~
     @44
END
  IF ~~ THEN DO ~SetGlobal("QCJ_FIGHT","GLOBAL",1)~ EXIT
