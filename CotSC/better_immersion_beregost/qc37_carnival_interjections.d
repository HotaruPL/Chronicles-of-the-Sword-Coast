// CotSC BG1/EET dialogue addendum — all optional responses are party-conditioned.

// BICFATM1: Safana advice to unlucky elf
I_C_T3 ~BICFATM1~ 0 ~QC3700C~
  == ~SAFANJ~ IF ~InParty("Safana") InMyArea("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @1
  == ~BICFATM1~ IF ~InParty("Safana") InMyArea("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @2
  == ~SAFANJ~ IF ~InParty("Safana") InMyArea("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @3
  == ~BICFATM1~ IF ~InParty("Safana") InMyArea("Safana") !StateCheck("Safana",CD_STATE_NOTVALID)~ THEN @4
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @5
  == ~BICFATM1~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @6
END

// BICORC01: Jaheira and Coran on peaceful orc
INTERJECT_COPY_TRANS ~BICORC01~ 0 ~QC3701C~
  == ~JAHEIJ~ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @7
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @8
  == ~JAHEIJ~ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @9
END
