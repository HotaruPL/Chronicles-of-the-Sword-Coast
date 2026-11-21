// Cure for Madness? - Arbolon dialogue
// Parse 3: replace invalid in-state == speaker switches with explicit
// transitions into unique appended states in Tiax's joined dialogue.

BEGIN QCARBOL

// ---------------------------------------------------------------------
// Tiax is NOT in the party: brief encounter and departure.
// ---------------------------------------------------------------------
IF ~!InParty("TIAX")~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN REPLY @2 GOTO 1
  IF ~~ THEN REPLY @3 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @4
  IF ~~ THEN DO ~SetGlobal("QCARBOLON_COMPLETE","GLOBAL",1)~ EXIT
END

// ---------------------------------------------------------------------
// Tiax is in the party.
// ---------------------------------------------------------------------
IF ~InParty("TIAX")~ THEN BEGIN 10
  SAY @5
  IF ~~ THEN EXTERN ~TIAXJ~ QCM_TIA6
END

IF ~~ THEN BEGIN QCM_ARB7
  SAY @7
  IF ~~ THEN EXTERN ~TIAXJ~ QCM_TIA8
END

IF ~~ THEN BEGIN QCM_ARB9
  SAY @9
  IF ~~ THEN REPLY @10 GOTO QCM_WHO
  IF ~~ THEN REPLY @11 GOTO QCM_KNOW
  IF ~~ THEN REPLY @12 GOTO QCM_LEAVE
END

// Player asks who Arbolon is. The other two options remain available.
IF ~~ THEN BEGIN QCM_WHO
  SAY @13
  IF ~~ THEN REPLY @11 GOTO QCM_KNOW
  IF ~~ THEN REPLY @12 GOTO QCM_LEAVE
END

// Player asks how Arbolon knows Tiax.
IF ~~ THEN BEGIN QCM_KNOW
  SAY @15
  IF ~~ THEN GOTO QCM_KNOW2
END

IF ~~ THEN BEGIN QCM_KNOW2
  SAY @16
  IF ~~ THEN EXTERN ~TIAXJ~ QCM_TIA17
END

IF ~~ THEN BEGIN QCM_ARB18
  SAY @18
  IF ~~ THEN GOTO QCM_ARB19
END

IF ~~ THEN BEGIN QCM_ARB19
  SAY @19
  IF ~~ THEN REPLY @25 GOTO QCM_RISK
END

// Player rejects further discussion from the main menu.
IF ~~ THEN BEGIN QCM_LEAVE
  SAY @4
  IF ~~ THEN DO ~SetGlobal("QCARBOLON_LEAVE","GLOBAL",1) SetGlobal("QCARBOLON_COMPLETE","GLOBAL",1)~ EXIT
END

// Arbolon explains the risks of the Cleansing ritual.
IF ~~ THEN BEGIN QCM_RISK
  SAY @26
  IF ~~ THEN REPLY @27 GOTO QCM_ACCEPT
  IF ~~ THEN REPLY @28 GOTO QCM_LEAVE
END

// Accept the ritual.
IF ~~ THEN BEGIN QCM_ACCEPT
  SAY @29
  IF ~~ THEN EXTERN ~TIAXJ~ QCM_TIA30
END

// ---------------------------------------------------------------------
// Ritual sequence.
// ---------------------------------------------------------------------
IF ~~ THEN BEGIN QCM_ARB31
  SAY @31
  IF ~~ THEN EXTERN ~TIAXJ~ QCM_TIA32
END

IF ~~ THEN BEGIN QCM_ARB33
  SAY @33
  IF ~~ THEN GOTO QCM_ARB34
END

IF ~~ THEN BEGIN QCM_ARB34
  SAY @34
  IF ~~ THEN GOTO QCM_ARB35
END

IF ~~ THEN BEGIN QCM_ARB35
  SAY @35
  IF ~~ THEN GOTO QCM_ARB36
END

IF ~~ THEN BEGIN QCM_ARB36
  SAY @36
  IF ~~ THEN GOTO QCM_ARB37
END

IF ~~ THEN BEGIN QCM_ARB37
  SAY @37
  IF ~~ THEN EXTERN ~TIAXJ~ QCM_TIA38
END

IF ~~ THEN BEGIN QCM_ARB39
  SAY @39
  IF ~~ THEN DO ~SetGlobal("QCARBOLON_RITUAL","GLOBAL",1) SetGlobal("QCARBOLON_LEAVE","GLOBAL",1)~ EXIT
END

// ---------------------------------------------------------------------
// Add only the new Tiax response states required by this component.
// Existing TIAXJ dialogue states are not replaced or altered.
// ---------------------------------------------------------------------
APPEND ~TIAXJ~

IF ~~ THEN BEGIN QCM_TIA6
  SAY @6
  IF ~~ THEN EXTERN ~QCARBOL~ QCM_ARB7
END

IF ~~ THEN BEGIN QCM_TIA8
  SAY @8
  IF ~~ THEN EXTERN ~QCARBOL~ QCM_ARB9
END

IF ~~ THEN BEGIN QCM_TIA17
  SAY @17
  IF ~~ THEN EXTERN ~QCARBOL~ QCM_ARB18
END

IF ~~ THEN BEGIN QCM_TIA30
  SAY @30
  IF ~~ THEN EXTERN ~QCARBOL~ QCM_ARB31
END

IF ~~ THEN BEGIN QCM_TIA32
  SAY @32
  IF ~~ THEN EXTERN ~QCARBOL~ QCM_ARB33
END

IF ~~ THEN BEGIN QCM_TIA38
  SAY @38
  IF ~~ THEN EXTERN ~QCARBOL~ QCM_ARB39
END

END
