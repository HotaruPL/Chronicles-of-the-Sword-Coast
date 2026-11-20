BEGIN ~QCMM24~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~PartyHasItem("QCBREAD")~ THEN REPLY @2 DO ~TakePartyItemNum("QCBREAD",1) GiveGoldForce(50)~ EXIT
  IF ~PartyHasItem("QCFLOUR")~ THEN REPLY @3 DO ~TakePartyItemNum("QCFLOUR",1) GiveGoldForce(3000)~ EXIT
  IF ~PartyHasItem("QCGRAIN")~ THEN REPLY @4 DO ~TakePartyItemNum("QCGRAIN",1) GiveGoldForce(1200)~ EXIT
  IF ~PartyHasItem("QCHONEY")~ THEN REPLY @5 DO ~TakePartyItemNum("QCHONEY",1) GiveGoldForce(5000)~ EXIT
  IF ~PartyHasItem("QCCOKIE")~ THEN REPLY @6 DO ~TakePartyItemNum("QCCOKIE",1) GiveGoldForce(899)~ EXIT
  IF ~~ THEN REPLY @7 EXIT
END
