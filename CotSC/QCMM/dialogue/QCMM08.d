BEGIN ~QCMM08~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS08",LastTalkedToBy(Myself))~ EXIT
  IF ~PartyHasItem("QCFLOUR")~ THEN REPLY @3 DO ~TakePartyItemNum("QCFLOUR",1) GiveGoldForce(65)~ EXIT
  IF ~PartyHasItem("QCEGGS")~ THEN REPLY @4 DO ~TakePartyItemNum("QCEGGS",1) GiveGoldForce(25)~ EXIT
  IF ~~ THEN REPLY @5 EXIT
END
