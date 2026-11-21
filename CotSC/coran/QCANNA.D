BEGIN QCANNA

// Annaebiel without Coran: this is deliberately a complete two-state conversation
// so the response never depends on the main Coran branch.
IF ~!InParty("CORAN") Global("QCCORAN_ANNA_MAIN_DONE","GLOBAL",0)~ THEN BEGIN qcan_nocoran
  SAY @5
  IF ~~ THEN REPLY @6 DO ~SetGlobal("QCCORAN_ANNA_MAIN_DONE","GLOBAL",1)~ GOTO qcan_nocoran_reply
END

IF ~False()~ THEN BEGIN qcan_nocoran_reply
  SAY @7
  IF ~~ THEN EXIT
END

// ------------------------------------------------------------
// Main Coran / Annaebiel conversation.
// Cross-character dialogue deliberately uses EXTERN states rather
// than relying on one large mixed CHAIN for the speaker changes.
// ------------------------------------------------------------
IF ~InParty("CORAN") Global("QCCORAN_ANNA_MAIN_DONE","GLOBAL",0)~ THEN BEGIN qcan_main
  SAY @8
  IF ~~ THEN DO ~SetGlobal("QCCORAN_ANNA_MAIN_DONE","GLOBAL",1)~ EXTERN ~CORANJ~ QCA_CM1
END

// Anna after Coran's first introduction.
IF ~False()~ THEN BEGIN qcan_main_anna1
  SAY @9
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM2
END

IF ~False()~ THEN BEGIN qcan_main_anna2
  SAY @10
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM3
END

IF ~False()~ THEN BEGIN qcan_main_anna3
  SAY @11
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM4
END

