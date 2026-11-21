// ---------------------------------------------------------------------------
// RANDALLA BRASSHORN - Purple Wyrm Inn
// Uses MOOK as the visual basis. Jaheira/Khalid exchanges are routed through
// their existing dialogue files with unique appended states.
// ---------------------------------------------------------------------------

BEGIN PWYRAND

// ---------------------------------------------------------------------------
// TORM'S HAND - QUEST COMPLETION
// ---------------------------------------------------------------------------

// IMPORTANT: the completion state must have the same quest-completion guards
// as the entry state.  Otherwise WeiDU can make it a valid top-level state
// from the very first conversation and Randalla will act as if the quest is
// already finished.
IF ~Global("PWY_RANDALLA_ACCEPTED","GLOBAL",1) Global("TCR_ALMA_DEAD","GLOBAL",1) Global("PWY_TORM_REWARD_FIXED","GLOBAL",0)~ THEN BEGIN 300
  SAY @9022
  IF ~~ THEN REPLY @9023 GOTO 301
END

IF ~Global("PWY_RANDALLA_ACCEPTED","GLOBAL",1) Global("TCR_ALMA_DEAD","GLOBAL",1) Global("PWY_TORM_REWARD_FIXED","GLOBAL",0) !Global("PWY_TORM_REWARDED","GLOBAL",1)~ THEN BEGIN 301
  SAY @9024
  IF ~~ THEN DO ~SetGlobal("PWY_TORM_REWARD_FIXED","GLOBAL",1) SetGlobal("PWY_TORM_REWARDED","GLOBAL",1) SetGlobal("PWY_TORM_BOW_FIXED","GLOBAL",1) SetGlobal("PWY_TORM_BOW_STAGE22_DONE","GLOBAL",1) AddExperienceParty(4000) GiveGoldForce(2000) GiveItemCreate("BOWSIL4",Player1,1,0,0) AddJournalEntry(@9021,QUEST_DONE)~ EXIT
END

// Compatibility path for an older save in which the quest was already marked
// rewarded but the final reward state itself was not fixed yet.  This remains
// locked behind the actual quest-completion guards.
IF ~Global("PWY_RANDALLA_ACCEPTED","GLOBAL",1) Global("TCR_ALMA_DEAD","GLOBAL",1) Global("PWY_TORM_REWARD_FIXED","GLOBAL",0) Global("PWY_TORM_REWARDED","GLOBAL",1)~ THEN BEGIN 302
  SAY @9025
  IF ~~ THEN DO ~SetGlobal("PWY_TORM_REWARD_FIXED","GLOBAL",1) SetGlobal("PWY_TORM_BOW_FIXED","GLOBAL",1) SetGlobal("PWY_TORM_BOW_STAGE22_DONE","GLOBAL",1) GiveGoldForce(2000) GiveItemCreate("BOWSIL4",Player1,1,0,0) AddJournalEntry(@9021,QUEST_DONE)~ EXIT
END

// Stage 22 compatibility repair.  Existing saves may contain BOWSILEN,
// BOWSIL2, or BOWSIL3 from earlier test stages.  Replace any of those legacy
// copies with the new BOWSIL4 item.  No XP or extra gold is awarded.
IF ~Global("PWY_RANDALLA_ACCEPTED","GLOBAL",1) Global("TCR_ALMA_DEAD","GLOBAL",1) Global("PWY_TORM_REWARD_FIXED","GLOBAL",1) Global("PWY_TORM_BOW_STAGE22_DONE","GLOBAL",0) OR(3) PartyHasItem("BOWSILEN") PartyHasItem("BOWSIL2") PartyHasItem("BOWSIL3")~ THEN BEGIN 303
  SAY @9026
  IF ~~ THEN DO ~TakePartyItem("BOWSILEN") DestroyItem("BOWSILEN") TakePartyItem("BOWSIL2") DestroyItem("BOWSIL2") TakePartyItem("BOWSIL3") DestroyItem("BOWSIL3") GiveItemCreate("BOWSIL4",Player1,1,0,0) SetGlobal("PWY_TORM_BOW_FIXED","GLOBAL",1) SetGlobal("PWY_TORM_BOW_STAGE22_DONE","GLOBAL",1) AddJournalEntry(@9021,QUEST_DONE)~ EXIT
