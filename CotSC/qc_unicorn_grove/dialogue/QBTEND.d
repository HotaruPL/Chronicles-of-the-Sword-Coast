// Eaglehorn and Emhrys: final Unicorn Grove completion, dedicated DLGs.
BEGIN ~QBTREC~
IF ~False()~ THEN BEGIN dummy
  SAY @300
  IF ~~ THEN EXIT
END
IF ~Global("QBT_DONE","GLOBAL",1)~ THEN BEGIN already_done
  SAY @301
  IF ~~ THEN EXIT
END

IF ~False()~ THEN BEGIN HELL
  SAY @302
  IF ~~ THEN EXTERN ~QBTREC~ HELL_REPLY
END

IF ~False()~ THEN BEGIN PRICE
  SAY @303
  IF ~~ THEN GOTO REWARD
END

CHAIN IF ~Global("QBT_WOKEN","GLOBAL",1) Global("QBT_DONE","GLOBAL",0)~ THEN ~QBTREC~ WAKE
  @304
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan")~ THEN @305
  == ~QBTREC~ @306
END
  IF ~~ THEN REPLY @307 EXTERN ~QBTREC~ HELL
  IF ~~ THEN REPLY @308 EXTERN ~QBTREC~ UNICORNS
  IF ~~ THEN REPLY @309 EXTERN ~QBTREC~ PRICE

CHAIN ~QBTREC~ HELL_REPLY
  @310
  == ~IMOEN2J~ IF ~IsValidForPartyDialog("Imoen2")~ THEN @311
END
  IF ~~ THEN REPLY @312 EXTERN ~QBTREC~ REWARD
  IF ~~ THEN REPLY @313 EXTERN ~QBTREC~ REWARD

CHAIN ~QBTREC~ UNICORNS
  @314
  == ~DORNJ~ IF ~IsValidForPartyDialog("Dorn")~ THEN @315
  == ~QBTREC~ IF ~IsValidForPartyDialog("Dorn")~ THEN @316
END ~QBTREC~ REWARD

CHAIN ~QBTREC~ REWARD
  @317
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Jaheira")~ THEN @318
  == ~MAZZYJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN @319
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Viconia")~ THEN @320
  == ~QBTREC~ @321
END
  IF ~~ THEN DO ~SetGlobal("QBT_DONE","GLOBAL",1) AddXPObject(Player1,15000) AddXPObject(Player2,15000) AddXPObject(Player3,15000) AddXPObject(Player4,15000) AddXPObject(Player5,15000) AddXPObject(Player6,15000) GiveGoldForce(8000) EraseJournalEntry(@1) EraseJournalEntry(@100) EraseJournalEntry(@101) EraseJournalEntry(@102) EraseJournalEntry(@103) AddJournalEntry(@104,QUEST_DONE)~ EXIT

BEGIN ~QBTEMHR~
IF ~True()~ THEN BEGIN GREET
  SAY @322
  IF ~~ THEN EXIT
END
