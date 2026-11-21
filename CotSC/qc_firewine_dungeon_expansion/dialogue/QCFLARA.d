BEGIN QCFLARA

IF ~Global("QCFLaraState","LOCALS",1)~ THEN BEGIN FIRST
  SAY @1
  IF ~~ THEN DO ~SetGlobal("QCFLaraState","LOCALS",2) EscapeArea()~ EXIT
END
