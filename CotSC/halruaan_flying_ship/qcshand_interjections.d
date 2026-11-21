I_C_T QCSHAND 3 qsh_home_imoen
== IMOEN2_ IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @8
== QCSHAND IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @9
== IMOEN2_ IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @10
== QCSHAND IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @11
END

I_C_T3 QCSHAND 34 qsh_fly_npcs
== IMOEN2_ IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN @12
== EDWINJ_ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @13
== QUAYLJ IF ~InParty("Quayle") InMyArea("Quayle") !StateCheck("Quayle",CD_STATE_NOTVALID)~ THEN @14
END
