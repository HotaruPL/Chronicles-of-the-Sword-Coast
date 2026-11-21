// ---------------------------------------------------------------------------
// BETTER IMMERSION FOR BALDUR'S GATE - PURPLE WYRM INN (PART 1)
// Theo, Kaeira, Delcia, Bartender placeholder, commoners and cook.
// ---------------------------------------------------------------------------

BEGIN PWYTHEO
IF ~True()~ THEN BEGIN 0
  SAY @9002
  IF ~~ THEN REPLY @9003 GOTO 1
  IF ~~ THEN REPLY @9004 GOTO 2
  IF ~~ THEN REPLY @9005 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @9006
  IF ~~ THEN GOTO 0
END

IF ~~ THEN BEGIN 2
  SAY @9007
  IF ~~ THEN REPLY @9008 GOTO 10
  IF ~~ THEN REPLY @9009 GOTO 20
  IF ~~ THEN REPLY @9010 GOTO 30
  IF ~~ THEN REPLY @9011 GOTO 40
  IF ~~ THEN REPLY @9012 EXIT
END

IF ~~ THEN BEGIN 10
  SAY @9013
  IF ~~ THEN GOTO 11
END

IF ~~ THEN BEGIN 11
  SAY @9014
  IF ~~ THEN GOTO 12
END

IF ~~ THEN BEGIN 12
  SAY @9015
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 20
  SAY @9016
  IF ~~ THEN GOTO 21
END

IF ~~ THEN BEGIN 21
  SAY @9017
  IF ~~ THEN GOTO 22
END

IF ~~ THEN BEGIN 22
  SAY @9018
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 30
  SAY @9019
  IF ~~ THEN GOTO 31
END

IF ~~ THEN BEGIN 31
  SAY @9020
  IF ~~ THEN GOTO 32
END

IF ~~ THEN BEGIN 32
  SAY @9021
  IF ~~ THEN GOTO 33
END

IF ~~ THEN BEGIN 33
  SAY @9022
  IF ~~ THEN GOTO 34
END

IF ~~ THEN BEGIN 34
  SAY @9023
  IF ~~ THEN GOTO 2
END

IF ~~ THEN BEGIN 40
  SAY @9024
  IF ~~ THEN REPLY @9025 GOTO 41
  IF ~~ THEN REPLY @9026 GOTO 43
  IF ~~ THEN REPLY @9027 GOTO 2
END

IF ~~ THEN BEGIN 41
  SAY @9028
  IF ~~ THEN GOTO 42
END

IF ~~ THEN BEGIN 42
  SAY @9029
  IF ~~ THEN REPLY @9030 GOTO 41
  IF ~~ THEN REPLY @9031 GOTO 43
  IF ~~ THEN REPLY @9032 GOTO 2
END

IF ~~ THEN BEGIN 43
  SAY @9033
  IF ~~ THEN GOTO 2
END

// ---------------------------------------------------------------------------
// KAEIRA
// ---------------------------------------------------------------------------

BEGIN PWYKAEI
IF ~Global("PWY_KAEIRA_COMPLETED","GLOBAL",1)~ THEN BEGIN 50
  SAY @9034
  IF ~~ THEN EXIT
END

IF ~Global("PWY_KAEIRA_COMPLETED","GLOBAL",0)~ THEN BEGIN 0
  SAY @9035
  IF ~~ THEN REPLY @9036 GOTO 1
  IF ~~ THEN REPLY @9037 GOTO 2
  IF ~~ THEN REPLY @9038 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @9039
  IF ~~ THEN REPLY @9040 GOTO 3
  IF ~~ THEN REPLY @9041 GOTO 4
  IF ~~ THEN REPLY @9042 GOTO 5
END

