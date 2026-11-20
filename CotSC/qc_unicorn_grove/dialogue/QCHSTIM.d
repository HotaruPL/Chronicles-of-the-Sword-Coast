BEGIN ~QCHSTIM~
IF ~Global("QCH_ST_IMO","GLOBAL",1)~ THEN BEGIN intro
 SAY @1
 ++ @2 GOTO gentle
 ++ @3 GOTO dark
END
IF ~False()~ THEN BEGIN gentle
 SAY @4
 IF ~~ THEN DO ~SetGlobal("QCH_ST_IMO","GLOBAL",2)~ EXIT
END
IF ~False()~ THEN BEGIN dark
 SAY @5
 IF ~~ THEN DO ~SetGlobal("QCH_ST_IMO","GLOBAL",2)~ EXIT
END
