// Helshara receives the requested line while the daughters are awaiting recall.
APPEND_EARLY ~HELSHA~
  IF WEIGHT #-1000 ~OR(2) Global("QCFlyShipQuest","GLOBAL",5) Global("QCFlyShipQuest","GLOBAL",6)~ THEN BEGIN QC_Helshara_NEW
    SAY @171
    IF ~~ THEN EXIT
  END
END
