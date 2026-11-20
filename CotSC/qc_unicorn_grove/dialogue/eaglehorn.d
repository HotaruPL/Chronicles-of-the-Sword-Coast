// Eaglehorn and Emhrys: Unicorn Grove. New NPCs; no memory area is installed yet.
BEGIN ~QCUEAG~
IF ~Global("QCU_MEMORYPATH","GLOBAL",1) Global("QCU_MEMACTIVE","GLOBAL",0)~ THEN BEGIN memory_ready_later
  SAY @200
  ++ @201 DO ~SetGlobal("QCU_MEMACTIVE","GLOBAL",1) AddJournalEntry(@103,QUEST)~ EXIT
  ++ @202 EXIT
END
IF ~Global("QCU_EMHSENT","GLOBAL",1) Global("QCU_REUNION","GLOBAL",2)~ THEN BEGIN emh_wait
  SAY @203
  IF ~~ THEN EXIT
END
IF ~Global("QCU_EMHSENT","GLOBAL",1) Global("QCU_REUNION","GLOBAL",1)~ THEN BEGIN emh_return
  SAY @204
  IF ~~ THEN EXTERN ~QCEEMH~ reunion_start
END
IF ~Global("QCU_EMHREQ","GLOBAL",1) Global("QCU_EMHSENT","GLOBAL",0)~ THEN BEGIN emh_pending
  SAY @205
  IF ~~ THEN EXIT
END
IF ~Global("QCU_EAG_RUDE","GLOBAL",1)~ THEN BEGIN rude_again
  SAY @206
  ++ @207 GOTO rude_apology
  ++ @208 GOTO rude_stubborn
END
IF ~True()~ THEN BEGIN opening
  SAY @209
  ++ @210 GOTO questions
  ++ @211 GOTO exploring
  ++ @212 GOTO rude
  ++ @213 GOTO farewell
END
IF ~False()~ THEN BEGIN questions
  SAY @214
  ++ @215 GOTO who1
  IF ~Global("QCU_SIRSH","GLOBAL",1)~ THEN REPLY @216 GOTO shard1
  IF ~Global("QCU_SIRSH","GLOBAL",0)~ THEN REPLY @217 GOTO shard1
  ++ @218 GOTO farewell
END
IF ~False()~ THEN BEGIN exploring
  SAY @219
  IF ~~ THEN GOTO questions
END
IF ~False()~ THEN BEGIN rude
  SAY @220
  IF ~~ THEN DO ~SetGlobal("QCU_EAG_RUDE","GLOBAL",1)~ EXTERN ~QCUEAG~ rude_reply
END
IF ~False()~ THEN BEGIN rude_apology
  SAY @221
  IF ~~ THEN DO ~SetGlobal("QCU_EAG_RUDE","GLOBAL",0)~ GOTO questions
END
IF ~False()~ THEN BEGIN rude_stubborn
  SAY @222
  IF ~~ THEN EXIT
END
IF ~False()~ THEN BEGIN farewell
  SAY @223
  IF ~~ THEN EXIT
END
IF ~False()~ THEN BEGIN who1
  SAY @224
  IF ~~ THEN GOTO who2
END
IF ~False()~ THEN BEGIN who2
  SAY @225
  IF ~~ THEN GOTO questions
END
IF ~False()~ THEN BEGIN shard1
  SAY @226
  IF ~~ THEN GOTO shard2
END
IF ~False()~ THEN BEGIN shard2
  SAY @227
  ++ @228 EXTERN ~QCUEAG~ effect1
  IF ~IsValidForPartyDialog("Edwin")~ THEN REPLY @229 EXTERN ~EDWINJ~ QCU_EDWIN_STUDY
  IF ~IsValidForPartyDialog("Jan")~ THEN REPLY @230 EXTERN ~JANJ~ QCU_JAN_BEGIN
  ++ @231 GOTO emh1
END
IF ~False()~ THEN BEGIN effect1
  SAY @232
  IF ~~ THEN EXTERN ~QCUEAG~ effect_companion
