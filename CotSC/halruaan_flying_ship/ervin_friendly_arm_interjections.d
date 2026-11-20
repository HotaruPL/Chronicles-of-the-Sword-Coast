// Companion interjections after Ervin reveals the proxy-war plan.
// The original FA_DLG9 transition is copied unchanged at the end of the chain.
I_C_T3 QCERVIN 13 QCErvinFriendlyInterjections
  == BRANWJ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @1
  == EDWINJ_ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @2
  == KAGAIJ IF ~InParty("Kagain") InMyArea("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @3
  == KIVANJ IF ~InParty("Kivan") InMyArea("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN @4
  == DYNAHJ IF ~InParty("Dynaheir") InMyArea("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @5
END
