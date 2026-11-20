// ---------------------------------------------------------------------------
// RED QUEEN - RED FANG MARAUDERS
// ---------------------------------------------------------------------------

BEGIN PWYREDQ

IF ~~ THEN BEGIN 0
  SAY @1
  IF ~~ THEN DO ~SetGlobal("PWY_RED_QUEEN_ATTACK","GLOBAL",1)~ EXIT
END
