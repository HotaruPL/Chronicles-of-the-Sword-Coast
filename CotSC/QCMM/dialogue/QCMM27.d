BEGIN ~QCMM27~

// One-time exchange: checks party inventory and reward flag, not quest log.
IF ~Global("QCMMFLRX","GLOBAL",0) PartyHasItem("QCFABRC")~ THEN BEGIN Fabric
  SAY @1
  IF ~~ THEN REPLY @2 DO ~TakePartyItemNum("QCFABRC",1) SetGlobal("QCMMFLRX","GLOBAL",1) AddExperienceParty(10000) GiveItemCreate("SCRLB4",Player1,1,0,0) GiveItemCreate("SCRL7U",Player1,1,0,0) GiveItemCreate("SCRL9G",Player1,1,0,0)~ EXIT
  IF ~~ THEN REPLY @3 EXIT
END

// Once the fabric has been exchanged, no further rewards or requests.
IF ~Global("QCMMFLRX","GLOBAL",1)~ THEN BEGIN AfterExchange
  SAY @4
  IF ~~ THEN EXIT
END

IF ~True()~ THEN BEGIN Start
  SAY @5
  IF ~~ THEN REPLY @6 EXIT
END
