BEGIN ~QCMM18~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS18",LastTalkedToBy(Myself))~ EXIT
  IF ~PartyHasItem("QCFLOUR")~ THEN REPLY @3 DO ~TakePartyItemNum("QCFLOUR",1) GiveGoldForce(99)~ EXIT
  IF ~~ THEN REPLY @4 EXIT
END
