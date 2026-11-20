// Self-contained v2.2c dialogue repair.
// WeiDU symbolic labels are only available reliably within the same D-file
// compilation. Declare each destination before REPLACE references it.
// Don't alter Minsc, vanilla recruitment dialogue, or other companions' states.

APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN QRV_J22C
  SAY @1
  IF ~~ THEN EXIT
END
END

APPEND ~AERIEJ~
IF ~~ THEN BEGIN QRV_A22C
  SAY @2
  IF ~~ THEN EXIT
END
END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN QRV_V22C
  SAY @3
  IF ~~ THEN EXIT
END
END

APPEND ~NEERAJ~
IF ~~ THEN BEGIN QRV_N22C
  SAY @4
  IF ~~ THEN EXIT
END
END

REPLACE ~QRVFLRT~
IF ~InParty("Jaheira") InMyArea("Jaheira")~ THEN BEGIN 0
  SAY @5
  IF ~~ THEN EXTERN ~JAHEIRAJ~ QRV_J22C
END
IF ~InParty("Aerie") InMyArea("Aerie")~ THEN BEGIN 1
  SAY @6
  IF ~~ THEN EXTERN ~AERIEJ~ QRV_A22C
END
IF ~InParty("Viconia") InMyArea("Viconia")~ THEN BEGIN 2
  SAY @7
  IF ~~ THEN EXTERN ~VICONIJ~ QRV_V22C
END
IF ~InParty("Neera") InMyArea("Neera")~ THEN BEGIN 3
  SAY @8
  IF ~~ THEN EXTERN ~NEERAJ~ QRV_N22C
END
IF ~True()~ THEN BEGIN 4
  SAY @9
  IF ~~ THEN EXIT
END
END
