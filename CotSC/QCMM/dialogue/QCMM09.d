BEGIN ~QCMM09~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~PartyHasItem("QCGRAIN")~ THEN REPLY @2 DO ~TakePartyItemNum("QCGRAIN",1) GiveGoldForce(136)~ EXIT
  IF ~~ THEN REPLY @3 EXIT
END
