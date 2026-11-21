BEGIN ~QHHAN~

IF ~True()~ THEN BEGIN HannibalChallenge
  SAY @1
  IF ~~ THEN DO ~SetGlobal("QH_HANN_FIGHT","GLOBAL",1) Enemy()~ EXIT
END
