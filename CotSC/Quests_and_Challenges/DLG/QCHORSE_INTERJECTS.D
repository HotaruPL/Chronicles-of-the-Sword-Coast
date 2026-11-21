// BG1NPC-style multi-interjection for the Horse Trainer's saved-horse state.
// I_C_T3 is used because every companion condition is evaluated independently,
// and the final QCHORSE line is the passback to the original speaker.

I_C_T3 ~QCHORSE~ 11 QCH_MISSING_HORSE_REACTIONS
== ~IMOEN2_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @46
== ~XZARJ~ IF ~InParty("xzar") InMyArea("xzar") !StateCheck("xzar",CD_STATE_NOTVALID)~ THEN @47
== ~JAHEIJ~ IF ~InParty("jaheira") InMyArea("jaheira") !StateCheck("jaheira",CD_STATE_NOTVALID)~ THEN @48
== ~FALDOJ~ IF ~InParty("faldorn") InMyArea("faldorn") !StateCheck("faldorn",CD_STATE_NOTVALID)~ THEN @49
== ~VICONJ~ IF ~InParty("viconia") InMyArea("viconia") !StateCheck("viconia",CD_STATE_NOTVALID)~ THEN @50
== ~QCHORSE~ @51 DO ~SetGlobal("QCHORSE_STATE","GLOBAL",4) AddExperienceParty(500) GiveGoldForce(200)~
END
