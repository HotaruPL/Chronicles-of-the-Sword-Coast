BEGIN ~QCMM07~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS07",LastTalkedToBy(Myself))~ EXIT
  IF ~PartyHasItem("QCFLOUR")~ THEN REPLY @3 DO ~TakePartyItemNum("QCFLOUR",1) GiveGoldForce(70)~ EXIT
  IF ~PartyHasItem("QCHONEY")~ THEN REPLY @4 DO ~TakePartyItemNum("QCHONEY",1) GiveGoldForce(45)~ EXIT
  IF ~~ THEN REPLY @5 EXIT
END
