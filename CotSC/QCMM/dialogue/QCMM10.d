BEGIN ~QCMM10~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS10",LastTalkedToBy(Myself))~ EXIT
  IF ~PartyHasItem("QCGRAIN")~ THEN REPLY @3 DO ~TakePartyItemNum("QCGRAIN",1) GiveGoldForce(70)~ EXIT
  IF ~PartyHasItem("QCEGGS")~ THEN REPLY @4 DO ~TakePartyItemNum("QCEGGS",1) GiveGoldForce(15)~ EXIT
  IF ~~ THEN REPLY @5 EXIT
END