IF ~False()~ THEN BEGIN qcan_main_anna4
  SAY @12
  IF ~InParty("JAHEIRA") InMyArea("JAHEIRA") !StateCheck("JAHEIRA",CD_STATE_NOTVALID)~ THEN EXTERN ~JAHEIJ~ QCA_JAHEIRA_MAIN
  IF ~!InParty("JAHEIRA") InParty("KHALID") InMyArea("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN EXTERN ~KHALIJ~ QCA_KHALID_MAIN
  IF ~!InParty("JAHEIRA") !InParty("KHALID")~ THEN EXTERN ~CORANJ~ QCA_CM5
END

IF ~False()~ THEN BEGIN qcan_main_anna5
  SAY @13
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM5B
END

IF ~False()~ THEN BEGIN qcan_main_anna6
  SAY @14
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM6
END

IF ~False()~ THEN BEGIN qcan_main_anna7
  SAY @15
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM7
END

IF ~False()~ THEN BEGIN qcan_main_after_safana1
  SAY @16
  IF ~!InParty("SAFANA")~ THEN GOTO qcan_main_after_safana2
  IF ~InParty("SAFANA") InMyArea("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN EXTERN ~SAFANJ~ QCA_SAFANA_MAIN2
END

IF ~False()~ THEN BEGIN qcan_main_after_safana2
  SAY @17
  IF ~!InParty("SAFANA")~ THEN EXTERN ~CORANJ~ QCA_CM8
  IF ~InParty("SAFANA") InMyArea("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN EXTERN ~SAFANJ~ QCA_SAFANA_MAIN3
END

IF ~False()~ THEN BEGIN qcan_main_anna8
  SAY @18
  IF ~!InParty("SAFANA")~ THEN EXTERN ~CORANJ~ QCA_CM9
  IF ~InParty("SAFANA") InMyArea("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN EXTERN ~SAFANJ~ QCA_SAFANA_MAIN4
END

// ------------------------------------------------------------
// Main player choices are attached to Coran's state, because the
// preceding line "I... I... ehm... <CHARNAME>?" belongs to Coran.
// ------------------------------------------------------------

// Branch 1/2: the shared curse sequence starts with Anna's line,
// then uses Coran/Anna EXTERN states throughout.
IF ~False()~ THEN BEGIN qcan_branch1
  SAY @19
  IF ~~ THEN EXTERN ~CORANJ~ QCA_B_YELP
END

IF ~False()~ THEN BEGIN qcan_branch2
  SAY @20
  IF ~~ THEN EXTERN ~CORANJ~ QCA_B_YELP
END

IF ~False()~ THEN BEGIN qcan_branch1_anna2
  SAY @21
  IF ~~ THEN EXTERN ~QCANNA~ qcan_branch1_curse
END

IF ~False()~ THEN BEGIN qcan_branch1_curse
  SAY @22
  IF ~~ THEN DO ~SetGlobal("QCCORAN_CURSE_KNOWN","GLOBAL",1)~ EXTERN ~CORANJ~ QCA_CURSE_WHAT
END

IF ~False()~ THEN BEGIN qcan_curse_know
  SAY @23
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CURSE_ANALIA
END

IF ~False()~ THEN BEGIN qcan_curse_baby
  SAY @24
  // The interjection states below form a deterministic chain in party order.
  IF ~InParty("SAFANA") InMyArea("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN EXTERN ~SAFANJ~ QCA_SAFANA_CURSE
  IF ~!InParty("SAFANA") InParty("SHARTEEL") InMyArea("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN EXTERN ~SHARTJ~ QCA_SHAR_CURSE
  IF ~!InParty("SAFANA") !InParty("SHARTEEL") InParty("KHALID") InMyArea("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN EXTERN ~KHALIJ~ QCA_KHALID_CURSE
  IF ~!InParty("SAFANA") !InParty("SHARTEEL") !InParty("KHALID") InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN EXTERN ~IMOEN2_~ QCA_IMOEN2_CURSE
  IF ~!InParty("SAFANA") !InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") InParty("KIVAN") InMyArea("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN EXTERN ~KIVANJ~ QCA_KIVAN_CURSE
  IF ~!InParty("SAFANA") !InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") InParty("VICONIA") InMyArea("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN EXTERN ~VICONJ~ QCA_VICON_CURSE
  IF ~!InParty("SAFANA") !InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") InParty("ALORA") InMyArea("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN EXTERN ~ALORAJ~ QCA_ALORA_CURSE
  IF ~!InParty("SAFANA") !InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("SAFANA") !InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") !InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END

// Female protagonist lie branch from the main menu.
IF ~False()~ THEN BEGIN qcan_branch3
  SAY @25
  IF ~~ THEN DO ~SetGlobal("QCCORAN_CURSE_KNOWN","GLOBAL",1)~ EXTERN ~CORANJ~ QCA_FEM_WHAT
END

IF ~False()~ THEN BEGIN qcan_branch3_known
  SAY @26
  IF ~~ THEN EXTERN ~CORANJ~ QCA_KNOWN_LIE_REPLY
END

IF ~False()~ THEN BEGIN qcan_fem_marked
  SAY @27
  IF ~~ THEN EXTERN ~CORANJ~ QCA_FEM_WHAT2
END

IF ~False()~ THEN BEGIN qcan_fem_final
  SAY @28
  IF ~~ THEN GOTO qcan_female_curse_options
END

IF ~False()~ THEN BEGIN qcan_female_curse_options
  SAY @29
  IF ~~ THEN REPLY @30 DO ~SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",1)~ EXTERN ~CORANJ~ QCA_FEM_PRIEST
  IF ~~ THEN REPLY @31 EXTERN ~CORANJ~ QCA_CLEAN_BREAK
END

// Safana branch from the main player menu.
IF ~False()~ THEN BEGIN qcan_safana_options
  SAY @32
  IF ~~ THEN REPLY @33 EXTERN ~QCANNA~ qcan_branch1
  IF ~~ THEN REPLY @34 EXTERN ~QCANNA~ qcan_branch2
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @35 EXTERN ~QCANNA~ qcan_branch3
  IF ~InParty("ELDOTH")~ THEN REPLY @36 EXTERN ~ELDOTJ~ QCA_ELDOTH_INTRO
END

// ------------------------------------------------------------
// The curse menu belongs to Coran. The visible "(sigh) You had it..."
// line therefore comes from CORANJ rather than Annaebiel.
// ------------------------------------------------------------
IF ~False()~ THEN BEGIN qcan_defy_menu
  SAY @37
  IF ~~ THEN REPLY @38 EXTERN ~CORANJ~ QCA_TAKE
  IF ~~ THEN REPLY @39 EXTERN ~CORANJ~ QCA_TAKE
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @40 EXTERN ~QCANNA~ qcan_branch3_known
  IF ~InParty("SAFANA")~ THEN REPLY @41 EXTERN ~SAFANJ~ QCA_SAFANA_CURSE_HELP
  IF ~InParty("ELDOTH")~ THEN REPLY @42 EXTERN ~ELDOTJ~ QCA_ELDOTH_CURSE_HELP
END

IF ~False()~ THEN BEGIN qcan_helmite_menu
  SAY @43
  IF ~~ THEN REPLY @44 EXTERN ~CORANJ~ QCA_TAKE
  IF ~~ THEN REPLY @45 EXTERN ~CORANJ~ QCA_TAKE
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @46 EXTERN ~QCANNA~ qcan_branch3_known
  IF ~InParty("SAFANA")~ THEN REPLY @47 EXTERN ~SAFANJ~ QCA_SAFANA_CURSE_HELP
  IF ~InParty("ELDOTH")~ THEN REPLY @48 EXTERN ~ELDOTJ~ QCA_ELDOTH_CURSE_HELP
END

// ------------------------------------------------------------
// Eldoth branch: correct speaker ownership and full Anna line.
// ------------------------------------------------------------
IF ~False()~ THEN BEGIN qcan_eldoth_response
  SAY @49
  IF ~~ THEN EXTERN ~ELDOTJ~ QCA_ELDOTH_2
END

IF ~False()~ THEN BEGIN qcan_eldoth_blush
  SAY @50
  IF ~~ THEN GOTO qcan_eldoth_release
END

IF ~False()~ THEN BEGIN qcan_eldoth_release
  SAY @51
  IF ~~ THEN EXTERN ~CORANJ~ QCA_ELDOTH_CORAN
END

IF ~False()~ THEN BEGIN qcan_eldoth_anna_forgives
  SAY @52
  IF ~~ THEN EXTERN ~CORANJ~ QCA_ELDOTH_VOW
END

IF ~False()~ THEN BEGIN qcan_eldoth_farewell
  SAY @53
  IF ~~ THEN DO ~SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",2) AddJournalEntry(@2,QUEST_DONE)~ EXIT
END

// ------------------------------------------------------------
// Post-curse Annaebiel states belong to QCANNA.
// These are kept here so CORANJ can EXTERN back to Annaebiel's DLG.
// ------------------------------------------------------------
// ------------------------------------------------------------
// Append only the new states to the existing BG1/EET joined dialogues.
// No existing vanilla/BG1 states are replaced.
// ------------------------------------------------------------

// ------------------------------------------------------------
// Post-curse Annaebiel states belong to QCANNA.
// These are kept here so CORANJ can EXTERN back to Annaebiel's DLG.
// ------------------------------------------------------------
IF ~False()~ THEN BEGIN qcan_known_take_anna
  SAY @54
  IF ~~ THEN EXIT
END

IF ~False()~ THEN BEGIN qcan_known_lie_anna
  SAY @55
  IF ~~ THEN EXIT
END

APPEND ~CORANJ~
IF ~False()~ THEN BEGIN QCA_CM1
  SAY @56
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna1
END

IF ~False()~ THEN BEGIN QCA_CM2
  SAY @57
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna2
END

IF ~False()~ THEN BEGIN QCA_CM3
  SAY @58
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna3
END

IF ~False()~ THEN BEGIN QCA_CM4
  SAY @59
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna4
END

IF ~False()~ THEN BEGIN QCA_CM5
  SAY @60
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna5
END

IF ~False()~ THEN BEGIN QCA_CM5B
  SAY @61
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna6
END

IF ~False()~ THEN BEGIN QCA_CM6
  SAY @62
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna7
END

IF ~False()~ THEN BEGIN QCA_CM7
  SAY @63
  IF ~!InParty("SAFANA")~ THEN EXTERN ~QCANNA~ qcan_main_after_safana1
  IF ~InParty("SAFANA") InMyArea("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN EXTERN ~SAFANJ~ QCA_SAFANA_MAIN1
END

IF ~False()~ THEN BEGIN QCA_CM8
  SAY @64
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_anna8
END

IF ~False()~ THEN BEGIN QCA_CM9
  SAY @65
  IF ~~ THEN REPLY @66 EXTERN ~QCANNA~ qcan_branch1
  IF ~~ THEN REPLY @67 EXTERN ~QCANNA~ qcan_branch2
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @68 EXTERN ~QCANNA~ qcan_branch3
  IF ~InParty("SAFANA")~ THEN REPLY @69 EXTERN ~SAFANJ~ QCA_SAFANA_INTRO
  IF ~InParty("ELDOTH")~ THEN REPLY @70 EXTERN ~ELDOTJ~ QCA_ELDOTH_INTRO
END

IF ~False()~ THEN BEGIN QCA_B_YELP
  SAY @71
  IF ~~ THEN EXTERN ~QCANNA~ qcan_branch1_anna2
END

IF ~False()~ THEN BEGIN QCA_CURSE_WHAT
  SAY @72
  IF ~~ THEN EXTERN ~QCANNA~ qcan_curse_know
END

IF ~False()~ THEN BEGIN QCA_CURSE_ANALIA
  SAY @73
  IF ~~ THEN EXTERN ~QCANNA~ qcan_curse_baby
END

IF ~False()~ THEN BEGIN QCA_CURSE_SIGH
  SAY @74
  IF ~~ THEN REPLY @75 EXTERN ~CORANJ~ QCA_DEFY
  IF ~~ THEN REPLY @76 DO ~SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",1) AddJournalEntry(@1,QUEST)~ EXTERN ~CORANJ~ QCA_HELMITE
  IF ~~ THEN REPLY @77 EXTERN ~CORANJ~ QCA_CLEAN_BREAK
END

IF ~False()~ THEN BEGIN QCA_DEFY
  SAY @78
  IF ~~ THEN DO ~SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",1) AddJournalEntry(@1,QUEST)~ EXTERN ~QCANNA~ qcan_defy_menu
END

IF ~False()~ THEN BEGIN QCA_HELMITE
  SAY @79
  IF ~~ THEN DO ~SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",1) AddJournalEntry(@1,QUEST)~ EXTERN ~QCANNA~ qcan_helmite_menu
END

IF ~False()~ THEN BEGIN QCA_TAKE
  SAY @80
  IF ~~ THEN EXTERN ~QCANNA~ qcan_known_take_anna
END

IF ~False()~ THEN BEGIN QCA_KNOWN_LIE_REPLY
  SAY @81
  IF ~~ THEN EXTERN ~QCANNA~ qcan_known_lie_anna
END

IF ~False()~ THEN BEGIN QCA_CLEAN_BREAK
  SAY @82
  IF ~~ THEN DO ~SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",2) AddJournalEntry(@3,QUEST_DONE) SetLeavePartyDialogFile() LeaveParty() ActionOverride("QCANNA",EscapeArea()) EscapeArea()~ EXIT
END

IF ~False()~ THEN BEGIN QCA_FEM_WHAT
  SAY @83
  IF ~~ THEN EXTERN ~QCANNA~ qcan_fem_marked
END

IF ~False()~ THEN BEGIN QCA_FEM_WHAT2
  SAY @84
  IF ~~ THEN EXTERN ~QCANNA~ qcan_fem_final
END

IF ~False()~ THEN BEGIN QCA_FEM_PRIEST
  SAY @85
  IF ~~ THEN DO ~AddJournalEntry(@1,QUEST)~ EXIT
END

IF ~False()~ THEN BEGIN QCA_ELDOTH_CORAN
  SAY @86
  IF ~~ THEN EXTERN ~QCANNA~ qcan_eldoth_anna_forgives
END

IF ~False()~ THEN BEGIN QCA_ELDOTH_VOW
  SAY @87
  IF ~~ THEN EXTERN ~ELDOTJ~ QCA_ELDOTH_PINT
END
END

APPEND ~JAHEIJ~
IF ~False()~ THEN BEGIN QCA_JAHEIRA_MAIN
  SAY @88
  IF ~InParty("KHALID") InMyArea("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN EXTERN ~KHALIJ~ QCA_KHALID_MAIN
  IF ~!InParty("KHALID")~ THEN EXTERN ~CORANJ~ QCA_CM5
END
END

APPEND ~KHALIJ~
IF ~False()~ THEN BEGIN QCA_KHALID_MAIN
  SAY @89
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM5
END

IF ~False()~ THEN BEGIN QCA_KHALID_CURSE
  SAY @90
  IF ~InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN EXTERN ~IMOEN2_~ QCA_IMOEN2_CURSE
  IF ~!InParty("IMOEN2") InParty("KIVAN") InMyArea("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN EXTERN ~KIVANJ~ QCA_KIVAN_CURSE
  IF ~!InParty("IMOEN2") !InParty("KIVAN") InParty("VICONIA") InMyArea("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN EXTERN ~VICONJ~ QCA_VICON_CURSE
  IF ~!InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") InParty("ALORA") InMyArea("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN EXTERN ~ALORAJ~ QCA_ALORA_CURSE
  IF ~!InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") !InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END
END

// The small continuation after Khalid's curse interjection is a deliberate
// QCANNA state so the next optional party member is checked once.

APPEND ~SAFANJ~
IF ~False()~ THEN BEGIN QCA_SAFANA_MAIN1
  SAY @91
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_after_safana1
END

IF ~False()~ THEN BEGIN QCA_SAFANA_MAIN2
  SAY @92
  IF ~~ THEN EXTERN ~QCANNA~ qcan_main_after_safana2
END

IF ~False()~ THEN BEGIN QCA_SAFANA_MAIN3
  SAY @93
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM8
END

IF ~False()~ THEN BEGIN QCA_SAFANA_MAIN4
  SAY @94
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CM9
END

IF ~False()~ THEN BEGIN QCA_SAFANA_INTRO
  SAY @95
  IF ~~ THEN EXTERN ~QCANNA~ qcan_safana_options
END

IF ~False()~ THEN BEGIN QCA_SAFANA_CURSE
  SAY @96
  IF ~InParty("SHARTEEL") InMyArea("SHARTEEL") !StateCheck("SHARTEEL",CD_STATE_NOTVALID)~ THEN EXTERN ~SHARTJ~ QCA_SHAR_CURSE
  IF ~!InParty("SHARTEEL") InParty("KHALID") InMyArea("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN EXTERN ~KHALIJ~ QCA_KHALID_CURSE
  IF ~!InParty("SHARTEEL") !InParty("KHALID") InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN EXTERN ~IMOEN2_~ QCA_IMOEN2_CURSE
  IF ~!InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") InParty("KIVAN") InMyArea("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN EXTERN ~KIVANJ~ QCA_KIVAN_CURSE
  IF ~!InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") InParty("VICONIA") InMyArea("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN EXTERN ~VICONJ~ QCA_VICON_CURSE
  IF ~!InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") InParty("ALORA") InMyArea("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN EXTERN ~ALORAJ~ QCA_ALORA_CURSE
  IF ~!InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("SHARTEEL") !InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") !InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END

IF ~False()~ THEN BEGIN QCA_SAFANA_CURSE_HELP
  SAY @97
  IF ~~ THEN EXTERN ~QCANNA~ qcan_defy_menu
END
END

APPEND ~SAFANJ~
IF ~False()~ THEN BEGIN QCA_SAFANA_HELM_FINAL
  SAY @98
  IF ~~ THEN EXTERN ~QCANNA~ qcan_helm_farewell_after_safana
END
END

APPEND ~SHARTJ~
IF ~False()~ THEN BEGIN QCA_SHAR_CURSE
  SAY @99
  IF ~InParty("KHALID") InMyArea("KHALID") !StateCheck("KHALID",CD_STATE_NOTVALID)~ THEN EXTERN ~KHALIJ~ QCA_KHALID_CURSE
  IF ~!InParty("KHALID") InParty("IMOEN2") InMyArea("IMOEN2") !StateCheck("IMOEN2",CD_STATE_NOTVALID)~ THEN EXTERN ~IMOEN2_~ QCA_IMOEN2_CURSE
  IF ~!InParty("KHALID") !InParty("IMOEN2") InParty("KIVAN") InMyArea("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN EXTERN ~KIVANJ~ QCA_KIVAN_CURSE
  IF ~!InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") InParty("VICONIA") InMyArea("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN EXTERN ~VICONJ~ QCA_VICON_CURSE
  IF ~!InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") InParty("ALORA") InMyArea("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN EXTERN ~ALORAJ~ QCA_ALORA_CURSE
  IF ~!InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("KHALID") !InParty("IMOEN2") !InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") !InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END
END

APPEND ~IMOEN2_~
IF ~False()~ THEN BEGIN QCA_IMOEN2_CURSE
  SAY @100
  IF ~InParty("KIVAN") InMyArea("KIVAN") !StateCheck("KIVAN",CD_STATE_NOTVALID)~ THEN EXTERN ~KIVANJ~ QCA_KIVAN_CURSE
  IF ~!InParty("KIVAN") InParty("VICONIA") InMyArea("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN EXTERN ~VICONJ~ QCA_VICON_CURSE
  IF ~!InParty("KIVAN") !InParty("VICONIA") InParty("ALORA") InMyArea("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN EXTERN ~ALORAJ~ QCA_ALORA_CURSE
  IF ~!InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("KIVAN") !InParty("VICONIA") !InParty("ALORA") !InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END
END

APPEND ~KIVANJ~
IF ~False()~ THEN BEGIN QCA_KIVAN_CURSE
  SAY @101
  IF ~InParty("VICONIA") InMyArea("VICONIA") !StateCheck("VICONIA",CD_STATE_NOTVALID)~ THEN EXTERN ~VICONJ~ QCA_VICON_CURSE
  IF ~!InParty("VICONIA") InParty("ALORA") InMyArea("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN EXTERN ~ALORAJ~ QCA_ALORA_CURSE
  IF ~!InParty("VICONIA") !InParty("ALORA") InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("VICONIA") !InParty("ALORA") !InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END
END

APPEND ~VICONJ~
IF ~False()~ THEN BEGIN QCA_VICON_CURSE
  SAY @102
  IF ~InParty("ALORA") InMyArea("ALORA") !StateCheck("ALORA",CD_STATE_NOTVALID)~ THEN EXTERN ~ALORAJ~ QCA_ALORA_CURSE
  IF ~!InParty("ALORA") InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("ALORA") !InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END
END

APPEND ~ALORAJ~
IF ~False()~ THEN BEGIN QCA_ALORA_CURSE
  SAY @103
  IF ~InParty("EDWIN") InMyArea("EDWIN") !StateCheck("EDWIN",CD_STATE_NOTVALID)~ THEN EXTERN ~EDWINJ_~ QCA_EDWIN_CURSE
  IF ~!InParty("EDWIN")~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END
END

APPEND ~EDWINJ_~
IF ~False()~ THEN BEGIN QCA_EDWIN_CURSE
  SAY @104
  IF ~~ THEN EXTERN ~CORANJ~ QCA_CURSE_SIGH
END
END

APPEND ~ELDOTJ~
IF ~False()~ THEN BEGIN QCA_ELDOTH_INTRO
  SAY @105
  IF ~~ THEN EXTERN ~QCANNA~ qcan_eldoth_response
END

IF ~False()~ THEN BEGIN QCA_ELDOTH_2
  SAY @106
  IF ~~ THEN EXTERN ~QCANNA~ qcan_eldoth_blush
END

IF ~False()~ THEN BEGIN QCA_ELDOTH_PINT
  SAY @107
  IF ~!InParty("SKIE")~ THEN EXTERN ~QCANNA~ qcan_eldoth_farewell
  IF ~InParty("SKIE") InMyArea("SKIE") !StateCheck("SKIE",CD_STATE_NOTVALID)~ THEN EXTERN ~SKIEJ~ QCA_SKIE_ELDOTH
END

IF ~False()~ THEN BEGIN QCA_ELDOTH_CURSE_HELP
  SAY @108
  IF ~~ THEN EXTERN ~QCANNA~ qcan_helmite_menu
END

IF ~False()~ THEN BEGIN QCA_ELDOTH_SKIE_REPLY
  SAY @109
  IF ~~ THEN EXTERN ~SKIEJ~ QCA_SKIE_ELDOTH3
END
END

APPEND ~SKIEJ~
IF ~False()~ THEN BEGIN QCA_SKIE_ELDOTH
  SAY @110
  IF ~~ THEN EXTERN ~ELDOTJ~ QCA_ELDOTH_SKIE_REPLY
END

IF ~False()~ THEN BEGIN QCA_SKIE_ELDOTH3
  SAY @111
  IF ~~ THEN EXTERN ~QCANNA~ qcan_eldoth_farewell
END
END


APPEND ~QCANNA~
IF ~Global("QCCORAN_HELM_RETURN","GLOBAL",1) InParty("CORAN")~ THEN BEGIN qcan_helm_return
  SAY @112
  IF ~~ THEN EXTERN ~CORANJ~ QCA_RETURN_CORAN1
END

IF ~False()~ THEN BEGIN qcan_helm_anna1
  SAY @113
  IF ~~ THEN EXTERN ~CORANJ~ QCA_RETURN_CORAN2
END

IF ~False()~ THEN BEGIN qcan_helm_anna2
  SAY @114
  IF ~~ THEN EXTERN ~CORANJ~ QCA_RETURN_CORAN3
END

IF ~False()~ THEN BEGIN qcan_helm_anna3
  SAY @115
  IF ~~ THEN EXTERN ~CORANJ~ QCA_RETURN_CORAN4
END

IF ~False()~ THEN BEGIN qcan_helm_anna4
  SAY @116
  IF ~~ THEN EXTERN ~CORANJ~ QCA_RETURN_CORAN5
END

IF ~False()~ THEN BEGIN qcan_helm_anna5
  SAY @117
  IF ~InParty("SAFANA") InMyArea("SAFANA") !StateCheck("SAFANA",CD_STATE_NOTVALID)~ THEN EXTERN ~SAFANJ~ QCA_SAFANA_HELM_FINAL
  IF ~!InParty("SAFANA")~ THEN DO ~SetGlobal("QCCORAN_HELM_RETURN","GLOBAL",0) SetGlobal("QCCORAN_HELM_RETURN_TALK","GLOBAL",0) SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",2) AddJournalEntry(@2,QUEST_DONE) AddExperienceParty(300) MoveToPointNoInterrupt([220.277]) Wait(3) DestroySelf()~ EXIT
END
END


APPEND ~QCANNA~
IF ~False()~ THEN BEGIN qcan_helm_farewell_after_safana
  SAY @118
  IF ~~ THEN DO ~SetGlobal("QCCORAN_HELM_RETURN","GLOBAL",0) SetGlobal("QCCORAN_HELM_RETURN_TALK","GLOBAL",0) SetGlobal("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",2) AddJournalEntry(@2,QUEST_DONE) AddExperienceParty(300) MoveToPointNoInterrupt([220.277]) Wait(3) DestroySelf()~ EXIT
END
END


APPEND ~CORANJ~
IF ~False()~ THEN BEGIN QCA_RETURN_CORAN1
  SAY @119
  IF ~~ THEN EXTERN ~QCANNA~ qcan_helm_anna1
END

IF ~False()~ THEN BEGIN QCA_RETURN_CORAN2
  SAY @120
  IF ~~ THEN EXTERN ~QCANNA~ qcan_helm_anna2
END

IF ~False()~ THEN BEGIN QCA_RETURN_CORAN3
  SAY @121
  IF ~~ THEN EXTERN ~QCANNA~ qcan_helm_anna3
END

IF ~False()~ THEN BEGIN QCA_RETURN_CORAN4
  SAY @122
  IF ~~ THEN EXTERN ~QCANNA~ qcan_helm_anna4
END

IF ~False()~ THEN BEGIN QCA_RETURN_CORAN5
  SAY @123
  IF ~~ THEN EXTERN ~QCANNA~ qcan_helm_anna5
END

IF ~False()~ THEN BEGIN QCA_HELM_CORAN_IAM
  SAY @124
  IF ~~ THEN EXTERN ~PRIHEL~ qca_prihel_allow
END

IF ~False()~ THEN BEGIN QCA_HELM_CORAN_WHAT
  SAY @125
  IF ~~ THEN EXTERN ~PRIHEL~ qca_prihel_clear
END

IF ~False()~ THEN BEGIN QCA_HELM_CORAN_LIE
  SAY @126
  IF ~~ THEN EXTERN ~PRIHEL~ qca_prihel_explain
END

IF ~False()~ THEN BEGIN QCA_HELM_CORAN_RETURN
  SAY @127
  IF ~~ THEN DO ~SetGlobal("QCCORAN_HELM_RETURN","GLOBAL",1) SetGlobal("QCCORAN_HELM_RETURN_TALK","GLOBAL",0) ActionOverride(Player1,LeaveAreaLUA("QCANAE","",[417.345],6)) ActionOverride(Player2,LeaveAreaLUA("QCANAE","",[417.345],6)) ActionOverride(Player3,LeaveAreaLUA("QCANAE","",[417.345],6)) ActionOverride(Player4,LeaveAreaLUA("QCANAE","",[417.345],6)) ActionOverride(Player5,LeaveAreaLUA("QCANAE","",[417.345],6)) ActionOverride(Player6,LeaveAreaLUA("QCANAE","",[417.345],6))~ EXIT
END

END
APPEND ~PRIHEL~
IF ~False()~ THEN BEGIN qca_prihel_start
  SAY @128
  IF ~~ THEN GOTO qca_prihel_guarantee
END

IF ~False()~ THEN BEGIN qca_prihel_guarantee
  SAY @129
  IF ~~ THEN EXTERN ~CORANJ~ QCA_HELM_CORAN_IAM
END

IF ~False()~ THEN BEGIN qca_prihel_allow
  SAY @130
  IF ~~ THEN GOTO qca_prihel_interesting
END

IF ~False()~ THEN BEGIN qca_prihel_interesting
  SAY @131
  IF ~~ THEN EXTERN ~CORANJ~ QCA_HELM_CORAN_WHAT
END

IF ~False()~ THEN BEGIN qca_prihel_clear
  SAY @132
  IF ~~ THEN EXTERN ~CORANJ~ QCA_HELM_CORAN_LIE
END

IF ~False()~ THEN BEGIN qca_prihel_explain
  SAY @133
  IF ~~ THEN EXTERN ~CORANJ~ QCA_HELM_CORAN_RETURN
END
END

EXTEND_BOTTOM ~PRIHEL~ 0
IF ~Global("QCCORAN_CRAZY_MAD_LOVE","GLOBAL",1) InParty("CORAN")~ THEN REPLY @134 GOTO qca_prihel_start
END