IF ~~ THEN BEGIN 3
  SAY @9043
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 4
  SAY @9044
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 5
  SAY @9045
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 2
  SAY @9046
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6
  SAY @9047
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY @9048
  IF ~~ THEN REPLY @9049 DO ~SetGlobal("PWY_KAEIRA_ACCEPTED","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @9050 EXIT
END

// ---------------------------------------------------------------------------
// DELCIA / HENDRON
// ---------------------------------------------------------------------------

BEGIN PWYDELC
IF ~True()~ THEN BEGIN 0
  SAY @9051
  IF ~~ THEN DO ~SetGlobal("PWY_DELCIA_LEAVE","GLOBAL",1)~ EXIT
END

// ---------------------------------------------------------------------------
// HALFLING COMMONER
// ---------------------------------------------------------------------------

BEGIN PWYHALF
IF ~True()~ THEN BEGIN 0
  SAY @9052
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// MALE HUMAN COMMONER
// ---------------------------------------------------------------------------

BEGIN PWYCMNR
IF ~True()~ THEN BEGIN 0
  SAY @9053
  IF ~InParty("Coran") InMyArea("Coran") !StateCheck("Coran",CD_STATE_NOTVALID)~ THEN EXTERN CORANJ PWY_CORAN_INTERJECT
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PWY_CORAN_REPLY
  SAY @9054
  IF ~~ THEN EXIT
END

APPEND CORANJ
IF WEIGHT #-1 ~False()~ THEN BEGIN PWY_CORAN_INTERJECT
  SAY @9055
  IF ~~ THEN EXTERN PWYCMNR PWY_CORAN_REPLY
END
END

// ---------------------------------------------------------------------------
// TROLL COOK
// ---------------------------------------------------------------------------

BEGIN PWYCOOK
IF ~True()~ THEN BEGIN 0
  SAY @9056
  IF ~~ THEN REPLY @9057 GOTO 1
  IF ~~ THEN REPLY @9058 GOTO 2
  IF ~~ THEN REPLY @9059 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @9060
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY @9061
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// BARTENDER - store hookup deliberately left for the store pass.
// ---------------------------------------------------------------------------

BEGIN PWYBART
IF ~True()~ THEN BEGIN 0
  SAY @9062
  IF ~~ THEN REPLY @9063 GOTO 1
  IF ~~ THEN REPLY @9064 EXIT
END

IF ~~ THEN BEGIN 1
  SAY @9065
  IF ~~ THEN DO ~StartStore("PWYINN",LastTalkedToBy(Myself))~ EXIT
END
// ---------------------------------------------------------------------------
// DURBEM
// ---------------------------------------------------------------------------

BEGIN PWYDURB

// Durbem's recovered key: these priority states do not change the original offer.
IF ~Global("PWY_DURB_DONE","GLOBAL",1)~ THEN BEGIN PWY_DURB_DONE_TALK
  SAY @9066
  IF ~~ THEN EXIT
END

IF ~Global("PWY_DURB_ACCEPTED","GLOBAL",1) PartyHasItem("PWYDKKEY")~ THEN BEGIN PWY_DURB_RETURN
  SAY @9067
  IF ~~ THEN REPLY @9068 DO ~TakePartyItem("PWYDKKEY") DestroyItem("PWYDKKEY") SetGlobal("PWY_DURB_DONE","GLOBAL",1) GiveGoldForce(100) AddExperienceParty(700)~ SOLVED_JOURNAL @9001 GOTO PWY_DURB_PURPOSE
  IF ~~ THEN REPLY @9069 DO ~TakePartyItem("PWYDKKEY") DestroyItem("PWYDKKEY") SetGlobal("PWY_DURB_DONE","GLOBAL",1) GiveGoldForce(100) AddExperienceParty(700)~ SOLVED_JOURNAL @9001 GOTO PWY_DURB_THANKS
  IF ~~ THEN REPLY @9070 DO ~TakePartyItem("PWYDKKEY") DestroyItem("PWYDKKEY") SetGlobal("PWY_DURB_DONE","GLOBAL",1) GiveGoldForce(100) AddExperienceParty(700)~ SOLVED_JOURNAL @9001 GOTO PWY_DURB_PAYMENT
END

IF ~Global("PWY_DURB_ACCEPTED","GLOBAL",1)~ THEN BEGIN PWY_DURB_WAIT
  SAY @9071
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN PWY_DURB_PURPOSE
  SAY @9072
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN PWY_DURB_THANKS
  SAY @9073
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN PWY_DURB_PAYMENT
  SAY @9074
  IF ~~ THEN EXIT
END

IF ~Global("PWY_DURB_REFUSED","LOCALS",1)~ THEN BEGIN 100
  SAY @9075
  ++ @9076 GOTO 101
  ++ @9077 EXIT
END

IF ~True()~ THEN BEGIN 0
  SAY @9078
  IF ~Race(Player1,HUMAN)~ THEN REPLY @9079 GOTO 11
  IF ~Race(Player1,ELF)~ THEN REPLY @9080 GOTO 12
  IF ~Race(Player1,HALF_ELF)~ THEN REPLY @9081 GOTO 13
  IF ~Race(Player1,DWARF)~ THEN REPLY @9082 GOTO 14
  IF ~Race(Player1,HALFLING)~ THEN REPLY @9083 GOTO 15
  IF ~Race(Player1,GNOME)~ THEN REPLY @9084 GOTO 16
  IF ~Race(Player1,HALFORC)~ THEN REPLY @9085 GOTO 17
  IF ~~ THEN REPLY @9086 EXIT
END

IF ~~ THEN BEGIN 11
  SAY @9087
  ++ @9088 GOTO 2
  ++ @9089 EXIT
END

IF ~~ THEN BEGIN 12
  SAY @9090
  ++ @9091 GOTO 2
  ++ @9092 EXIT
END

IF ~~ THEN BEGIN 13
  SAY @9093
  ++ @9094 GOTO 2
  ++ @9095 EXIT
END

IF ~~ THEN BEGIN 14
  SAY @9096
  ++ @9097 GOTO 2
  ++ @9098 EXIT
END

IF ~~ THEN BEGIN 15
  SAY @9099
  ++ @9100 GOTO 2
  ++ @9101 EXIT
END

IF ~~ THEN BEGIN 16
  SAY @9102
  ++ @9103 GOTO 2
  ++ @9104 EXIT
END

IF ~~ THEN BEGIN 17
  SAY @9105
  ++ @9106 GOTO 2
  ++ @9107 EXIT
END

IF ~~ THEN BEGIN 2
  SAY @9108
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3
  SAY @9109
  ++ @9110 GOTO 4
  ++ @9111 GOTO 5
END

IF ~~ THEN BEGIN 4
  SAY @9112
  IF ~~ THEN DO ~SetGlobal("PWY_DURB_ACCEPTED","GLOBAL",1)~ UNSOLVED_JOURNAL @9000 EXIT
END

IF ~~ THEN BEGIN 5
  SAY @9113
  IF ~~ THEN DO ~SetGlobal("PWY_DURB_REFUSED","LOCALS",1)~ EXIT
END

IF ~~ THEN BEGIN 101
  SAY @9114
  IF ~~ THEN DO ~SetGlobal("PWY_DURB_ACCEPTED","GLOBAL",1)~ UNSOLVED_JOURNAL @9000 EXIT
END

IF ~~ THEN BEGIN PWY_DURB_EDWIN_CONT
  SAY @9115
  ++ @9116 GOTO 4
  ++ @9117 GOTO 5
END

// Edwin interjection: use WeiDU's standard INTERJECT mechanism so Edwin is
// explicitly the speaker and the conversation returns to Durbem state 3.
// This avoids relying on a hand-routed EXTERN into Edwin's joining dialogue.
INTERJECT PWYDURB 2 PWY_DURB_EDWIN_INT
  == EDWINJ_ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @9118
END PWYDURB 3

