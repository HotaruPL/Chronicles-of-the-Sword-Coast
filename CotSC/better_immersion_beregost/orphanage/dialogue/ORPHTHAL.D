// Soul-coin states are part of THALAN itself, not an unused ORPHTHAL.DLG.
// These states have no automatic starting trigger; enter only from the
// explicit, one-time coin question added to Thalantyr's existing state 1.
APPEND ~THALAN~

IF ~~ THEN BEGIN QC_ORPH_COIN_START
  SAY @1
  IF ~~ THEN GOTO QC_ORPH_COIN_ETHICS
END

IF ~~ THEN BEGIN QC_ORPH_COIN_ETHICS
  SAY @2
  // Mark completion and remove the item on the player's acceptance, not on
  // a later automatic transition. Return only to the final thank-you state.
  IF ~Global("QC_ORPH_COIN_DONE","GLOBAL",0) PartyHasItem("ORPHCOIN")~ THEN REPLY @3 DO ~SetGlobal("QC_ORPH_COIN_DONE","GLOBAL",1) TakePartyItem("ORPHCOIN") DestroyItem("ORPHCOIN") AddExperienceParty(2000) ReputationInc(2)~ GOTO QC_ORPH_COIN_RELEASE
  IF ~~ THEN REPLY @4 GOTO QC_ORPH_COIN_REFUSE
  IF ~~ THEN REPLY @5 GOTO QC_ORPH_COIN_REFUSE
END

IF ~~ THEN BEGIN QC_ORPH_COIN_REFUSE
  SAY @6
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN QC_ORPH_COIN_RELEASE
  SAY @7
  IF ~~ THEN EXIT
END
END

// Question and its targets must compile together to resolve symbolic labels.
// The global prevents offering the coin a second time, even if a save still
// somehow contains another ORPHCOIN after completing the exchange.
EXTEND_TOP ~THALAN~ 1 #1
IF ~Global("RumorTalkThalan","GLOBAL",1) PartyHasItem("ORPHCOIN") Global("QC_ORPH_COIN_DONE","GLOBAL",0)~ THEN REPLY @8 GOTO QC_ORPH_COIN_START
END
