BEGIN QCSBTH

IF ~Global("QCSAFANA_BALTHRIM_HOSTILE","GLOBAL",1) Global("QCSAFANA_BALTHRIM_POSTKILL","GLOBAL",0) Dead("Safana")~ THEN BEGIN qcsbth_postkill_entry
    SAY @1
    IF ~~ THEN DO ~SetGlobal("QCSAFANA_BALTHRIM_POSTKILL","GLOBAL",1) SetGlobal("QCSAFANA_BALTHRIM_DONE","GLOBAL",1) EscapeAreaDestroy(1)~ EXIT
END

IF ~!InParty("Safana")~ THEN BEGIN qcsbth_no_safana
    SAY @2
    IF ~~ THEN EXIT
END

IF ~InParty("Safana")~ THEN BEGIN qcsbth_start
    SAY @3
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf01
END

IF ~~ THEN BEGIN qcsbth_b01
    SAY @4
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf02
END

IF ~~ THEN BEGIN qcsbth_b02
    SAY @5
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf03
END

IF ~~ THEN BEGIN qcsbth_b03
    SAY @6
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf04
END

IF ~~ THEN BEGIN qcsbth_b04
    SAY @7
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf05
END

IF ~~ THEN BEGIN qcsbth_b05
    SAY @8
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf06
END

IF ~~ THEN BEGIN qcsbth_b06
    SAY @9
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf07
END


IF ~~ THEN BEGIN qcsbth_after_help
    SAY @10
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf08
END

IF ~~ THEN BEGIN qcsbth_warning
    SAY @11
    IF ~~ THEN REPLY @12 GOTO qcsbth_second_end1
    IF ~~ THEN REPLY @13 GOTO qcsbth_second_end2
    IF ~~ THEN REPLY @14 EXTERN ~QCSBTH~ qcsbth_betray
    IF ~InParty("Coran")~ THEN REPLY @15 EXTERN CORANJ qcsbth_coran_takeover_reply
END


IF ~~ THEN BEGIN qcsbth_options2
    SAY @16
    IF ~~ THEN REPLY @17 EXTERN ~SAFANJ~ qcsbth_sf08_help
    IF ~~ THEN REPLY @18 EXTERN ~SAFANJ~ qcsbth_sf08_help
    IF ~~ THEN REPLY @19 EXTERN ~SAFANJ~ qcsbth_sf_father1
    IF ~~ THEN REPLY @20 EXTERN ~QCSBTH~ qcsbth_betray
    IF ~InParty("Coran")~ THEN REPLY @21 EXTERN CORANJ qcsbth_coran_takeover_reply
END


IF ~~ THEN BEGIN qcsbth_second_end1
    SAY @22
    IF ~~ THEN DO ~AddExperienceParty(100) SetGlobal("QCSAFANA_BALTHRIM_DONE","GLOBAL",1) SetGlobal("QCSAFANA_BD1000_AMBUSH_READY","GLOBAL",1) EscapeAreaDestroy(1)~ EXIT
END

IF ~~ THEN BEGIN qcsbth_second_end2
    SAY @23
    IF ~~ THEN DO ~AddExperienceParty(100) SetGlobal("QCSAFANA_BALTHRIM_DONE","GLOBAL",1) SetGlobal("QCSAFANA_BD1000_AMBUSH_READY","GLOBAL",1) EscapeAreaDestroy(1)~ EXIT
END

IF ~~ THEN BEGIN qcsbth_betray
    SAY @24
    IF ~InParty("Coran")~ THEN EXTERN CORANJ qcsbth_coran_betray_reply
    IF ~!InParty("Coran")~ THEN EXTERN SAFANJ qcsbth_sf_attack_silent
END

IF ~~ THEN BEGIN qcsbth_coran_takeover
    SAY @25
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_coran_takeover2
END

IF ~~ THEN BEGIN qcsbth_coran_takeover2
    SAY @26
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf_walkaway
END

IF ~~ THEN BEGIN qcsbth_end_takeover
    SAY @27
    IF ~~ THEN DO ~AddExperienceParty(200) SetGlobal("QCSAFANA_BALTHRIM_DONE","GLOBAL",1) EscapeAreaDestroy(1)~ EXIT
END

APPEND ~SAFANJ~

IF ~~ THEN BEGIN qcsbth_sf01
    SAY @28
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_b01
END

IF ~~ THEN BEGIN qcsbth_sf02
    SAY @29
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_b02
END

IF ~~ THEN BEGIN qcsbth_sf03
    SAY @30
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_b03
END

IF ~~ THEN BEGIN qcsbth_sf04
    SAY @31
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_b04
END

IF ~~ THEN BEGIN qcsbth_sf05
    SAY @32
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_b05
END

IF ~~ THEN BEGIN qcsbth_sf06
    SAY @33
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_b06
END

// The player's choices appear directly beneath Safana's plea.
IF ~~ THEN BEGIN qcsbth_sf07
    SAY @34
    IF ~~ THEN REPLY @35 EXTERN ~SAFANJ~ qcsbth_sf08_help
    IF ~~ THEN REPLY @36 EXTERN ~SAFANJ~ qcsbth_sf08_help
    IF ~~ THEN REPLY @37 EXTERN ~SAFANJ~ qcsbth_sf_father1
    IF ~~ THEN REPLY @38 EXTERN ~QCSBTH~ qcsbth_betray
    IF ~InParty("Coran")~ THEN REPLY @39 EXTERN CORANJ qcsbth_coran_takeover_reply
END

IF ~~ THEN BEGIN qcsbth_sf08
    SAY @40
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_warning
END

IF ~~ THEN BEGIN qcsbth_sf08_help
    SAY @41
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_after_help
END

IF ~~ THEN BEGIN qcsbth_sf_father1
    SAY @42
    IF ~~ THEN EXTERN ~SAFANJ~ qcsbth_sf_father2
END

IF ~~ THEN BEGIN qcsbth_sf_father2
    SAY @43
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_options2
END

IF ~~ THEN BEGIN qcsbth_sf_attack_silent
    SAY @44
    IF ~~ THEN DO ~SetGlobal("QCSAFANA_BALTHRIM_HOSTILE","GLOBAL",1) ActionOverride("Safana",LeaveParty()) ActionOverride("Safana",ChangeEnemyAlly(Myself,ENEMY)) ActionOverride("Safana",Attack(Player1))~ EXIT
END

IF ~~ THEN BEGIN qcsbth_sf_walkaway
    SAY @45
    IF ~~ THEN EXTERN ~QCSBTH~ qcsbth_end_takeover
END

IF ~~ THEN BEGIN qcsbth_coran_betray_safana
    SAY @46
    IF ~~ THEN DO ~SetGlobal("QCSAFANA_BALTHRIM_HOSTILE","GLOBAL",1) ActionOverride("Safana",LeaveParty()) ActionOverride("Safana",ChangeEnemyAlly(Myself,ENEMY)) ActionOverride("Safana",Attack(Player1)) ActionOverride("Coran",LeaveParty()) ActionOverride("Coran",EscapeAreaDestroy(1))~ EXIT
END
END

APPEND CORANJ

IF WEIGHT #-1 ~False()~ THEN BEGIN qcsbth_coran_takeover_reply
    SAY @47
    IF ~~ THEN EXTERN QCSBTH qcsbth_coran_takeover2
END

IF WEIGHT #-1 ~False()~ THEN BEGIN qcsbth_coran_betray_reply
    SAY @48
    IF ~~ THEN EXTERN SAFANJ qcsbth_coran_betray_safana
END
END
