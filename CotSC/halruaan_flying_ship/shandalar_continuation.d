// ============================================================
// Shandalar quest continuation
// State 2: return from Northern Wilderness; send the party to the
// Friendly Arm Inn after Shandalar explains Ervin's history.
// State 4: return from Friendly Arm; send the party to Shandalar's daughters.
// State 7: final return; teleport is intentionally NOT implemented.
// ============================================================

APPEND ~QCSHAND~
  IF WEIGHT #-1000 ~Global("QCFlyShipQuest","GLOBAL",2)~ THEN BEGIN QC_RETURN_NORTH
    SAY @173
    IF ~~ THEN REPLY @174 GOTO QC_ER_V1
  END

  IF ~~ THEN BEGIN QC_ER_V1
    SAY @175
    IF ~~ THEN REPLY @176 GOTO QC_ER_V2
  END

  IF ~~ THEN BEGIN QC_ER_V2
    SAY @177
    IF ~~ THEN GOTO QC_ER_V3
  END

  IF ~~ THEN BEGIN QC_ER_V3
    SAY @178
    IF ~~ THEN GOTO QC_ER_V4
  END

  IF ~~ THEN BEGIN QC_ER_V4
    SAY @179
    IF ~~ THEN GOTO QC_ER_V5
  END

  IF ~~ THEN BEGIN QC_ER_V5
    SAY @180
    IF ~~ THEN GOTO QC_ER_V6
  END

  IF ~~ THEN BEGIN QC_ER_V6
    SAY @181
    IF ~Dead("Resar")~ THEN GOTO QC_ER_V6A
    IF ~!Dead("Resar")~ THEN GOTO QC_ER_V6B
  END

  IF ~~ THEN BEGIN QC_ER_V6A
    SAY @182
    IF ~~ THEN GOTO QC_ER_V7
  END

  IF ~~ THEN BEGIN QC_ER_V6B
    SAY @183
    IF ~~ THEN GOTO QC_ER_V7
  END

  IF ~~ THEN BEGIN QC_ER_V7
    SAY @184
    IF ~~ THEN GOTO QC_ER_V8
  END

  IF ~~ THEN BEGIN QC_ER_V8
    SAY @185
    IF ~~ THEN GOTO QC_ER_V9
  END

  IF ~~ THEN BEGIN QC_ER_V9
    SAY @186
    IF ~~ THEN GOTO QC_PLAN_OPTIONS
  END

  IF ~~ THEN BEGIN QC_PLAN_OPTIONS
    SAY @187
    IF ~~ THEN REPLY @188 GOTO QC_COUNCIL_ANSWER
    IF ~~ THEN REPLY @189 GOTO QC_LOCATE
    IF ~~ THEN REPLY @190 GOTO QC_LOCATE
  END

  IF ~~ THEN BEGIN QC_COUNCIL_ANSWER
    SAY @191
    IF ~~ THEN GOTO QC_PLAN_OPTIONS
  END

  IF ~~ THEN BEGIN QC_LOCATE
    SAY @192
    IF ~~ THEN GOTO QC_LOCATE2
  END

  IF ~~ THEN BEGIN QC_LOCATE2
    SAY @193
    IF ~~ THEN DO ~SetGlobal("QCFlyShipQuest","GLOBAL",3) SetGlobal("QCErvinFA_Spawned","GLOBAL",0)
