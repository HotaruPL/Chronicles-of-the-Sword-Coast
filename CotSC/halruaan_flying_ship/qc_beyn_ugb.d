BEGIN QCBEYUGB
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN DO ~GiveItemCreate("RING40",Player1,1,0,0) SetGlobal("QCBeynUGBTalked","GLOBAL",1) EscapeArea()~ EXIT
END
