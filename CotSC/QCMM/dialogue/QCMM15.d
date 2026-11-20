BEGIN ~QCMM15~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~PartyHasItem("QCCOKIE")~ THEN REPLY @2 DO ~TakePartyItemNum("QCCOKIE",1) GiveGoldForce(17)~ EXIT
  IF ~PartyHasItem("QCHONEY")~ THEN REPLY @3 DO ~TakePartyItemNum("QCHONEY",1) GiveGoldForce(34)~ EXIT
  IF ~~ THEN REPLY @4 EXIT
END
