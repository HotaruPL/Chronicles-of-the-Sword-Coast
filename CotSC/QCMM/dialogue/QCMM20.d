BEGIN ~QCMM20~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~PartyHasItem("QCMEAT")~ THEN REPLY @2 DO ~TakePartyItemNum("QCMEAT",1) GiveGoldForce(20)~ EXIT
  IF ~PartyHasItem("QCSAUSG")~ THEN REPLY @3 DO ~TakePartyItemNum("QCSAUSG",1) GiveGoldForce(50)~ EXIT
  IF ~PartyHasItem("QCCOKIE")~ THEN REPLY @4 DO ~TakePartyItemNum("QCCOKIE",1) GiveGoldForce(67)~ EXIT
  IF ~PartyHasItem("QCHONEY")~ THEN REPLY @5 DO ~TakePartyItemNum("QCHONEY",1) GiveGoldForce(78)~ EXIT
  IF ~PartyHasItem("QCEGGS")~ THEN REPLY @6 DO ~TakePartyItemNum("QCEGGS",1) GiveGoldForce(43)~ EXIT
  IF ~~ THEN REPLY @7 EXIT
END