END

// After the reward and any legacy bow repair, offer only the completed greeting.
IF ~Global("PWY_TORM_REWARD_FIXED","GLOBAL",1) Global("PWY_TORM_BOW_STAGE22_DONE","GLOBAL",1)~ THEN BEGIN 304
  SAY @9027
  IF ~~ THEN EXIT
END

// ---------------------------------------------------------------------------
// POST-ACCEPTANCE FOLLOW-UP
// ---------------------------------------------------------------------------

IF ~Global("PWY_RANDALLA_ACCEPTED","GLOBAL",1)~ THEN BEGIN 200
  SAY @9028
  IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN REPLY @9029 GOTO 201
  IF ~~ THEN REPLY @9030 GOTO 207
END

IF ~~ THEN BEGIN 201
  SAY @9031
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_FOLLOW1
END

IF ~~ THEN BEGIN 202
  SAY @9032
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_FOLLOW2
END

IF ~~ THEN BEGIN 203
  SAY @9033
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_FOLLOW3
END

IF ~~ THEN BEGIN 204
  SAY @9034
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_FOLLOW4
END

IF ~~ THEN BEGIN 205
  SAY @9035
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_FOLLOW5
END

IF ~~ THEN BEGIN 206
  SAY @9036
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 207
  SAY @9037
  // Repair a previously accepted quest on saved BP-BGT Worldmaps.
  IF ~~ THEN DO ~RevealAreaOnMap("TORMHA") AddWorldmapAreaFlag("TORMHA",VISIBLE) AddWorldmapAreaFlag("TORMHA",ENABLED) AddWorldmapAreaFlag("TORMHA",EXPLORABLE)~ EXIT
END

// ---------------------------------------------------------------------------
// JAHEIRA PRESENT - INITIAL MEETING
// ---------------------------------------------------------------------------

// Use the same direct, mutually-exclusive entry states as the working Ulua
// dialogue: one valid state when Jaheira is present and one when she is absent.
// The accepted-quest state above takes priority once the mission is accepted.
IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID) Global("PWY_RANDALLA_ACCEPTED","GLOBAL",0)~ THEN BEGIN 0
  SAY @9038
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_INTRO1
END

IF ~!InParty("Jaheira") Global("PWY_RANDALLA_ACCEPTED","GLOBAL",0)~ THEN BEGIN 1
  SAY @9039
  IF ~~ THEN REPLY @9040 GOTO 4
  IF ~~ THEN REPLY @9041 EXIT
END

IF ~~ THEN BEGIN 101
  SAY @9042
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_INTRO2
END

IF ~~ THEN BEGIN 102
  SAY @9043
  IF ~~ THEN REPLY @9044 GOTO 12
  IF ~~ THEN REPLY @9045 GOTO 13
  IF ~~ THEN REPLY @9046 GOTO 14
END

IF ~~ THEN BEGIN 103
  SAY @9047
  IF ~~ THEN EXTERN KHALIJ PWY_RAND_KH_INTRO
END

// This is also the continuation after Khalid's and Jaheira's introductions.
IF ~~ THEN BEGIN 104
  SAY @9048
  IF ~~ THEN REPLY @9049 GOTO 12
  IF ~~ THEN REPLY @9050 GOTO 13
  IF ~~ THEN REPLY @9051 GOTO 14
END

// ---------------------------------------------------------------------------
// NO JAHEIRA - INITIAL MEETING
// ---------------------------------------------------------------------------

