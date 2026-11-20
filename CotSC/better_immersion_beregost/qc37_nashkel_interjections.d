// CotSC BG1/EET dialogue addendum — all optional responses are party-conditioned.

// BNHORK01: Khalid farmer discussion
INTERJECT_COPY_TRANS ~BNHORK01~ 0 ~QC3700N~
  == ~KHALIJ~ IF ~InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @1
  == ~BNHORK01~ IF ~InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @2
  == ~KHALIJ~ IF ~InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @3
END
