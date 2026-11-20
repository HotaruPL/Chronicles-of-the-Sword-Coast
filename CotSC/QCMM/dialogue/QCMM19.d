BEGIN ~QCMM19~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~PartyHasItem("QCMEAT")~ THEN REPLY @2 DO ~TakePartyItemNum("QCMEAT",1) GiveGoldForce(89)~ EXIT
  IF ~~ THEN REPLY @3 EXIT
END