IF ~~ THEN BEGIN 4
  SAY @9052
  IF ~~ THEN REPLY @9053 GOTO 2
  IF ~~ THEN REPLY @9054 GOTO 3
END

IF ~~ THEN BEGIN 2
  SAY @9055
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 3
  SAY @9056
  IF ~~ THEN GOTO 10
END

IF ~~ THEN BEGIN 10
  SAY @9057
  IF ~~ THEN REPLY @9058 GOTO 11
  IF ~~ THEN REPLY @9059 GOTO 12
  IF ~~ THEN REPLY @9060 GOTO 13
  IF ~~ THEN REPLY @9061 GOTO 14
END

IF ~~ THEN BEGIN 11
  SAY @9062
  IF ~~ THEN GOTO 15
END

IF ~~ THEN BEGIN 12
  SAY @9063
  IF ~~ THEN REPLY @9064 GOTO 13
  IF ~~ THEN REPLY @9065 GOTO 13
END

IF ~~ THEN BEGIN 13
  SAY @9066
  IF ~~ THEN GOTO 16
END

IF ~~ THEN BEGIN 14
  SAY @9067
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 15
  SAY @9068
  IF ~~ THEN REPLY @9069 GOTO 12
  IF ~~ THEN REPLY @9070 GOTO 13
  IF ~~ THEN REPLY @9071 GOTO 14
END

IF ~~ THEN BEGIN 16
  SAY @9072
  IF ~~ THEN GOTO 17
END

IF ~~ THEN BEGIN 17
  SAY @9073
  IF ~~ THEN GOTO 18
END

IF ~~ THEN BEGIN 18
  SAY @9074
  IF ~~ THEN DO ~SetGlobal("PWY_RANDALLA_ACCEPTED","GLOBAL",1) RevealAreaOnMap("TORMHA") AddWorldmapAreaFlag("TORMHA",VISIBLE) AddWorldmapAreaFlag("TORMHA",ENABLED) AddWorldmapAreaFlag("TORMHA",EXPLORABLE) AddJournalEntry(@9020,QUEST)~ EXIT
END

// ---------------------------------------------------------------------------
// Appended states for Jaheira and Khalid. These are only reached from the
// Randalla dialogue above, so they do not alter their normal conversations.
// ---------------------------------------------------------------------------

APPEND JAHEIJ
IF ~~ THEN BEGIN PWY_RAND_JH_INTRO1
  SAY @9075
  IF ~~ THEN EXTERN PWYRAND 101
END

IF ~~ THEN BEGIN PWY_RAND_JH_INTRO2
  SAY @9076
  IF ~InParty("Khalid")~ THEN EXTERN PWYRAND 103
  IF ~~ THEN EXTERN PWYRAND 102
END

IF ~~ THEN BEGIN PWY_RAND_JH_KHALID_REPLY
  SAY @9077
  IF ~~ THEN EXTERN PWYRAND 104
END

IF ~~ THEN BEGIN PWY_RAND_JH_FOLLOW1
  SAY @9078
  IF ~~ THEN EXTERN PWYRAND 202
END

IF ~~ THEN BEGIN PWY_RAND_JH_FOLLOW2
  SAY @9079
  IF ~~ THEN EXTERN PWYRAND 203
END

IF ~~ THEN BEGIN PWY_RAND_JH_FOLLOW3
  SAY @9080
  IF ~~ THEN EXTERN PWYRAND 204
END

IF ~~ THEN BEGIN PWY_RAND_JH_FOLLOW4
  SAY @9081
  IF ~~ THEN EXTERN PWYRAND 205
END

IF ~~ THEN BEGIN PWY_RAND_JH_FOLLOW5
  SAY @9082
  IF ~~ THEN EXTERN PWYRAND 206
END
END

APPEND KHALIJ
IF ~~ THEN BEGIN PWY_RAND_KH_INTRO
  SAY @9083
  IF ~~ THEN EXTERN JAHEIJ PWY_RAND_JH_KHALID_REPLY
END
END
