BEGIN QCCADOK

IF ~Global("QCCADOK_TALKED","LOCALS",1)~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 3
  IF ~~ THEN REPLY @4 GOTO 5
  IF ~~ THEN REPLY @5 GOTO 7
END

IF ~~ THEN BEGIN 1
  SAY @6
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN REPLY @8 GOTO 1
  IF ~~ THEN REPLY @9 GOTO 3
  IF ~~ THEN REPLY @10 GOTO 5
  IF ~~ THEN REPLY @11 GOTO 7
END

IF ~~ THEN BEGIN 3
  SAY @12
  IF ~~ THEN GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY @13
  IF ~~ THEN REPLY @14 GOTO 1
  IF ~~ THEN REPLY @15 GOTO 3
  IF ~~ THEN REPLY @16 GOTO 5
  IF ~~ THEN REPLY @17 GOTO 7
END

IF ~~ THEN BEGIN 5
  SAY @18
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @19
  IF ~~ THEN REPLY @20 GOTO 1
  IF ~~ THEN REPLY @21 GOTO 3
  IF ~~ THEN REPLY @22 GOTO 5
  IF ~~ THEN REPLY @23 GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @24
  IF ~~ THEN REPLY @25 GOTO 8
  IF ~~ THEN REPLY @26 GOTO 10
END

IF ~~ THEN BEGIN 8
  SAY @27
  IF ~~ THEN REPLY @28 GOTO 8_END
END

IF ~~ THEN BEGIN 8_END
  SAY @29
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 10
  SAY @30
  IF ~~ THEN DO ~Enemy() RunAwayFromNoLeaveArea(Player1,120)~ EXIT
END


// Cadok party interjections. Use I_C_T3, the same multi-condition
// interjection mechanism used by the verified Better Immersion dialogues.
// State 1 = QCA_CONVERTED; state 5 = QCA_HELP.

I_C_T3 ~QCCADOK~ 1 QCCADOK_REACT_CONVERTED
  == ~JAHEIJ~ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @31
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @32
  == ~BRANWJ~ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @33
  == ~TIAXJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @34
  == ~SKIEJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @35
  == ~GARRIJ~ IF ~InParty("Garrick") InMyArea("Garrick") !StateCheck("Garrick",CD_STATE_NOTVALID)~ THEN @36
  == ~MONTAJ~ IF ~InParty("Montaron") InMyArea("Montaron") !StateCheck("Montaron",CD_STATE_NOTVALID)~ THEN @37
  == ~SHARTJ~ IF ~InParty("SharTeel") InMyArea("SharTeel") !StateCheck("SharTeel",CD_STATE_NOTVALID)~ THEN @38
  == ~MINSCJ_~ IF ~IsValidForPartyDialog("Minsc")~ THEN @39
  == ~IMOEN2_~ IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @40
END

I_C_T3 ~QCCADOK~ 5 QCCADOK_REACT_HELP
  == ~KAGAIJ~ IF ~InParty("Kagain") InMyArea("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @41
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @42
END
