BEGIN QCERVIN

// ============================================================
// Northern Wilderness encounter (quest state 1)
// ============================================================
IF ~Global("QCFlyShipQuest","GLOBAL",1)~ THEN BEGIN 0
  SAY @64
  IF ~~ THEN REPLY @65 GOTO 1
  IF ~~ THEN REPLY @66 GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @67
  IF ~~ THEN DO ~SetGlobal("QCFlyShipQuest","GLOBAL",2)
AddJournalEntry(@3,QUEST)
ForceSpellRES("SPWI402",Myself)
Wait(2)
DestroySelf()~ EXIT
END

// ============================================================
// Friendly Arm Inn encounter (quest state 3)
// ============================================================
IF ~Global("QCFlyShipQuest","GLOBAL",3)~ THEN BEGIN FA_START
  SAY @69
  IF ~~ THEN REPLY @70 GOTO FA_REPLY1
  IF ~~ THEN REPLY @71 GOTO FA_REPLY2
  IF ~~ THEN REPLY @72 GOTO FA_REPLY3
END

IF ~~ THEN BEGIN FA_REPLY1
  SAY @73
  IF ~~ THEN GOTO FA_EXPLAIN
END

IF ~~ THEN BEGIN FA_REPLY2
  SAY @74
  IF ~~ THEN GOTO FA_EXPLAIN
END

IF ~~ THEN BEGIN FA_REPLY3
  SAY @75
  IF ~~ THEN GOTO FA_EXPLAIN
END

IF ~~ THEN BEGIN FA_EXPLAIN
  SAY @76
  IF ~~ THEN REPLY @77 GOTO FA_DLG3
  IF ~~ THEN REPLY @78 GOTO FA_DLG3
END

IF ~~ THEN BEGIN FA_DLG3
  SAY @79
  IF ~~ THEN GOTO FA_DLG4
END

IF ~~ THEN BEGIN FA_DLG4
  SAY @80
  IF ~~ THEN GOTO FA_DLG5
END

IF ~~ THEN BEGIN FA_DLG5
  SAY @81
  IF ~~ THEN GOTO FA_DLG6
END

IF ~~ THEN BEGIN FA_DLG6
  SAY @82
  IF ~~ THEN GOTO FA_DLG7
END

IF ~~ THEN BEGIN FA_DLG7
  SAY @83
  IF ~~ THEN GOTO FA_DLG8
END

IF ~~ THEN BEGIN FA_DLG8
  SAY @84
  IF ~~ THEN GOTO FA_DLG9
END

IF ~~ THEN BEGIN FA_DLG9
  SAY @85
  IF ~~ THEN GOTO FA_FINAL
END

IF ~~ THEN BEGIN FA_FINAL
  SAY @86
  IF ~~ THEN REPLY @87 GOTO FA_CHOICE1
  IF ~~ THEN REPLY @88 GOTO FA_CHOICE2
  IF ~~ THEN REPLY @89 GOTO FA_CHOICE3
END

IF ~~ THEN BEGIN FA_CHOICE1
  SAY @90
  IF ~~ THEN DO ~SetGlobal("QCErvinAmuletKnown","GLOBAL",1)
SetGlobal("QCFlyShipQuest","GLOBAL",4)
AddJournalEntry(@5,QUEST)
ForceSpellRES("SPWI402",Myself)
DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN FA_CHOICE2
  SAY @91
  IF ~~ THEN DO ~SetGlobal("QCErvinAmuletKnown","GLOBAL",0)
SetGlobal("QCFlyShipQuest","GLOBAL",4)
AddJournalEntry(@5,QUEST)
ForceSpellRES("SPWI402",Myself)
DestroySelf()~ EXIT
END

IF ~~ THEN BEGIN FA_CHOICE3
  SAY @92
  IF ~~ THEN DO ~SetGlobal("QCErvinAmuletKnown","GLOBAL",0)
SetGlobal("QCFlyShipQuest","GLOBAL",4)
AddJournalEntry(@5,QUEST)
ForceSpellRES("SPWI402",Myself)
DestroySelf()~ EXIT
END
