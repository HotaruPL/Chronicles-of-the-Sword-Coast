BEGIN ~QCHIMTR~
IF ~Global("QCH_INTRO_DONE","GLOBAL",1) Global("QCH_IMINTRO","GLOBAL",1)~ THEN BEGIN intro
  SAY @1
  ++ @2 GOTO intro_good
  ++ @3 GOTO intro_rough
END
IF ~Global("QCH_ROOM_DONE","GLOBAL",1) Global("QCH_IMROOM","GLOBAL",1)~ THEN BEGIN room
  SAY @4
  ++ @5 GOTO room_long
  ++ @6 DO ~SetGlobal("QCH_IMROOM","GLOBAL",2)~ EXIT
END
IF ~Global("QCH_DREPP_DEAD","GLOBAL",1) Global("QCH_IMDREPP","GLOBAL",1)~ THEN BEGIN drepp
  SAY @7
  ++ @8 GOTO drepp_long
  ++ @9 DO ~SetGlobal("QCH_IMDREPP","GLOBAL",2)~ EXIT
END
IF ~False()~ THEN BEGIN intro_good
  SAY @10
  IF ~~ THEN DO ~SetGlobal("QCH_IMINTRO","GLOBAL",2)~ EXIT
END
IF ~False()~ THEN BEGIN intro_rough
  SAY @11
  IF ~~ THEN DO ~SetGlobal("QCH_IMINTRO","GLOBAL",2)~ EXIT
END
IF ~False()~ THEN BEGIN room_long
  SAY @12
  ++ @13 GOTO room_last
  ++ @14 DO ~SetGlobal("QCH_IMROOM","GLOBAL",2)~ EXIT
END
IF ~False()~ THEN BEGIN room_last
  SAY @15
  IF ~~ THEN DO ~SetGlobal("QCH_IMROOM","GLOBAL",2)~ EXIT
END
IF ~False()~ THEN BEGIN drepp_long
  SAY @16
  IF ~~ THEN DO ~SetGlobal("QCH_IMDREPP","GLOBAL",2)~ EXIT
END
