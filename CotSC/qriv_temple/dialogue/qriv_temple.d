// River District 3.4 - Temple of Helm: Bassilus, Senyan
// The player's original branching story, polished for grammar and coherence.
// DLG states compile in one pass and refer only to local labels.

BEGIN ~QRBSLUS~
IF ~Global("QRB_BASS_MET","GLOBAL",0)~ THEN BEGIN greeting
  SAY @1
  IF ~~ THEN REPLY @2 DO ~SetGlobal("QRB_BASS_MET","GLOBAL",1) SetGlobal("QRB_KNOWS_BASS","GLOBAL",1)~ EXTERN ~QRBSLUS~ recall
  IF ~~ THEN REPLY @3 DO ~SetGlobal("QRB_BASS_MET","GLOBAL",1) SetGlobal("QRB_KNOWS_BASS","GLOBAL",1)~ EXTERN ~QRBSLUS~ recall
  IF ~~ THEN REPLY @4 DO ~SetGlobal("QRB_BASS_MET","GLOBAL",1)~ GOTO stranger
END
IF ~Global("QRB_BASS_MET","GLOBAL",1)~ THEN BEGIN repeat
  SAY @5
  IF ~~ THEN REPLY @6 GOTO keepbusy
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN recall
  SAY @7
  IF ~~ THEN EXTERN ~QRBSLUS~ QRB_RECOGNISE_PARTY
END
IF ~~ THEN BEGIN from_cyric
  SAY @8
  IF ~~ THEN GOTO from_cyric2
  IF ~InParty("Dorn")~ THEN EXTERN IF_FILE_EXISTS ~DORNJ~ QRB_DORN_WARN
END
IF ~~ THEN BEGIN from_cyric2
  SAY @9
  IF ~~ THEN GOTO known_choices
END
IF ~~ THEN BEGIN known_choices
  SAY @10
  IF ~~ THEN REPLY @11 GOTO known_resurrected
  IF ~~ THEN REPLY @12 GOTO not_helmite
  IF ~~ THEN REPLY @13 GOTO known_warning
END
IF ~~ THEN BEGIN stranger
  SAY @14
  IF ~~ THEN GOTO stranger2
END
IF ~~ THEN BEGIN stranger2
  SAY @15
  IF ~~ THEN GOTO stranger3
END
IF ~~ THEN BEGIN stranger3
  SAY @16
  IF ~~ THEN GOTO rescued2
END
IF ~~ THEN BEGIN known_resurrected
  SAY @17
  IF ~~ THEN GOTO rescued2
END
IF ~~ THEN BEGIN rescued2
  SAY @18
  IF ~~ THEN GOTO rescued3
END
IF ~~ THEN BEGIN rescued3
  SAY @19
  IF ~~ THEN EXTERN ~QRBSLUS~ QRB_KELDORN_CHAIN
END
IF ~~ THEN BEGIN after_penance
  SAY @20
  IF ~~ THEN GOTO after_penance2
END
IF ~~ THEN BEGIN after_penance2
  SAY @21
  IF ~~ THEN GOTO closing_choices
END
IF ~~ THEN BEGIN closing_choices
  SAY @22
  IF ~Global("QRB_KNOWS_BASS","GLOBAL",1)~ THEN REPLY @23 GOTO generous
  IF ~Global("QRB_KNOWS_BASS","GLOBAL",0)~ THEN REPLY @24 GOTO kind_unacquainted
  IF ~Global("QRB_KNOWS_BASS","GLOBAL",1)~ THEN REPLY @25 GOTO hopeful_sword
  IF ~Global("QRB_KNOWS_BASS","GLOBAL",0)~ THEN REPLY @26 GOTO hopeful_plain
  IF ~~ THEN REPLY @27 GOTO leave_disappointed
END
IF ~~ THEN BEGIN generous
  SAY @28
  IF ~~ THEN DO ~SetGlobal("QRB_SABER_GIVEN","GLOBAL",1) GiveItemCreate("QRBSABR",Player1,1,0,0)~ EXIT
