BEGIN ~QCMM01~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS01",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @3 EXIT
END
