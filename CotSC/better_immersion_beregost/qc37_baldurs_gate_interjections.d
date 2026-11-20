// CotSC BG1/EET dialogue addendum — all optional responses are party-conditioned.

// BGBG0808: Edwin and halfling
INTERJECT_COPY_TRANS ~BGBG0808~ 0 ~QC3700B~
  == ~EDWINJ_~ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @1
  == ~BGBG0808~ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @2
  == ~EDWINJ_~ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @3
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @4
END

// BIBFFO01: Viconia and officer
INTERJECT_COPY_TRANS ~BIBFFO01~ 0 ~QC3701B~
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @5
  == ~BIBFFO01~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @6
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @7
  == ~BIBFFO01~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @8
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @9
END

// BIBTIE13: Dorn on tiefling prejudice
I_C_T3 ~BIBTIE13~ 0 ~QC3702B~
  == ~DORNJ_~ IF ~InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @10
  == ~BIBTIE13~ IF ~InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @11
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @12
END

// BIBHOB15: Tiax and Viconia on fish
INTERJECT_COPY_TRANS ~BIBHOB15~ 0 ~QC3703B~
  == ~TIAXJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @13
  == ~BIBHOB15~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @14
  == ~TIAXJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID)~ THEN @15
  == ~VICONJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID) InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @16
  == ~TIAXJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID) InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @17
  == ~VICONJ~ IF ~InParty("Tiax") InMyArea("Tiax") !StateCheck("Tiax",CD_STATE_NOTVALID) InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @18
END

// BIBDCK14: Quayle and Dorn at docks
I_C_T3 ~BIBDCK14~ 0 ~QC3704B~
  == ~QUAYLJ~ IF ~InParty("Quayle") InMyArea("Quayle") !StateCheck("Quayle",CD_STATE_NOTVALID)~ THEN @19
  == ~DORNJ_~ IF ~InParty("Quayle") InMyArea("Quayle") !StateCheck("Quayle",CD_STATE_NOTVALID) InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @20
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @21
  == ~BIBDCK14~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @22
END

// BIBKOB16: Ajantis on Umberlee
I_C_T3 ~BIBKOB16~ 0 ~QC3705B~
  == ~AJANTJ~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @23
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @24
END

// BIBKOB18: Alora and frightened kobold
INTERJECT_COPY_TRANS ~BIBKOB18~ 0 ~QC3706B~
  == ~ALORAJ~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN @25
  == ~BIBKOB18~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN @26
END

// BIBHAL16: Minsc and Dynaheir reassure halfling
INTERJECT_COPY_TRANS ~BIBHAL16~ 0 ~QC3707B~
  == ~MINSCJ_~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @27
  == ~DYNAHJ~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID) InParty("Dynaheir") InMyArea("Dynaheir") !StateCheck("Dynaheir",CD_STATE_NOTVALID)~ THEN @28
END

// BIBHUM15: Branwen on city fears
INTERJECT_COPY_TRANS ~BIBHUM15~ 0 ~QC3708B~
  == ~BRANWJ~ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @29
  == ~BIBHUM15~ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @30
  == ~BRANWJ~ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @31
END

// BGBG0705: Dorn dislikes gnome opinions
INTERJECT_COPY_TRANS ~BGBG0705~ 0 ~QC3709B~
  == ~DORNJ_~ IF ~InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID)~ THEN @32
  == ~CORANJ~ IF ~InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID) InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @33
  == ~DORNJ_~ IF ~InParty("Dorn") InMyArea("Dorn") !StateCheck("Dorn",CD_STATE_NOTVALID) InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @34
END

// BGBG0701: Viconia on Flaming Fist
INTERJECT_COPY_TRANS ~BGBG0701~ 0 ~QC3710B~
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @35
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @36
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @37
END

// BIB0208: Companions console elven girl
I_C_T3 ~BIB0208~ 0 ~QC3711B~
  == ~BRANWJ~ IF ~InParty("Branwen") InMyArea("Branwen") !StateCheck("Branwen",CD_STATE_NOTVALID)~ THEN @38
  == ~KHALIJ~ IF ~InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @39
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @40
  == ~ALORAJ~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN @41
  == ~MINSCJ_~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @42
  == ~BIB0208~ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @43
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @44
END

// BIB0209: Viconia and beggar argument
INTERJECT_COPY_TRANS ~BIB0209~ 0 ~QC3712B~
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @45
  == ~BIB0209~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @46
  == ~AJANTJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @47
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @48
  == ~BIB0209~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @49
  == ~VICONJ~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @50
  == ~BIB0209~ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @51
END

// BIB0303: Ajantis encourages kobold father
I_C_T3 ~BIB0303~ 0 ~QC3713B~
  == ~AJANTJ~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @52
  == ~AJANTJ~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @53
  == ~AJANTJ~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @54
  == ~BIB0303~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @55
  == ~YESLIJ~ IF ~InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID) InParty("Yeslick") InMyArea("Yeslick") !StateCheck("Yeslick",CD_STATE_NOTVALID)~ THEN @56
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @57
END

