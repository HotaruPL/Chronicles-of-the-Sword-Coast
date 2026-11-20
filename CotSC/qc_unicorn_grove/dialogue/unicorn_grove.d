BEGIN ~QCUSIR~
IF ~True()~ THEN BEGIN initial
  SAY @400
  ++ @401 GOTO eaglehorn
  ++ @402 GOTO shard1
  ++ @403 EXTERN ~QCUSIR~ look
  ++ @404 GOTO finish
END
IF ~False()~ THEN BEGIN more
  SAY @405
  ++ @406 GOTO eaglehorn
  ++ @407 GOTO shard1
  ++ @408 EXTERN ~QCUSIR~ look
  ++ @409 GOTO finish
END
IF ~False()~ THEN BEGIN eaglehorn
  SAY @410
  IF ~~ THEN GOTO more
END
IF ~False()~ THEN BEGIN shard1
  SAY @411
  IF ~~ THEN DO ~SetGlobal("QCU_SIRSH","GLOBAL",1)~ GOTO shard2
END
IF ~False()~ THEN BEGIN shard2
  SAY @412
  IF ~~ THEN GOTO shard3
END
IF ~False()~ THEN BEGIN shard3
  SAY @413
  ++ @414 GOTO eaglehorn
  ++ @415 GOTO shard1
  ++ @416 EXTERN ~QCUSIR~ look
  ++ @417 GOTO finish
END
IF ~False()~ THEN BEGIN finish
  SAY @418
  IF ~~ THEN EXIT
END
CHAIN IF ~False()~ THEN ~QCUSIR~ look
  @419
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Aerie")~ THEN
    @420
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Jaheira")~ THEN
    @421
  == ~ANOMENJ~ IF ~IsValidForPartyDialog("Anomen")~ THEN
    @422
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Anomen") IsValidForPartyDialog("Jaheira")~ THEN
    @423
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Viconia")~ THEN
    @424
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Neera")~ THEN
    @425
  == ~NEERAJ~ IF ~IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Neera")~ THEN
    @426
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Neera")~ THEN
    @427
  == ~HAERDAJ~ IF ~IsValidForPartyDialog("HaerDalis")~ THEN
    @428
  == ~CERNDJ~ IF ~IsValidForPartyDialog("Cernd")~ THEN
    @429
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan")~ THEN
    @430
  == ~EDWINJ~ IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Edwin")~ THEN
    @431
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Aerie")~ THEN
    @432
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Jaheira")~ THEN
    @433
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Jaheira")~ THEN
    @434
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Jaheira")~ THEN
    @435
  == ~MAZZYJ~ IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Jaheira") IsValidForPartyDialog("Mazzy")~ THEN
    @436
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Jaheira") IsValidForPartyDialog("Mazzy")~ THEN
    @437
  == ~MINSCJ~ IF ~IsValidForPartyDialog("Minsc")~ THEN
    @438
  == ~KELDORJ~ IF ~IsValidForPartyDialog("Keldorn")~ THEN
    @439
  == ~MAZZYJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN
    @440
  == ~DORNJ~ IF ~IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Aerie")~ THEN
    @441
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Aerie")~ THEN
    @442
  == ~DORNJ~ IF ~IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Aerie")~ THEN
    @443
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Aerie")~ THEN
    @444
  == ~DORNJ~ IF ~IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Aerie")~ THEN
    @445
  == ~VALYGARJ~ IF ~IsValidForPartyDialog("Valygar")~ THEN
    @446
END
  IF ~InParty("Imoen2")~ THEN EXTERN ~IMOEN2J~ QCU_IMOEN
  IF ~InParty("Imoen") !InParty("Imoen2")~ THEN EXTERN ~IMOENJ~ QCU_IMOEN_EARLY
  IF ~!InParty("Imoen2") !InParty("Imoen")~ THEN EXTERN ~QCUSIR~ advice
APPEND ~IMOEN2J~
IF ~False()~ THEN BEGIN QCU_IMOEN
  SAY @447
  ++ @448 GOTO QCU_IMOEN_YES
  ++ @449 GOTO QCU_IMOEN_NO
END
IF ~False()~ THEN BEGIN QCU_IMOEN_YES
  SAY @450
  IF ~~ THEN EXTERN ~QCUSIR~ advice
END
IF ~False()~ THEN BEGIN QCU_IMOEN_NO
  SAY @451
  IF ~~ THEN EXTERN ~QCUSIR~ advice
END
END
APPEND ~IMOENJ~
IF ~False()~ THEN BEGIN QCU_IMOEN_EARLY
  SAY @452
  ++ @453 GOTO QCU_IMOEN_YES_EARLY
  ++ @454 GOTO QCU_IMOEN_NO_EARLY
END
IF ~False()~ THEN BEGIN QCU_IMOEN_YES_EARLY
  SAY @455
  IF ~~ THEN EXTERN ~QCUSIR~ advice
END
IF ~False()~ THEN BEGIN QCU_IMOEN_NO_EARLY
  SAY @456
  IF ~~ THEN EXTERN ~QCUSIR~ advice
END
END
APPEND ~QCUSIR~
IF ~False()~ THEN BEGIN advice
  SAY @457
  IF ~~ THEN GOTO more
END
END
BEGIN ~QCUUNIC~
IF ~True()~ THEN BEGIN notice
  SAY @458
  IF ~~ THEN EXIT
END
