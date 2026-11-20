// Xvart leader: the five xvarts start neutral/friendly. No repeating reward.
BEGIN ~QCDXLEAD~
IF ~Global("QCDXALRM","GLOBAL",1) Global("QCDXREWD","GLOBAL",0) Dead("QCDTROL1") Dead("QCDTROL2")~ THEN BEGIN victory
  SAY @1
  IF ~~ THEN DO ~SetGlobal("QCDXREWD","GLOBAL",1) GiveItemCreate("RING06",Player1,1,0,0) EscapeArea()~ EXIT
END
IF ~Global("QCDXALRM","GLOBAL",0)~ THEN BEGIN alarm
  SAY @2
  IF ~~ THEN DO ~SetGlobal("QCDXALRM","GLOBAL",1)~ EXIT
END
IF ~Global("QCDXALRM","GLOBAL",1)~ THEN BEGIN still_fighting
  SAY @3
  IF ~~ THEN EXIT
END

// Rhianna warns about the strange creatures; if Nalia is present, they confer.
BEGIN ~QCDRHIAN~
IF ~Global("QCDRHIDN","GLOBAL",0) IsValidForPartyDialog("Nalia")~ THEN BEGIN sees_nalia
  SAY @4
  IF ~~ THEN EXTERN ~NALIAJ~ QCDRNAL1
END
IF ~Global("QCDRHIDN","GLOBAL",0) !IsValidForPartyDialog("Nalia")~ THEN BEGIN alone
  SAY @5
  IF ~~ THEN DO ~SetGlobal("QCDRHIDN","GLOBAL",1) EscapeArea()~ EXIT
END
IF ~True()~ THEN BEGIN repeat
  SAY @6
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN hid
  SAY @7
  IF ~~ THEN EXTERN ~NALIAJ~ QCDRNAL3
END
IF ~~ THEN BEGIN things
  SAY @8
  IF ~~ THEN EXTERN ~NALIAJ~ QCDRNAL4
END
IF ~~ THEN BEGIN farther
  SAY @9
  IF ~~ THEN EXTERN ~NALIAJ~ QCDRNAL5
END
IF ~~ THEN BEGIN afraid
  SAY @10
  IF ~~ THEN EXTERN ~NALIAJ~ QCDRNAL6
END
IF ~~ THEN BEGIN goodbye
  SAY @11
  IF ~~ THEN DO ~SetGlobal("QCDRHIDN","GLOBAL",1) EscapeArea()~ EXIT
END

APPEND ~NALIAJ~
IF ~~ THEN BEGIN QCDRNAL1
  SAY @12
  IF ~~ THEN EXTERN ~QCDRHIAN~ hid
END
IF ~~ THEN BEGIN QCDRNAL3
  SAY @13
  IF ~~ THEN EXTERN ~QCDRHIAN~ things
END
IF ~~ THEN BEGIN QCDRNAL4
  SAY @14
  IF ~~ THEN EXTERN ~QCDRHIAN~ farther
END
IF ~~ THEN BEGIN QCDRNAL5
  SAY @15
  IF ~~ THEN EXTERN ~QCDRHIAN~ afraid
END
IF ~~ THEN BEGIN QCDRNAL6
  SAY @16
  IF ~~ THEN EXTERN ~QCDRHIAN~ goodbye
END
END
