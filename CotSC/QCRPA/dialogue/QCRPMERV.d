BEGIN ~QCRPMERV~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN FirstMeeting
  SAY @1
  IF ~~ THEN REPLY @2 GOTO Menu
  IF ~~ THEN REPLY @3 EXIT
END

IF ~True()~ THEN BEGIN ReturnMeeting
  SAY @4
  IF ~~ THEN REPLY @5 GOTO Menu
  IF ~~ THEN REPLY @6 EXIT
END

IF ~~ THEN BEGIN Menu
  SAY @7
  IF ~~ THEN REPLY @8 GOTO Group1
  IF ~~ THEN REPLY @9 GOTO Group2
  IF ~~ THEN REPLY @10 GOTO Group3
  IF ~~ THEN REPLY @11 GOTO Group4
  IF ~~ THEN REPLY @12 EXIT
END

IF ~~ THEN BEGIN Group1
  SAY @13
  IF ~~ THEN REPLY @14 DO ~ReputationSet(1)~ GOTO Done
  IF ~~ THEN REPLY @15 DO ~ReputationSet(2)~ GOTO Done
  IF ~~ THEN REPLY @16 DO ~ReputationSet(3)~ GOTO Done
  IF ~~ THEN REPLY @17 DO ~ReputationSet(4)~ GOTO Done
  IF ~~ THEN REPLY @18 DO ~ReputationSet(5)~ GOTO Done
  IF ~~ THEN REPLY @19 GOTO Menu
  IF ~~ THEN REPLY @20 EXIT
END

IF ~~ THEN BEGIN Group2
  SAY @21
  IF ~~ THEN REPLY @22 DO ~ReputationSet(6)~ GOTO Done
  IF ~~ THEN REPLY @23 DO ~ReputationSet(7)~ GOTO Done
  IF ~~ THEN REPLY @24 DO ~ReputationSet(8)~ GOTO Done
  IF ~~ THEN REPLY @25 DO ~ReputationSet(9)~ GOTO Done
  IF ~~ THEN REPLY @26 DO ~ReputationSet(10)~ GOTO Done
  IF ~~ THEN REPLY @27 GOTO Menu
  IF ~~ THEN REPLY @28 EXIT
END

IF ~~ THEN BEGIN Group3
  SAY @29
  IF ~~ THEN REPLY @30 DO ~ReputationSet(11)~ GOTO Done
  IF ~~ THEN REPLY @31 DO ~ReputationSet(12)~ GOTO Done
  IF ~~ THEN REPLY @32 DO ~ReputationSet(13)~ GOTO Done
  IF ~~ THEN REPLY @33 DO ~ReputationSet(14)~ GOTO Done
  IF ~~ THEN REPLY @34 DO ~ReputationSet(15)~ GOTO Done
  IF ~~ THEN REPLY @35 GOTO Menu
  IF ~~ THEN REPLY @36 EXIT
END

IF ~~ THEN BEGIN Group4
  SAY @37
  IF ~~ THEN REPLY @38 DO ~ReputationSet(16)~ GOTO Done
  IF ~~ THEN REPLY @39 DO ~ReputationSet(17)~ GOTO Done
  IF ~~ THEN REPLY @40 DO ~ReputationSet(18)~ GOTO Done
  IF ~~ THEN REPLY @41 DO ~ReputationSet(19)~ GOTO Done
  IF ~~ THEN REPLY @42 DO ~ReputationSet(20)~ GOTO Done
  IF ~~ THEN REPLY @43 GOTO Menu
  IF ~~ THEN REPLY @44 EXIT
END

IF ~~ THEN BEGIN Done
  SAY @45
  IF ~~ THEN REPLY @46 GOTO Menu
  IF ~~ THEN REPLY @47 EXIT
END

