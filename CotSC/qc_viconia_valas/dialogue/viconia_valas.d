// Independent two-scene, no-journal encounter, using original BG2 companion voices.
BEGIN ~QCVVAL1~
IF ~Global("QCV_STAGE","GLOBAL",0) !IsValidForPartyDialog("Viconia")~ THEN BEGIN novic
  SAY @1
  ++ @2 DO ~SetGlobal("QCV_STAGE","GLOBAL",3)~ EXIT
  ++ @3 GOTO novic2
  ++ @4 DO ~SetGlobal("QCV_STAGE","GLOBAL",4) Enemy()~ EXIT
END
IF ~False()~ THEN BEGIN novic2
  SAY @5
  IF ~~ THEN DO ~SetGlobal("QCV_STAGE","GLOBAL",3)~ EXIT
END
IF ~Global("QCV_STAGE","GLOBAL",4)~ THEN BEGIN novic_repeat
  SAY @6
  IF ~~ THEN EXIT
END

BEGIN ~QCVVAL2~
IF ~Global("QCV_STAGE","GLOBAL",1) !IsValidForPartyDialog("Viconia")~ THEN BEGIN unmet
  SAY @7
  IF ~~ THEN EXIT
END

CHAIN IF ~Global("QCV_STAGE","GLOBAL",0) IsValidForPartyDialog("Viconia")~ THEN ~QCVVAL1~ QCVINTRO
  @8
  == ~VICONIJ~
    @9
  == ~QCVVAL1~
    @10
  == ~VICONIJ~
    @11
  == ~QCVVAL1~
    @12
  == ~VICONIJ~
    @13
  == ~QCVVAL1~
    @14
  == ~VICONIJ~
    @15
  == ~QCVVAL1~
    @16
END
  ++ @17 EXTERN ~VICONIJ~ QCV_FIRST1
  ++ @18 EXTERN ~VICONIJ~ QCV_FIRST2
  ++ @19 EXTERN ~VICONIJ~ QCV_FIRST3

CHAIN IF ~False()~ THEN ~VICONIJ~ QCV_MOMENT
  @20
  == ~EDWINJ~ IF ~IsValidForPartyDialog("Edwin")~ THEN
    @21
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Jaheira")~ THEN
    @22
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Aerie")~ THEN
    @23
  == ~ANOMENJ~ IF ~IsValidForPartyDialog("Anomen")~ THEN
    @24
  == ~KELDORJ~ IF ~IsValidForPartyDialog("Keldorn")~ THEN
    @25
  == ~CERNDJ~ IF ~IsValidForPartyDialog("Cernd")~ THEN
    @26
  == ~JANJ~ IF ~IsValidForPartyDialog("Jan")~ THEN
    @27
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Jan")~ THEN
    @28
  == ~MAZZYJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN
    @29
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN
    @30
  == ~MAZZYJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN
    @31
  == ~VALYGARJ~ IF ~IsValidForPartyDialog("Valygar")~ THEN
    @32
  == ~DORNJ~ IF ~IsValidForPartyDialog("Dorn")~ THEN
    @33
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Dorn")~ THEN
    @34
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan")~ THEN
    @35
  == ~HEXXATJ~ IF ~IsValidForPartyDialog("Hexxat")~ THEN
    @36
  == ~RASAADJ~ IF ~IsValidForPartyDialog("Rasaad")~ THEN
    @37
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Rasaad")~ THEN
    @38
  == ~IMOEN2J~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @39
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @40
  == ~IMOEN2J~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @41
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @42
END ~VICONIJ~ QCV_FAREWELL

