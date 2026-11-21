// Ithmeera receives the requested line while the daughters are awaiting recall.
APPEND_EARLY ~ITHMEE~
  IF WEIGHT #-1000 ~OR(2) Global("QCFlyShipQuest","GLOBAL",5) Global("QCFlyShipQuest","GLOBAL",6)~ THEN BEGIN QC_Ithmeera_NEW
    SAY @172
    IF ~~ THEN EXIT
  END
END
