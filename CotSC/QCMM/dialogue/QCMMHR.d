// Extend the original Horst dialogue without replacing his character or his shop.
// These fixed-price purchases avoid the variable store valuation system.
EXTEND_TOP ~BDHORST~ 0
  IF ~PartyHasItem("QCGRAIN")~ THEN REPLY @1 DO ~TakePartyItemNum("QCGRAIN",1) GiveGoldForce(70)~ EXIT
  IF ~PartyHasItem("QCFLOUR")~ THEN REPLY @2 DO ~TakePartyItemNum("QCFLOUR",1) GiveGoldForce(56)~ EXIT
  IF ~PartyHasItem("QCCORN")~ THEN REPLY @3 DO ~TakePartyItemNum("QCCORN",1) GiveGoldForce(42)~ EXIT
  IF ~PartyHasItem("QCEGGS")~ THEN REPLY @4 DO ~TakePartyItemNum("QCEGGS",1) GiveGoldForce(18)~ EXIT
END