CHAIN IF ~False()~ THEN ~VICONIJ~ QCV_HURRY
  @43
  == ~EDWINJ~ IF ~IsValidForPartyDialog("Edwin")~ THEN
    @44
  == ~JAHEIRAJ~ IF ~IsValidForPartyDialog("Jaheira")~ THEN
    @45
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Aerie")~ THEN
    @46
  == ~ANOMENJ~ IF ~IsValidForPartyDialog("Anomen")~ THEN
    @47
  == ~KELDORJ~ IF ~IsValidForPartyDialog("Keldorn")~ THEN
    @48
  == ~CERNDJ~ IF ~IsValidForPartyDialog("Cernd")~ THEN
    @49
  == ~JANJ~ IF ~IsValidForPartyDialog("Jan")~ THEN
    @50
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Jan")~ THEN
    @51
  == ~MAZZYJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN
    @52
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN
    @53
  == ~MAZZYJ~ IF ~IsValidForPartyDialog("Mazzy")~ THEN
    @54
  == ~VALYGARJ~ IF ~IsValidForPartyDialog("Valygar")~ THEN
    @55
  == ~DORNJ~ IF ~IsValidForPartyDialog("Dorn")~ THEN
    @56
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Dorn")~ THEN
    @57
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan")~ THEN
    @58
  == ~HEXXATJ~ IF ~IsValidForPartyDialog("Hexxat")~ THEN
    @59
  == ~RASAADJ~ IF ~IsValidForPartyDialog("Rasaad")~ THEN
    @60
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Rasaad")~ THEN
    @61
  == ~IMOEN2J~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @62
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @63
  == ~IMOEN2J~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @64
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Imoen2")~ THEN
    @65
END ~VICONIJ~ QCV_FAREWELL

APPEND ~VICONIJ~
IF ~False()~ THEN BEGIN QCV_FIRST1
  SAY @66
  IF ~~ THEN EXTERN ~QCVVAL1~ QCV_CHOICE2
END
IF ~False()~ THEN BEGIN QCV_FIRST2
  SAY @67
  IF ~~ THEN EXTERN ~QCVVAL1~ QCV_CHOICE2
END
IF ~False()~ THEN BEGIN QCV_FIRST3
  SAY @68
  IF ~~ THEN EXTERN ~QCVVAL1~ QCV_CHOICE2
END
IF ~False()~ THEN BEGIN QCV_FAREWELL
  SAY @69
  IF ~~ THEN EXTERN ~QCVVAL1~ QCV_LEAVE
END
IF ~False()~ THEN BEGIN QCV_SECOND_OK
  SAY @70
  IF ~~ THEN DO ~SetGlobal("QCV_STAGE","GLOBAL",2)~ EXIT
END
IF ~False()~ THEN BEGIN QCV_SECOND_HURRY
  SAY @71
  IF ~~ THEN DO ~SetGlobal("QCV_STAGE","GLOBAL",2)~ EXIT
END
END

APPEND ~QCVVAL1~
IF ~False()~ THEN BEGIN QCV_CHOICE2
  SAY @72
  ++ @73 EXTERN ~VICONIJ~ QCV_MOMENT
  ++ @74 EXTERN ~VICONIJ~ QCV_HURRY
END
IF ~False()~ THEN BEGIN QCV_LEAVE
  SAY @75
  IF ~~ THEN DO ~SetGlobal("QCV_STAGE","GLOBAL",1)~ EXIT
END
END

CHAIN IF ~Global("QCV_STAGE","GLOBAL",1) IsValidForPartyDialog("Viconia")~ THEN ~QCVVAL2~ QCVSECOND
  @76
  == ~VICONIJ~
    @77
  == ~QCVVAL2~
    @78
  == ~VICONIJ~
    @79
  == ~QCVVAL2~
    @80
  == ~VICONIJ~
    @81
  == ~QCVVAL2~
    @82
  == ~QCVVAL2~
    @83
  == ~VICONIJ~
    @84
  == ~VICONIJ~
    @85
  == ~QCVVAL2~
    @86
  == ~QCVVAL2~
    @87
  == ~VICONIJ~
    @88
  == ~QCVVAL2~
    @89
  == ~VICONIJ~
    @90
  == ~QCVVAL2~
    @91
  == ~QCVVAL2~
    @92
  == ~VICONIJ~
    @93
  == ~QCVVAL2~
    @94
  == ~VICONIJ~
    @95
END
  ++ @96 EXTERN ~VICONIJ~ QCV_SECOND_OK
  ++ @97 EXTERN ~VICONIJ~ QCV_SECOND_HURRY

