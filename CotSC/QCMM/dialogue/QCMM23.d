BEGIN ~QCMM23~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS23",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @3 EXIT
END
