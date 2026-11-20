BEGIN QCKAYA

IF ~True()~ THEN BEGIN START
  SAY @1
  IF ~~ THEN REPLY @2 GOTO WHO
  IF ~~ THEN REPLY @3 GOTO SHH
  IF ~~ THEN REPLY @4 GOTO MORON
END

IF ~False()~ THEN BEGIN WHO
  SAY @5
  IF ~~ THEN DO ~GiveItemCreate("QCKAYBOD",Player1,1,0,0) SetGlobal("QCKayaFound","GLOBAL",1) DestroySelf()~ EXIT
END

IF ~False()~ THEN BEGIN SHH
  SAY @6
  IF ~~ THEN DO ~GiveItemCreate("QCKAYBOD",Player1,1,0,0) SetGlobal("QCKayaFound","GLOBAL",1) DestroySelf()~ EXIT
END

IF ~False()~ THEN BEGIN MORON
  SAY @7
  IF ~~ THEN DO ~GiveItemCreate("QCKAYBOD",Player1,1,0,0) SetGlobal("QCKayaFound","GLOBAL",1) DestroySelf()~ EXIT
END