AddJournalEntry(@4,QUEST)~ EXIT
  END

  // ----------------------------------------------------------
  // Return from Friendly Arm Inn: branch into the three outcomes.
  // ----------------------------------------------------------
  IF WEIGHT #-999 ~Global("QCFlyShipQuest","GLOBAL",4)~ THEN BEGIN QC_RETURN_FA
    SAY @194
    IF ~~ THEN REPLY @195 GOTO QC_CHANGED
    IF ~Global("QCErvinAmuletKnown","GLOBAL",1)~ THEN REPLY @196 GOTO QC_AMULET
    IF ~Global("QCErvinAmuletKnown","GLOBAL",0)~ THEN REPLY @197 GOTO QC_NO_AMULET
    IF ~~ THEN REPLY @198 EXIT
  END

  IF ~~ THEN BEGIN QC_CHANGED
    SAY @199
    IF ~~ THEN REPLY @200 DO ~SetGlobal("QCFlyShipQuest","GLOBAL",8)~ GOTO QC_CHANGED_END
  END

  IF ~~ THEN BEGIN QC_CHANGED_END
    SAY @201
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN QC_AMULET
    SAY @202
    // Alatos received the skyship components (Resar died), or a daughter is dead.
    // Skip the now-impossible errand and proceed directly to the Ice Island.
    // The engine evaluates automatic transitions BOTTOM TO TOP.
    // Keep the unconditional fallback first so it cannot hide the skip.
    IF ~~ THEN GOTO QC_DAUGHTERS
    IF ~OR(5) GlobalGT("ResarAttack","GLOBAL",0) Dead("Resar") Dead("Delorna") Dead("Helshara") Dead("Ithmeera")~ THEN GOTO QC_SKIP_DAUGHTERS
  END

  IF ~~ THEN BEGIN QC_NO_AMULET
    SAY @203
    // Alatos received the skyship components (Resar died), or a daughter is dead.
    // Skip the now-impossible errand and proceed directly to the Ice Island.
    // The engine evaluates automatic transitions BOTTOM TO TOP.
    // Keep the unconditional fallback first so it cannot hide the skip.
    IF ~~ THEN GOTO QC_DAUGHTERS
    IF ~OR(5) GlobalGT("ResarAttack","GLOBAL",0) Dead("Resar") Dead("Delorna") Dead("Helshara") Dead("Ithmeera")~ THEN GOTO QC_SKIP_DAUGHTERS
  END

  IF ~~ THEN BEGIN QC_DAUGHTERS
    SAY @204
    IF ~~ THEN DO ~SetGlobal("QCFlyShipQuest","GLOBAL",5)
AddJournalEntry(@6,QUEST)~ EXIT
  END

  // Recovery for pre-patch saves already stuck at the daughter's errand stage.
  IF WEIGHT #-1001 ~Global("QCFlyShipQuest","GLOBAL",5)
OR(5)
  GlobalGT("ResarAttack","GLOBAL",0)
  Dead("Resar")
  Dead("Delorna")
  Dead("Helshara")
  Dead("Ithmeera")~ THEN BEGIN QC_SKIP_STALLED
    SAY @205
    IF ~~ THEN GOTO QC_SKIP_DAUGHTERS
  END

  // Alternate final return when Alatos has the components, or any daughter
  // has died. All travel actions are identical to the normal final return.
  IF ~~ THEN BEGIN QC_SKIP_DAUGHTERS
    SAY @206
    IF ~~ THEN DO ~SetGlobal("QCFlyShipQuest","GLOBAL",8)
AddJournalEntry(@8,QUEST)
ActionOverride("QCSHAND",DestroySelf())
ActionOverride(Player1,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player2,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player3,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player4,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player5,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player6,LeaveAreaLUA("QCICEA","",[398.488],0))~ EXIT
  END

  // ----------------------------------------------------------
  // Final return  // ----------------------------------------------------------
  IF WEIGHT #-998 ~Global("QCFlyShipQuest","GLOBAL",7)~ THEN BEGIN QC_FINAL_RETURN
    SAY @207
    IF ~~ THEN DO ~SetGlobal("QCFlyShipQuest","GLOBAL",8)
AddJournalEntry(@8,QUEST)
ActionOverride("QCSHAND",DestroySelf())
ActionOverride(Player1,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player2,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player3,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player4,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player5,LeaveAreaLUA("QCICEA","",[398.488],0))
ActionOverride(Player6,LeaveAreaLUA("QCICEA","",[398.488],0))~ EXIT
  END
END