END
IF ~~ THEN BEGIN kind_unacquainted
  SAY @29
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN hopeful_sword
  SAY @30
  IF ~~ THEN DO ~SetGlobal("QRB_SABER_GIVEN","GLOBAL",1) GiveItemCreate("QRBSABR",Player1,1,0,0)~ EXIT
END
IF ~~ THEN BEGIN hopeful_plain
  SAY @31
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN leave_disappointed
  SAY @32
  IF ~~ THEN EXTERN ~QRBSLUS~ QRB_REJECT_COMPANIONS
END
IF ~~ THEN BEGIN not_helmite
  SAY @33
  IF ~~ THEN GOTO not_helmite_more
END
IF ~~ THEN BEGIN not_helmite_more
  SAY @34
  IF ~~ THEN REPLY @35 GOTO known_resurrected
  IF ~~ THEN REPLY @36 EXIT
  IF ~~ THEN REPLY @37 GOTO known_warning
END
IF ~~ THEN BEGIN known_warning
  SAY @38
  IF ~~ THEN EXTERN ~QRBSLUS~ QRB_IMOEN_RESPONSE
END
IF ~~ THEN BEGIN keepbusy
  SAY @39
  IF ~~ THEN EXIT
END

BEGIN ~QRSENYN~
// This trigger precedes True(), so a party carrying Hannibal's symbol
// can hand it over regardless of which temple services were used earlier.
IF ~Global("QH_SEN_REWARDED","GLOBAL",0) PartyHasItem("QHHSYM")~ THEN BEGIN hannibal_symbol
  SAY @40
  IF ~~ THEN REPLY @41 GOTO hannibal_proof
  IF ~~ THEN REPLY @42 GOTO start
END
IF ~~ THEN BEGIN hannibal_proof
  SAY @43
  IF ~~ THEN DO ~TakePartyItem("QHHSYM") DestroyItem("QHHSYM") SetGlobal("QH_SEN_REWARDED","GLOBAL",1) AddXPObject(Player1,4000) AddXPObject(Player2,4000) AddXPObject(Player3,4000) AddXPObject(Player4,4000) AddXPObject(Player5,4000) AddXPObject(Player6,4000)~ EXIT
END
IF ~True()~ THEN BEGIN start
  SAY @44
  IF ~~ THEN REPLY @45 DO ~StartStore("TEM0002",LastTalkedToBy())~ EXIT
  IF ~Global("QRB_BASS_MET","GLOBAL",1)~ THEN REPLY @46 GOTO bassilus
  IF ~~ THEN REPLY @47 EXIT
END
IF ~~ THEN BEGIN bassilus
  SAY @48
  IF ~~ THEN GOTO services
END
IF ~~ THEN BEGIN services
  SAY @49
  IF ~~ THEN REPLY @50 DO ~StartStore("TEM0002",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY @51 EXIT
END

// One dialogue-state chain per interjection cluster. Each state is compiled
// locally rather than linked to symbolic labels from earlier installs.
CHAIN ~QRBSLUS~ QRB_RECOGNISE_PARTY
  @52
  == ~JAHEIRAJ~ IF ~InParty("Jaheira")~ THEN
    @53
  == ~MINSCJ~ IF ~InParty("Minsc")~ THEN
    @54
  == ~NALIAJ~ IF ~InParty("Nalia")~ THEN
    @55
  == ~QRBSLUS~
    @56
END ~QRBSLUS~ from_cyric

CHAIN ~QRBSLUS~ QRB_KELDORN_CHAIN
  @57
  == ~KELDORJ~ IF ~InParty("Keldorn")~ THEN
    @58
  == ~QRBSLUS~
    @59
END ~QRBSLUS~ after_penance

CHAIN ~QRBSLUS~ QRB_REJECT_COMPANIONS
  @60
  == ~MAZZYJ~ IF ~InParty("Mazzy")~ THEN
    @61
EXIT

CHAIN ~QRBSLUS~ QRB_IMOEN_RESPONSE
  @62
  == ~IMOENJ~ IF ~InParty("Imoen")~ THEN
    @63
EXIT

APPEND IF_FILE_EXISTS ~DORNJ~
IF ~~ THEN BEGIN QRB_DORN_WARN
  SAY @64
  IF ~~ THEN EXTERN ~QRBSLUS~ from_cyric2
END
END
