BEGIN ~QCMM06~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS06",LastTalkedToBy(Myself))~ EXIT
  IF ~PartyHasItem("QCFLOUR")~ THEN REPLY @3 DO ~TakePartyItemNum("QCFLOUR",1) GiveGoldForce(60)~ EXIT
  IF ~PartyHasItem("QCCORN")~ THEN REPLY @4 DO ~TakePartyItemNum("QCCORN",1) GiveGoldForce(25)~ EXIT
  IF ~~ THEN REPLY @5 EXIT
END
