// River District interiors v2.4: all new DLG states and companion labels
// compiled in one pass, never references labels from an earlier installation.

BEGIN ~QRVDEL~
IF ~Global("QRH_HANNIBAL_DEAD","GLOBAL",1) Global("QRH_DEL_VICTORY","GLOBAL",0)~ THEN BEGIN victory
  SAY @206
  IF ~~ THEN DO ~SetGlobal("QRH_DEL_MET","GLOBAL",1) SetGlobal("QRH_DEL_VICTORY","GLOBAL",1) AddExperienceParty(500)~ SOLVED_JOURNAL @104 EXIT
END
IF ~Global("QRH_DEL_VICTORY","GLOBAL",1)~ THEN BEGIN victory_repeat
  SAY @207
  IF ~~ THEN EXIT
END
IF ~Global("QRH_DEL_MET","GLOBAL",0)~ THEN BEGIN start
  SAY @208
  IF ~~ THEN REPLY @209 GOTO sent
  IF ~~ THEN REPLY @210 GOTO mistaken
  IF ~~ THEN REPLY @211 GOTO scare
END
IF ~Global("QRH_DEL_SAVED","GLOBAL",1)~ THEN BEGIN saved_repeat
  SAY @212
  IF ~~ THEN EXIT
END
IF ~Global("QRH_HANNIBAL_QUEST","GLOBAL",1)~ THEN BEGIN active_repeat
  SAY @213
  IF ~~ THEN EXIT
END
IF ~Global("QRH_DEL_MET","GLOBAL",1)~ THEN BEGIN concluded_repeat
  SAY @214
  IF ~~ THEN EXIT
END
IF ~True()~ THEN BEGIN repeat
  SAY @215
  IF ~~ THEN REPLY @216 GOTO who
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN sent
  SAY @217
  IF ~~ THEN REPLY @218 GOTO honest
  IF ~~ THEN REPLY @219 GOTO who
END
IF ~~ THEN BEGIN mistaken
  SAY @220
  IF ~~ THEN REPLY @221 GOTO honest
  IF ~~ THEN REPLY @222 GOTO who
END
IF ~~ THEN BEGIN scare
  SAY @223
  IF ~~ THEN REPLY @224 GOTO killme
  IF ~~ THEN REPLY @225 EXTERN ~QRVDEL~ QRH_JOKE_CHAIN
END
IF ~~ THEN BEGIN killme
  SAY @226
  IF ~~ THEN DO ~SetGlobal("QRH_DEL_MET","GLOBAL",1) Enemy()~ EXIT
