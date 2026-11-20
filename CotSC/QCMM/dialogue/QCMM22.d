BEGIN ~QCMM22~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~PartyHasItem("QCCORN")~ THEN REPLY @2 DO ~TakePartyItemNum("QCCORN",1) GiveGoldForce(500)~ EXIT
  IF ~PartyHasItem("QCFLOUR")~ THEN REPLY @3 DO ~TakePartyItemNum("QCFLOUR",1) GiveGoldForce(320)~ EXIT
  IF ~PartyHasItem("QCGRAIN")~ THEN REPLY @4 DO ~TakePartyItemNum("QCGRAIN",1) GiveGoldForce(365)~ EXIT
  IF ~~ THEN REPLY @5 EXIT
END
