BEGIN QCTHIEF

IF ~Global("QCThiefMet","GLOBAL",0)~ THEN BEGIN START
  SAY @21
  IF ~~ THEN REPLY @22 GOTO ACCUSE
  IF ~~ THEN REPLY @23 GOTO DECOR
  IF ~~ THEN REPLY @24 GOTO ALIKE1
END

// Keep the base dialogue entirely ordinary. Kivan's interjection is injected
// afterwards with INTERJECT_COPY_TRANS, once QCTHIEF.DLG already exists.
IF ~False()~ THEN BEGIN ACCUSE
  SAY @25
  IF ~~ THEN GOTO REALIZE
END

IF ~False()~ THEN BEGIN DECOR
  SAY @26
  IF ~~ THEN GOTO REALIZE
END

IF ~False()~ THEN BEGIN REALIZE
  SAY @27
  IF ~~ THEN REPLY @28 GOTO KAI
  IF ~~ THEN REPLY @29 GOTO WARNING
  IF ~~ THEN REPLY @30 GOTO BRAVE
  IF ~~ THEN REPLY @31 GOTO FIGHT
END

IF ~False()~ THEN BEGIN ALIKE1
  SAY @32
  IF ~~ THEN GOTO ALIKE2
END

IF ~False()~ THEN BEGIN ALIKE2
  SAY @33
  IF ~~ THEN REPLY @34 GOTO QCTUNLS
END

IF ~False()~ THEN BEGIN QCTUNLS
  SAY @35
  IF ~~ THEN DO ~SetGlobal("QCThiefMet","GLOBAL",1) EscapeArea()~ JOURNAL @3 EXIT
END

IF ~False()~ THEN BEGIN KAI
  SAY @36
  IF ~~ THEN DO ~SetGlobal("QCThiefMet","GLOBAL",1) EscapeArea()~ EXIT
END

IF ~False()~ THEN BEGIN WARNING
  SAY @37
  IF ~~ THEN DO ~SetGlobal("QCThiefMet","GLOBAL",1) EscapeArea()~ JOURNAL @3 EXIT
END

IF ~False()~ THEN BEGIN BRAVE
  SAY @38
  IF ~~ THEN DO ~SetGlobal("QCThiefMet","GLOBAL",1) EscapeArea()~ EXIT
END

IF ~False()~ THEN BEGIN FIGHT
  SAY @39
  IF ~~ THEN DO ~SetGlobal("QCThiefMet","GLOBAL",1) SetGlobal("QCThiefHostile","GLOBAL",1) Enemy() AttackReevaluate(Player1,30)~ EXIT
END