END
IF ~False()~ THEN BEGIN effect2
  SAY @233
  IF ~IsValidForPartyDialog("Edwin")~ THEN REPLY @234 EXTERN ~EDWINJ~ QCU_EDWIN_STUDY
  IF ~IsValidForPartyDialog("Jan")~ THEN REPLY @235 EXTERN ~JANJ~ QCU_JAN_BEGIN
  ++ @236 GOTO emh1
  ++ @237 GOTO discard
END
IF ~False()~ THEN BEGIN discard
  SAY @238
  IF ~~ THEN GOTO effect2
END
IF ~False()~ THEN BEGIN emh1
  SAY @239
  IF ~~ THEN GOTO emh2
END
IF ~False()~ THEN BEGIN emh2
  SAY @240
  IF ~~ THEN GOTO emh3
END
IF ~False()~ THEN BEGIN emh3
  SAY @241
  IF ~~ THEN EXTERN ~QCUEAG~ emh_aerie
END
IF ~False()~ THEN BEGIN emh_address
  SAY @242
  ++ @243 GOTO emh_yes
  ++ @244 GOTO emh_later
END
IF ~False()~ THEN BEGIN emh_yes
  SAY @245
  IF ~~ THEN DO ~SetGlobal("QCU_EMHREQ","GLOBAL",1) SetGlobal("QCU_EAG_REWARD","GLOBAL",1) GiveGoldForce(300) AddJournalEntry(@100,QUEST)~ EXIT
END
IF ~False()~ THEN BEGIN emh_later
  SAY @246
  IF ~~ THEN DO ~SetGlobal("QCU_EMHREQ","GLOBAL",1) AddJournalEntry(@101,QUEST)~ EXIT
END
IF ~False()~ THEN BEGIN edwin_reply
  SAY @247
  ++ @248 GOTO edwin_plan
END
IF ~False()~ THEN BEGIN edwin_plan
  SAY @249
  IF ~~ THEN EXTERN ~EDWINJ~ QCU_EDWIN_STRATEGY
END
IF ~False()~ THEN BEGIN edwin_end
  SAY @250
  IF ~~ THEN EXTERN ~QCUEAG~ memory_choice
END
IF ~False()~ THEN BEGIN jan_interject
  SAY @251
  IF ~~ THEN EXTERN ~JANJ~ QCU_JAN_STORY
END
IF ~False()~ THEN BEGIN jan_after
  SAY @252
  IF ~~ THEN EXTERN ~QCUEAG~ jan_solution
END
IF ~False()~ THEN BEGIN jan_end
  SAY @253
  IF ~~ THEN EXTERN ~QCUEAG~ memory_choice
END
IF ~False()~ THEN BEGIN memory_wait
  SAY @254
  IF ~~ THEN DO ~SetGlobal("QCU_MEMORYPATH","GLOBAL",1) AddJournalEntry(@102,QUEST)~ EXIT
END
IF ~False()~ THEN BEGIN emh_welcome
  SAY @255
  IF ~~ THEN EXTERN ~QCEEMH~ reunion_explain
END
IF ~False()~ THEN BEGIN emh_concern
  SAY @256
  IF ~~ THEN EXTERN ~QCEEMH~ reunion_magic
END

// Companion exchanges. No invented bracketed narrator states.
CHAIN IF ~False()~ THEN ~QCUEAG~ rude_reply
  @257
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan")~ THEN @258
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Aerie")~ THEN @259
END
  IF ~~ THEN EXIT

CHAIN IF ~False()~ THEN ~QCUEAG~ effect_companion
  @260
  == ~CERNDJ~ IF ~IsValidForPartyDialog("Cernd")~ THEN @261
  == ~QCUEAG~ IF ~IsValidForPartyDialog("Cernd")~ THEN @262
END
  IF ~~ THEN EXTERN ~QCUEAG~ effect2

CHAIN IF ~False()~ THEN ~QCUEAG~ emh_aerie
  @263
  == ~AERIEJ~ IF ~IsValidForPartyDialog("Aerie")~ THEN @264
END
  IF ~~ THEN EXTERN ~QCUEAG~ emh_address

CHAIN IF ~False()~ THEN ~EDWINJ~ QCU_EDWIN_STRATEGY
  @265
  == ~QCUEAG~ @266
  == ~EDWINJ~ IF ~IsValidForPartyDialog("Edwin")~ THEN @267
