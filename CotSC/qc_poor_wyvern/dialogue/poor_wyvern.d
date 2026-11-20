// Poor Wyvern. No journal entries. Each outcome is one-time.
BEGIN ~QCPWWYV~
IF ~Global("QCPW_RESULT","GLOBAL",2)~ THEN BEGIN fed_repeat
  SAY @1
  IF ~~ THEN EXIT
END
IF ~Global("QCPW_MET","GLOBAL",1) Global("QCPW_RESULT","GLOBAL",0)~ THEN BEGIN repeat
  SAY @2
  IF ~PartyHasItem("QCPWBODY")~ THEN REPLY @3 GOTO feed_begin
  IF ~~ THEN REPLY @4 GOTO mercy
  IF ~~ THEN REPLY @5 GOTO leave
END
// Intro flows directly through whichever companion interjections apply.
// No intermediate wyvern states are spoken between Jaheira, Cernd and Korgan.
IF ~True()~ THEN BEGIN intro
  SAY @6
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QCPW_JAHEIRA
  IF ~!IsValidForPartyDialog("Jaheira") IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ QCPW_CERND
  IF ~!IsValidForPartyDialog("Jaheira") !IsValidForPartyDialog("Cernd") IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCPW_KORGAN
  IF ~!IsValidForPartyDialog("Jaheira") !IsValidForPartyDialog("Cernd") !IsValidForPartyDialog("Korgan")~ THEN GOTO choice
END
IF ~~ THEN BEGIN choice
  SAY @7
  IF ~PartyHasItem("QCPWBODY")~ THEN REPLY @8 GOTO feed_begin
  IF ~~ THEN REPLY @9 GOTO mercy
  IF ~~ THEN REPLY @10 GOTO leave
  IF ~IsValidForPartyDialog("Cernd")~ THEN REPLY @11 EXTERN ~CERNDJ~ QCPW_FEED_ADVICE
END
IF ~~ THEN BEGIN after_cernd
  SAY @12
  IF ~PartyHasItem("QCPWBODY")~ THEN REPLY @13 GOTO feed_begin
  IF ~~ THEN REPLY @14 GOTO mercy
  IF ~~ THEN REPLY @15 GOTO leave
END
IF ~~ THEN BEGIN mercy
  SAY @16
  IF ~~ THEN DO ~SetGlobal("QCPW_MET","GLOBAL",1) SetGlobal("QCPW_RESULT","GLOBAL",1) AddExperienceParty(500) DestroySelf()~ EXIT
END
IF ~~ THEN BEGIN leave
  SAY @17
  IF ~~ THEN DO ~SetGlobal("QCPW_MET","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN feed_begin
  SAY @18
  IF ~~ THEN GOTO feed_end
END
IF ~~ THEN BEGIN feed_end
  SAY @19
  IF ~~ THEN DO ~SetGlobal("QCPW_MET","GLOBAL",1) SetGlobal("QCPW_RESULT","GLOBAL",2) TakePartyItem("QCPWBODY") DestroyItem("QCPWBODY") AddExperienceParty(10000)~ EXIT
END

// BG2 companions: their actual BG2 dialogue resources, then return to the wyvern.
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN QCPW_JAHEIRA
  SAY @20
  IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ QCPW_CERND
  IF ~!IsValidForPartyDialog("Cernd") IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCPW_KORGAN
  IF ~!IsValidForPartyDialog("Cernd") !IsValidForPartyDialog("Korgan")~ THEN EXTERN ~QCPWWYV~ choice
END
END

APPEND ~CERNDJ~
IF ~~ THEN BEGIN QCPW_CERND
  SAY @21
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCPW_KORGAN
  IF ~!IsValidForPartyDialog("Korgan")~ THEN EXTERN ~QCPWWYV~ choice
END
IF ~~ THEN BEGIN QCPW_FEED_ADVICE
  SAY @22
  IF ~~ THEN EXTERN ~QCPWWYV~ after_cernd
END
END

APPEND ~KORGANJ~
IF ~~ THEN BEGIN QCPW_KORGAN
  SAY @23
  IF ~~ THEN EXTERN ~QCPWWYV~ choice
END
END
