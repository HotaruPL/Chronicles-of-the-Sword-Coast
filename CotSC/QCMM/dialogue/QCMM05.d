BEGIN ~QCMM05~

IF ~True()~ THEN BEGIN Start
  SAY @1
  IF ~~ THEN REPLY @2 DO ~StartStore("QCMS05",LastTalkedToBy(Myself))~ EXIT
  IF ~PartyHasItem("QCHONEY")~ THEN REPLY @3 DO ~TakePartyItemNum("QCHONEY",1) GiveGoldForce(65)~ EXIT
  IF ~~ THEN REPLY @4 EXIT
END