END
IF ~~ THEN BEGIN joke
  SAY @227
  IF ~~ THEN GOTO joketail
  IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ QRHDA01
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QRHDV01
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QRHDN01
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QRHDJ01
END
IF ~~ THEN BEGIN joketail
  SAY @228
  IF ~~ THEN REPLY @229 GOTO who
  IF ~~ THEN DO ~SetGlobal("QRH_DEL_MET","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN honest
  SAY @230
  IF ~~ THEN REPLY @231 GOTO who
END
IF ~~ THEN BEGIN who
  SAY @232
  IF ~~ THEN GOTO gang
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QRHDJ02
END
IF ~~ THEN BEGIN gang
  SAY @233
  IF ~~ THEN GOTO debt
END
IF ~~ THEN BEGIN debt
  SAY @234
  IF ~~ THEN GOTO desperate
  IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QRHDM01
END
IF ~~ THEN BEGIN desperate
  SAY @235
  IF ~~ THEN GOTO askhelp
END
IF ~~ THEN BEGIN askhelp
  SAY @236
  IF ~~ THEN REPLY @237 GOTO offensive
  IF ~PartyGoldGT(599)~ THEN REPLY @238 GOTO give600
  IF ~PartyGoldLT(600)~ THEN REPLY @239 GOTO cantpay
  IF ~PartyGoldGT(1999)~ THEN REPLY @240 GOTO give2000
  IF ~~ THEN REPLY @241 GOTO refuse
END
IF ~~ THEN BEGIN cantpay
  SAY @242
  IF ~~ THEN GOTO askhelp
END
IF ~~ THEN BEGIN offensive
  SAY @243
  IF ~~ THEN GOTO compound
END
IF ~~ THEN BEGIN compound
  SAY @244
  IF ~~ THEN REPLY @245 GOTO history
END
IF ~~ THEN BEGIN history
  SAY @246
  IF ~~ THEN GOTO blessing
END
IF ~~ THEN BEGIN blessing
  SAY @247
  IF ~~ THEN DO ~SetGlobal("QRH_DEL_MET","GLOBAL",1) SetGlobal("QRH_HANNIBAL_QUEST","GLOBAL",1)~ UNSOLVED_JOURNAL @100 EXIT
END
IF ~~ THEN BEGIN give600
  SAY @248
  IF ~~ THEN DO ~TakePartyGold(600) ReputationInc(1) AddexperienceParty(5000) SetGlobal("QRH_DEL_MET","GLOBAL",1) SetGlobal("QRH_DEL_SAVED","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN give2000
  SAY @249
  IF ~~ THEN GOTO final2000
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ QRHDK01
END
IF ~~ THEN BEGIN final2000
  SAY @250
  IF ~~ THEN DO ~TakePartyGold(2000) ReputationInc(3) AddexperienceParty(9000) SetGlobal("QRH_DEL_MET","GLOBAL",1) SetGlobal("QRH_DEL_SAVED","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN refuse
  SAY @251
  IF ~~ THEN DO ~SetGlobal("QRH_DEL_MET","GLOBAL",1)~ EXIT
END

BEGIN ~QRVXZO~
IF ~True()~ THEN BEGIN start
  SAY @252
  IF ~~ THEN EXTERN ~QRVNAT~ fear
END
IF ~~ THEN BEGIN kill
  SAY @253
  IF ~~ THEN EXTERN ~QRVNAT~ morality
END
IF ~~ THEN BEGIN brother
  SAY @254
  IF ~~ THEN EXTERN ~QRVNAT~ guild
END
IF ~~ THEN BEGIN attack
  SAY @255
  IF ~~ THEN DO ~SetGlobal("QRH_XZOR_FIGHT","GLOBAL",1)~ EXIT
END
BEGIN ~QRVNAT~
IF ~~ THEN BEGIN fear
  SAY @256
  IF ~~ THEN EXTERN ~QRVXZO~ kill
END
IF ~~ THEN BEGIN morality
  SAY @257
  IF ~~ THEN EXTERN ~QRVXZO~ brother
END
IF ~~ THEN BEGIN guild
  SAY @258
  IF ~~ THEN EXTERN ~QRVXZO~ attack
END

BEGIN ~QRVHAL~
IF ~True()~ THEN BEGIN start
  SAY @259
  IF ~~ THEN GOTO response
  IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ QRHAA01
END
IF ~~ THEN BEGIN response
  SAY @260
  IF ~IsValidForPartyDialog("Aerie")~ THEN REPLY @261 GOTO mother
  IF ~~ THEN REPLY @262 GOTO nothing
  IF ~~ THEN REPLY @263 GOTO sorry
END
IF ~~ THEN BEGIN mother
  SAY @264
  IF ~~ THEN EXIT
  IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ QRHAA02
END
IF ~~ THEN BEGIN nothing
  SAY @265
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN sorry
  SAY @266
  IF ~~ THEN EXIT
END

BEGIN ~QRVTHYL~
IF ~!StateCheck(Myself,STATE_STONE_DEATH) Global("QRH_THYL_SAVED","GLOBAL",0)~ THEN BEGIN start
  SAY @267
  IF ~~ THEN GOTO response
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QRHTV01
END
IF ~True()~ THEN BEGIN repeat
  SAY @268
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN response
  SAY @269
  IF ~~ THEN REPLY @270 GOTO remembering
  IF ~~ THEN REPLY @271 GOTO demand
END
IF ~~ THEN BEGIN remembering
  SAY @272
  IF ~~ THEN GOTO gift
END
IF ~~ THEN BEGIN gift
  SAY @273
  IF ~~ THEN DO ~SetGlobal("QRH_THYL_SAVED","GLOBAL",1) AddexperienceParty(600) GiveItemCreate("QRVMAG",Player1,1,0,0)~ EXIT
END
IF ~~ THEN BEGIN demand
  SAY @274
  IF ~~ THEN DO ~SetGlobal("QRH_THYL_SAVED","GLOBAL",1) AddexperienceParty(600) GiveItemCreate("QRVMAG",Player1,1,0,0)~ EXIT
END

BEGIN ~QRVLAR~
IF ~Global("QRH_LAR_REFUSED","GLOBAL",1)~ THEN BEGIN refused_repeat
  SAY @275
  IF ~~ THEN EXIT
END
IF ~Global("QRH_LAR_DONE","GLOBAL",1)~ THEN BEGIN completed_repeat
  SAY @276
  IF ~~ THEN EXIT
END
IF ~Global("QRH_LAR_ACCEPTED","GLOBAL",1)~ THEN BEGIN accepted_repeat
  SAY @277
  IF ~PartyHasItem("QBLP01") PartyHasItem("QBLP02")~ THEN REPLY @278 GOTO potion_handover
  IF ~~ THEN REPLY @279 GOTO potion_not_yet
END
IF ~~ THEN BEGIN potion_not_yet
  SAY @280
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN potion_handover
  SAY @281
  IF ~~ THEN DO ~TakePartyItem("QBLP01") TakePartyItem("QBLP02") DestroyItem("QBLP01") DestroyItem("QBLP02") SetGlobal("QRH_LAR_DONE","GLOBAL",1) GiveGoldForce(200) GiveItemCreate("QRAMSHD",Player1,1,0,0) AddExperienceParty(400)~ SOLVED_JOURNAL @102 EXIT
END
IF ~True()~ THEN BEGIN start
  SAY @282
  IF ~~ THEN REPLY @283 GOTO grief
  IF ~~ THEN REPLY @284 GOTO robbed
  IF ~~ THEN REPLY @285 EXIT
END
IF ~~ THEN BEGIN grief
  SAY @286
  IF ~~ THEN GOTO handsome
END
IF ~~ THEN BEGIN handsome
  SAY @287
  IF ~~ THEN GOTO choices
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QRHLJ01
END
IF ~~ THEN BEGIN choices
  SAY @288
  IF ~~ THEN REPLY @289 GOTO potion
  IF ~~ THEN REPLY @290 GOTO worthy
  IF ~~ THEN REPLY @291 GOTO terrible
END
IF ~~ THEN BEGIN worthy
  SAY @292
  IF ~~ THEN GOTO potion
END
IF ~~ THEN BEGIN potion
  SAY @293
  IF ~~ THEN GOTO gems
END
IF ~~ THEN BEGIN gems
  SAY @294
  IF ~~ THEN GOTO decision
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QRHLJ02
END
IF ~~ THEN BEGIN decision
  SAY @295
  IF ~~ THEN REPLY @296 GOTO accept
  IF ~~ THEN REPLY @297 GOTO decline
END
IF ~~ THEN BEGIN terrible
  SAY @298
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN accept
  SAY @299
  IF ~~ THEN DO ~GiveGoldForce(120) SetGlobal("QRH_LAR_ACCEPTED","GLOBAL",1)~ UNSOLVED_JOURNAL @101 EXIT
END
IF ~~ THEN BEGIN decline
  SAY @300
  IF ~~ THEN DO ~SetGlobal("QRH_LAR_REFUSED","GLOBAL",1)~ EXIT
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QRHLJ03
END
IF ~~ THEN BEGIN declined_done
  SAY @301
  IF ~~ THEN DO ~SetGlobal("QRH_LAR_REFUSED","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN robbed
  SAY @302
  IF ~~ THEN DO ~SetGlobal("QRH_LAR_GONE","GLOBAL",1) EscapeArea()~ EXIT
END

BEGIN ~QRVBAL~
IF ~True()~ THEN BEGIN start
  SAY @303
  IF ~~ THEN REPLY @304 DO ~StartStore("SHOP06",LastTalkedToBy())~ EXIT
  IF ~~ THEN REPLY @305 GOTO conditions
  IF ~~ THEN REPLY @306 EXIT
END
IF ~~ THEN BEGIN conditions
  SAY @307
  IF ~~ THEN GOTO start
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN IF_FILE_EXISTS ~YOSHJ~ QRHBY01
END

// Companion returns: all reference locally declared dialogue states above.
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN QRHDJ01
  SAY @308
  IF ~~ THEN EXTERN ~QRVDEL~ joketail
END
IF ~~ THEN BEGIN QRHDJ02
  SAY @309
  IF ~~ THEN EXTERN ~QRVDEL~ gang
END
IF ~~ THEN BEGIN QRHLJ01
  SAY @310
  IF ~~ THEN EXTERN ~QRVLAR~ choices
END
IF ~~ THEN BEGIN QRHLJ02
  SAY @311
  IF ~~ THEN EXTERN ~QRVLAR~ decision
END
IF ~~ THEN BEGIN QRHLJ03
  SAY @312
  IF ~~ THEN EXTERN ~QRVLAR~ declined_done
END
END
APPEND ~NALIAJ~
IF ~~ THEN BEGIN QRHDN01
  SAY @313
  IF ~~ THEN EXTERN ~QRVDEL~ joketail
END
END
APPEND ~VICONIJ~
IF ~~ THEN BEGIN QRHDV01
  SAY @314
  IF ~~ THEN EXTERN ~QRVDEL~ joketail
END
IF ~~ THEN BEGIN QRHTV01
  SAY @315
  IF ~~ THEN EXTERN ~QRVTHYL~ response
END
END
APPEND ~AERIEJ~
IF ~~ THEN BEGIN QRHDA01
  SAY @316
  IF ~~ THEN EXTERN ~QRVDEL~ joketail
END
IF ~~ THEN BEGIN QRHAA01
  SAY @317
  IF ~~ THEN EXTERN ~QRVHAL~ response
END
IF ~~ THEN BEGIN QRHAA02
  SAY @318
  IF ~~ THEN EXIT
END
END
APPEND ~MAZZYJ~
IF ~~ THEN BEGIN QRHDM01
  SAY @319
  IF ~~ THEN EXTERN ~QRVDEL~ desperate
END
END
APPEND ~KELDORJ~
IF ~~ THEN BEGIN QRHDK01
  SAY @320
  IF ~~ THEN EXTERN ~QRVDEL~ final2000
END
END
APPEND IF_FILE_EXISTS ~YOSHJ~
IF ~~ THEN BEGIN QRHBY01
  SAY @321
  IF ~~ THEN EXTERN ~QRVBAL~ start
END
END


// The original v2.7 joke transition selected only the highest-priority companion.
// CHAIN conditionals let every eligible companion speak in order, without repeating
// Delgado's line between interjections.
CHAIN ~QRVDEL~ QRH_JOKE_CHAIN
  @322
  == ~JAHEIRAJ~ IF ~InParty("Jaheira")~ THEN
    @323
  == ~NALIAJ~ IF ~InParty("Nalia")~ THEN
    @324
  == ~VICONIJ~ IF ~InParty("Viconia")~ THEN
    @325
  == ~AERIEJ~ IF ~InParty("Aerie")~ THEN
    @326
  == ~QRVDEL~
    @327
END
  IF ~~ THEN REPLY @328 EXTERN ~QRVDEL~ who
  IF ~~ THEN DO ~SetGlobal("QRH_DEL_MET","GLOBAL",1)~ EXIT