// BIB1005: Halflings, Imoen, Alora, Edwin
I_C_T3 ~BIB1005~ 0 ~QC3714B~
  == ~ALORAJ~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN @58
  == ~BIB1005~ IF ~InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID)~ THEN @59
  == ~IMOEN2_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @60
  == ~IMOEN2_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @61
  == ~EDWINJ_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @62
  == ~ALORAJ~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @63
  == ~EDWINJ_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @64
  == ~ALORAJ~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @65
  == ~IMOEN2_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Alora") InMyArea("Alora") !StateCheck("Alora",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @66
END

// BIB1006: Skie and officer Desmund
INTERJECT_COPY_TRANS ~BIB1006~ 0 ~QC3715B~
  == ~BIB1006~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @67
  == ~SKIEJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @68
  == ~BIB1006~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @69
  == ~SKIEJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @70
  == ~BIB1006~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @71
  == ~SKIEJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @72
  == ~BIB1006~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @73
  == ~SKIEJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @74
END

// BIB1008: Skie gardener and Eldoth
INTERJECT_COPY_TRANS ~BIB1008~ 0 ~QC3716B~
  == ~SKIEJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID)~ THEN @75
  == ~ELDOTJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID) InParty("Eldoth") InMyArea("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @76
  == ~SKIEJ~ IF ~InParty("Skie") InMyArea("Skie") !StateCheck("Skie",CD_STATE_NOTVALID) InParty("Eldoth") InMyArea("Eldoth") !StateCheck("Eldoth",CD_STATE_NOTVALID)~ THEN @77
END

// BIB1007: Xan kobold student and Ajantis
INTERJECT_COPY_TRANS ~BIB1007~ 0 ~QC3717B~
  == ~XANJ~ IF ~InParty("Xan") InMyArea("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN @78
  == ~BIB1007~ IF ~InParty("Xan") InMyArea("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN @79
  == ~AJANTJ~ IF ~InParty("Xan") InMyArea("Xan") !StateCheck("Xan",CD_STATE_NOTVALID) InParty("Ajantis") InMyArea("Ajantis") !StateCheck("Ajantis",CD_STATE_NOTVALID)~ THEN @80
  == ~BIB1007~ IF ~InParty("Xan") InMyArea("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN @81
  == ~XANJ~ IF ~InParty("Xan") InMyArea("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN @82
END

// BIBHAL17: Kagain on culture
INTERJECT_COPY_TRANS ~BIBHAL17~ 0 ~QC3718B~
  == ~KAGAIJ~ IF ~InParty("Kagain") InMyArea("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @83
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @84
  == ~KAGAIJ~ IF ~InParty("Kagain") InMyArea("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID) InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @85
END

// BGBG0811: Extra Coran observation
INTERJECT_COPY_TRANS ~BGBG0811~ 0 ~QC3719B~
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @86
END

// BIBKOB15: Extra Coran observation
INTERJECT_COPY_TRANS ~BIBKOB15~ 0 ~QC3720B~
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @87
END

// BGBG0709: Extra Coran observation
INTERJECT_COPY_TRANS ~BGBG0709~ 0 ~QC3721B~
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @88
END

// BIBHUM14: Extra Coran observation
INTERJECT_COPY_TRANS ~BIBHUM14~ 0 ~QC3723B~
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @89
END

// v70 BG1200: Dwarven Commoner / Elfsong Tavern beholder trophy.
// Each speaker is independently optional. Jaheira corrects Imoen only
// when both companions are valid and present; Imoen's reply then follows.
I_C_T3 ~BIBDWR15~ 0 ~QC70DW15~
  == ~KIVANJ~ IF ~InParty("Kivan") InMyArea("Kivan") !StateCheck("Kivan",CD_STATE_NOTVALID)~ THEN @90
  == ~KHALIJ~ IF ~InParty("Khalid") InMyArea("Khalid") !StateCheck("Khalid",CD_STATE_NOTVALID)~ THEN @91
  == ~IMOEN2_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID)~ THEN @92
  == ~JAHEIJ~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @93
  == ~IMOEN2_~ IF ~InParty("Imoen2") InMyArea("Imoen2") !StateCheck("Imoen2",CD_STATE_NOTVALID) InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @94
  == ~CORANJ~ IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN @95
  == ~XANJ~ IF ~InParty("Xan") InMyArea("Xan") !StateCheck("Xan",CD_STATE_NOTVALID)~ THEN @96
END

// v70 BG1200: Flaming Fist Officer / Iron Throne entry.
I_C_T3 ~BIBFFO04~ 0 ~QC70FF04~
  == ~SHARTJ~ IF ~InParty("SharTeel") InMyArea("SharTeel") !StateCheck("SharTeel",CD_STATE_NOTVALID)~ THEN @97
  == ~KAGAIJ~ IF ~InParty("Kagain") InMyArea("Kagain") !StateCheck("Kagain",CD_STATE_NOTVALID)~ THEN @98
END