END
  IF ~~ THEN EXTERN ~QCUEAG~ edwin_end

CHAIN IF ~False()~ THEN ~JANJ~ QCU_JAN_STORY
  @268
  == ~JANJ~ IF ~IsValidForPartyDialog("Jan")~ THEN @269
  == ~JANJ~ IF ~IsValidForPartyDialog("Jan")~ THEN @270
  == ~VALYGARJ~ IF ~IsValidForPartyDialog("Valygar")~ THEN @271
  == ~JANJ~ IF ~IsValidForPartyDialog("Jan")~ THEN @272
END
  IF ~~ THEN EXTERN ~QCUEAG~ jan_after

CHAIN IF ~False()~ THEN ~QCUEAG~ jan_solution
  @273
  == ~JANJ~ IF ~IsValidForPartyDialog("Jan")~ THEN @274
END
  IF ~~ THEN EXTERN ~QCUEAG~ jan_end

CHAIN IF ~False()~ THEN ~QCUEAG~ memory_choice
  @275
  == ~ANOMENJ~ IF ~IsValidForPartyDialog("Anomen")~ THEN @276
END
  IF ~~ THEN REPLY @277 DO ~SetGlobal("QCU_MEMACTIVE","GLOBAL",1) AddJournalEntry(@103,QUEST)~ EXIT
  IF ~~ THEN REPLY @278 EXTERN ~QCUEAG~ memory_wait

BEGIN ~QCEEMH~
IF ~Global("QCU_EMHSENT","GLOBAL",1)~ THEN BEGIN emh_here
  SAY @279
  IF ~~ THEN EXIT
END
IF ~True()~ THEN BEGIN hello
  SAY @280
  ++ @281 GOTO depart
END
IF ~False()~ THEN BEGIN depart
  SAY @282
  IF ~~ THEN EXTERN ~QCEEMH~ korgan_after
END
IF ~False()~ THEN BEGIN reunion_start
  SAY @283
  IF ~~ THEN EXTERN ~QCUEAG~ emh_welcome
END
IF ~False()~ THEN BEGIN reunion_explain
  SAY @284
  IF ~~ THEN GOTO reunion_explain2
END
IF ~False()~ THEN BEGIN reunion_explain2
  SAY @285
  IF ~~ THEN GOTO reunion_blood
END
IF ~False()~ THEN BEGIN reunion_blood
  SAY @286
  ++ @287 GOTO reunion_know
END
IF ~False()~ THEN BEGIN reunion_know
  SAY @288
  IF ~~ THEN GOTO reunion_task
END
IF ~False()~ THEN BEGIN reunion_task
  SAY @289
  IF ~~ THEN EXTERN ~QCUEAG~ emh_concern
END
IF ~False()~ THEN BEGIN reunion_magic
  SAY @290
  IF ~~ THEN DO ~SetGlobal("QCU_MEMORYPATH","GLOBAL",1) SetGlobal("QCU_REUNION","GLOBAL",2) AddJournalEntry(@102,QUEST)~ EXIT
END

CHAIN IF ~False()~ THEN ~QCEEMH~ korgan_after
  @291
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan")~ THEN @292
END
  IF ~~ THEN DO ~SetGlobal("QCU_EMHSENT","GLOBAL",1) ActionOverride("QCUEMH",EscapeArea())~ EXIT

// Edwin speaks immediately when asked, and the protagonist gets precisely one follow-up.
APPEND ~EDWINJ~
IF ~False()~ THEN BEGIN QCU_EDWIN_STUDY
  SAY @293
  ++ @294 EXTERN ~EDWINJ~ QCU_EDWIN_MEMORY
END
END

CHAIN IF ~False()~ THEN ~EDWINJ~ QCU_EDWIN_MEMORY
  @295
  == ~EDWINJ~ @296
END
  IF ~~ THEN EXTERN ~QCUEAG~ edwin_reply

// Jan speaks directly when selected. Eaglehorn's subsequent question is retained.
APPEND ~JANJ~
IF ~False()~ THEN BEGIN QCU_JAN_BEGIN
  SAY @297
  IF ~~ THEN EXTERN ~QCUEAG~ jan_interject
END
END
