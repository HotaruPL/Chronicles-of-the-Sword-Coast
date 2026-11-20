// Quest-state dialogue only. The original Delorna dialogue remains intact.
APPEND_EARLY ~DELORN~
  IF WEIGHT #-1000 ~OR(2) Global("QCFlyShipQuest","GLOBAL",5) Global("QCFlyShipQuest","GLOBAL",6)~ THEN BEGIN QC_Delorna_NEW
    SAY @93
    IF ~~ THEN REPLY @94 GOTO QC_Delorna_END
  END

  IF ~~ THEN BEGIN QC_Delorna_END
    SAY @95
    IF ~~ THEN DO ~ActionOverride("DELORNA",EscapeArea())
ActionOverride("HELSHARA",EscapeArea())
ActionOverride("ITHMEERA",EscapeArea())
SetGlobal("QCFlyShipQuest","GLOBAL",7)
AddJournalEntry(@7,QUEST)~ EXIT
  END
END
