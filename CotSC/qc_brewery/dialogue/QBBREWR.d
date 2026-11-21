// Forest Brewery v3.1: drinks + Larissa's one-time special order.
// QRH_LAR_ACCEPTED is set by Larissa in QRVLAR dialogue.
BEGIN ~QBBREWR~
IF ~True()~ THEN BEGIN 0
  SAY @1
  IF ~Global("QRH_LAR_ACCEPTED","GLOBAL",1) Global("QB_LAR_POTIONS","GLOBAL",0)~ THEN REPLY @2 GOTO order
  IF ~~ THEN REPLY @3 DO ~StartStore("QBRDRNK",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY @4 EXIT
END
IF ~~ THEN BEGIN order
  SAY @5
  IF ~PartyGoldGT(119)~ THEN REPLY @6 DO ~TakePartyGold(120) GiveItemCreate("QBLP01",Player1,1,0,0) GiveItemCreate("QBLP02",Player1,1,0,0) SetGlobal("QB_LAR_POTIONS","GLOBAL",1)~ GOTO purchased
  IF ~~ THEN REPLY @7 EXIT
END
IF ~~ THEN BEGIN purchased
  SAY @8
  IF ~~ THEN EXIT
END
