// QC Beggar's Plea in Brynnlaw: independent scripted encounter.
BEGIN ~QCBPSHAL~
IF ~Global("QCBP_CURE_RESPONSE","GLOBAL",1) Global("QCBP_CURED","GLOBAL",1) Global("QCBP_GHDEAD","GLOBAL",1)~ THEN BEGIN cured_late
  SAY @104
  IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0)~ EXTERN ~AERIEJ~ QCBP_ACELEB
  IF ~!IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Edwin")~ THEN DO ~SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0)~ EXTERN ~EDWINJ~ QCBP_EWEARY
  IF ~!IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Edwin")~ THEN DO ~SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0)~ GOTO final_thank
END

IF ~Global("QCBP_CURE_RESPONSE","GLOBAL",1) Global("QCBP_CURED","GLOBAL",1) Global("QCBP_GHDEAD","GLOBAL",0)~ THEN BEGIN cured_early
  SAY @105
  IF ~True()~ THEN REPLY @106 DO ~SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0)~ GOTO night_seen
  IF ~True()~ THEN REPLY @107 DO ~SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0)~ GOTO cured_early_end
END

IF ~Global("QCBP_HEAL_RESPONSE","GLOBAL",1)~ THEN BEGIN generic_healed
  SAY @108
  IF ~IsValidForPartyDialog("Viconia")~ THEN DO ~SetGlobal("QCBP_HEAL_READY","GLOBAL",0) SetGlobal("QCBP_WAIT_SPELL","GLOBAL",0) SetGlobal("QCBP_HEAL_RESPONSE","GLOBAL",0)~ EXTERN ~VICONIJ~ QCBP_VPOTION
  IF ~!IsValidForPartyDialog("Viconia")~ THEN DO ~SetGlobal("QCBP_HEAL_READY","GLOBAL",0) SetGlobal("QCBP_WAIT_SPELL","GLOBAL",0) SetGlobal("QCBP_HEAL_RESPONSE","GLOBAL",0)~ GOTO after_heal_note
END

IF ~Global("QCBP_DONE","GLOBAL",1)~ THEN BEGIN done
 SAY @109
 IF ~~ THEN EXIT
END

IF ~Global("QCBP_DONE","GLOBAL",2)~ THEN BEGIN abandoned
 SAY @110
 IF ~~ THEN EXIT
END

IF ~Global("QCBP_GHDEAD","GLOBAL",1) Global("QCBP_CURED","GLOBAL",0) Global("QCBP_CONFIRMED","GLOBAL",1)~ THEN BEGIN waiting_cure
  SAY @111
  IF ~PartyHasItem("RESTORE")~ THEN REPLY @112 GOTO try_scroll
  IF ~OR(2) PartyHasItem("SCRL5G") PartyHasItem("SCRLAK")~ THEN REPLY @113 GOTO try_scroll
  IF ~~ THEN REPLY @114 GOTO hurry
END

IF ~Global("QCBP_GHDEAD","GLOBAL",1) Global("QCBP_CURED","GLOBAL",0) Global("QCBP_CONFIRMED","GLOBAL",0)~ THEN BEGIN dead_check
  SAY @115
  IF ~~ THEN REPLY @116 GOTO dead_reveal
  IF ~~ THEN REPLY @117 GOTO still_working
END

IF ~Global("QCBP_GHDEAD","GLOBAL",1) Global("QCBP_CURED","GLOBAL",1) Global("QCBP_DONE","GLOBAL",0)~ THEN BEGIN pre_cured_end
 SAY @118
 IF ~~ THEN REPLY @119 GOTO final_early
 IF ~~ THEN REPLY @120 GOTO still_working
END

IF ~Global("QCBP_CURED","GLOBAL",1) Global("QCBP_DONE","GLOBAL",0)~ THEN BEGIN cured_wait
 SAY @121
 IF ~~ THEN EXIT
END

IF ~Global("QCBP_STAGE","GLOBAL",2)~ THEN BEGIN waiting_hunt
 SAY @122
 IF ~~ THEN REPLY @123 EXIT
 IF ~~ THEN REPLY @124 GOTO night_seen
END

IF ~Global("QCBP_WAIT_SPELL","GLOBAL",1)~ THEN BEGIN spell_promised
 SAY @125
 IF ~PartyHasItem("POTN52")~ THEN REPLY @126 GOTO potion
 IF ~~ THEN REPLY @127 DO ~SetGlobal("QCBP_HEAL_READY","GLOBAL",1)~ EXIT
END

IF ~Global("QCBP_STAGE","GLOBAL",1)~ THEN BEGIN donation_followup
 SAY @128
 IF ~~ THEN REPLY @129 GOTO bitten
 IF ~~ THEN REPLY @130 GOTO healing
 IF ~~ THEN REPLY @131 EXIT
END

IF ~True()~ THEN BEGIN intro
 SAY @132
 IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KINTRO
 IF ~!IsValidForPartyDialog("Korgan")~ THEN GOTO request_gold
END

IF ~~ THEN BEGIN request_gold
  SAY @133
  IF ~PartyGoldGT(49)~ THEN REPLY @134 DO ~TakePartyGold(50) SetGlobal("QCBP_STAGE","GLOBAL",1)~ GOTO give50
  IF ~IsValidForPartyDialog("Nalia")~ THEN REPLY @135 EXTERN ~NALIAJ~ QCBP_NWHY
  IF ~True()~ THEN REPLY @136 GOTO walkaway
END

IF ~~ THEN BEGIN walkaway
  SAY @137
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN give50
  SAY @138
  IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ QCBP_CWOUND
  IF ~!IsValidForPartyDialog("Cernd") IsValidForPartyDialog("Rasaad")~ THEN EXTERN ~RASAADJ~ QCBP_RWOUND
  IF ~!IsValidForPartyDialog("Cernd") !IsValidForPartyDialog("Rasaad")~ THEN GOTO donation_thanks
END

IF ~~ THEN BEGIN donation_thanks
  SAY @139
  IF ~True()~ THEN REPLY @140 GOTO bitten
  IF ~True()~ THEN REPLY @141 GOTO healing
  IF ~True()~ THEN REPLY @142 GOTO donation_exit
END

IF ~~ THEN BEGIN donation_exit
  SAY @143
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN bite_choices
  SAY @144
  IF ~True()~ THEN REPLY @145 GOTO bitten
  IF ~True()~ THEN REPLY @146 GOTO healing
  IF ~True()~ THEN REPLY @147 GOTO leave_end
END

IF ~~ THEN BEGIN leave_end
 SAY @148
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN bitten
  SAY @149
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QCBP_JWOUND
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN GOTO evade
END

IF ~~ THEN BEGIN evade
  SAY @150
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ QCBP_KELWOUND
  IF ~!IsValidForPartyDialog("Keldorn")~ THEN GOTO last_warning
END

IF ~~ THEN BEGIN last_warning
  SAY @151
  IF ~True()~ THEN REPLY @152 GOTO admit
  IF ~True()~ THEN REPLY @153 GOTO refuse_help
END

IF ~~ THEN BEGIN admit
  SAY @154
  IF ~True()~ THEN REPLY @155 GOTO history
END

IF ~~ THEN BEGIN history
  SAY @156
  IF ~True()~ THEN GOTO night_attack
END

IF ~~ THEN BEGIN night_attack
  SAY @157
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QCBP_NQUESTION
  IF ~!IsValidForPartyDialog("Nalia")~ THEN GOTO appearance
END

IF ~~ THEN BEGIN appearance
  SAY @158
  IF ~IsValidForPartyDialog("Dorn")~ THEN EXTERN ~DORNJ~ QCBP_DSCORN
  IF ~!IsValidForPartyDialog("Dorn")~ THEN GOTO appearance_insist
END

IF ~~ THEN BEGIN appearance_insist
  SAY @159
  IF ~True()~ THEN REPLY @160 GOTO night_seen
  IF ~True()~ THEN REPLY @161 GOTO refuse_help
END

IF ~~ THEN BEGIN refuse_help
  SAY @162
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QCBP_NAPPEAL
  IF ~!IsValidForPartyDialog("Nalia")~ THEN GOTO leave_end
END

IF ~~ THEN BEGIN night_seen
  SAY @163
  IF ~True()~ THEN GOTO night_offer
END

IF ~~ THEN BEGIN night_offer
  SAY @164
  IF ~True()~ THEN GOTO quest_start
END

IF ~~ THEN BEGIN quest_start
  SAY @165
  IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("QCBP_STAGE","GLOBAL",2)~ EXTERN ~KELDORJ~ QCBP_KINFECT
  IF ~!IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Hexxat")~ THEN DO ~SetGlobal("QCBP_STAGE","GLOBAL",2)~ EXTERN ~HEXXATJ~ QCBP_HSICK
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Hexxat") IsValidForPartyDialog("Nalia")~ THEN DO ~SetGlobal("QCBP_STAGE","GLOBAL",2)~ EXTERN ~NALIAJ~ QCBP_NPROMISE
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Hexxat") !IsValidForPartyDialog("Nalia")~ THEN DO ~SetGlobal("QCBP_STAGE","GLOBAL",2)~ GOTO quest_start_end
END

IF ~~ THEN BEGIN quest_start_end
 SAY @166
 IF ~~ THEN UNSOLVED_JOURNAL @100 EXIT
END

IF ~~ THEN BEGIN healing
  SAY @167
  IF ~PartyHasItem("POTN52")~ THEN REPLY @168 GOTO potion
  IF ~True()~ THEN REPLY @169 GOTO offer_spell
  IF ~True()~ THEN REPLY @170 GOTO leave_end
END

IF ~~ THEN BEGIN potion
  SAY @171
  IF ~IsValidForPartyDialog("Viconia")~ THEN DO ~TakePartyItem("POTN52") DestroyItem("POTN52") SetGlobal("QCBP_STAGE","GLOBAL",1)~ EXTERN ~VICONIJ~ QCBP_VPOTION
  IF ~!IsValidForPartyDialog("Viconia")~ THEN DO ~TakePartyItem("POTN52") DestroyItem("POTN52") SetGlobal("QCBP_STAGE","GLOBAL",1)~ GOTO after_heal_note
END

IF ~~ THEN BEGIN offer_spell
  SAY @172
  IF ~True()~ THEN DO ~SetGlobal("QCBP_WAIT_SPELL","GLOBAL",1) SetGlobal("QCBP_HEAL_READY","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",1)~ GOTO offer_spell_end
END

IF ~~ THEN BEGIN offer_spell_end
 SAY @173
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN after_heal_note
  SAY @174
  IF ~IsValidForPartyDialog("Dorn")~ THEN EXTERN ~DORNJ~ QCBP_DNOHELP
  IF ~!IsValidForPartyDialog("Dorn")~ THEN GOTO thanks_help
END

IF ~~ THEN BEGIN thanks_help
  SAY @175
  IF ~True()~ THEN REPLY @176 GOTO bitten
END



IF ~~ THEN BEGIN cured_early_end
 SAY @177
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN dead_reveal
  SAY @178
  IF ~IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("QCBP_CONFIRMED","GLOBAL",1)~ EXTERN ~JAHEIRAJ~ QCBP_JCURE
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("QCBP_CONFIRMED","GLOBAL",1)~ GOTO dead_please
END

IF ~~ THEN BEGIN dead_please
  SAY @179
  IF ~True()~ THEN REPLY @180 GOTO ask_temple
  IF ~IsValidForPartyDialog("Viconia")~ THEN REPLY @181 EXTERN ~VICONIJ~ QCBP_VCURE
  IF ~IsValidForPartyDialog("Jaheira")~ THEN REPLY @182 EXTERN ~JAHEIRAJ~ QCBP_JCURE2
  IF ~IsValidForPartyDialog("Cernd")~ THEN REPLY @183 EXTERN ~CERNDJ~ QCBP_CCURE
  IF ~IsValidForPartyDialog("Aerie")~ THEN REPLY @184 EXTERN ~AERIEJ~ QCBP_ACURE
  IF ~IsValidForPartyDialog("Anomen")~ THEN REPLY @185 EXTERN ~ANOMENJ~ QCBP_ANCURE
  IF ~True()~ THEN REPLY @186 GOTO abandon_cure
END

IF ~~ THEN BEGIN ask_temple
  SAY @187
  IF ~True()~ THEN GOTO ask_temple_end
END

IF ~~ THEN BEGIN ask_temple_end
 SAY @188
 IF ~~ THEN UNSOLVED_JOURNAL @101 EXIT
END

IF ~~ THEN BEGIN try_scroll
  SAY @189
  IF ~True()~ THEN DO ~SetGlobal("QCBP_WAIT_SPELL","GLOBAL",1)~ GOTO try_scroll_end
END

IF ~~ THEN BEGIN try_scroll_end
 SAY @190
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN hurry
 SAY @191
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN still_working
 SAY @192
 IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN abandon_cure
 SAY @193
  IF ~IsValidForPartyDialog("Nalia")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",2) SetGlobal("QCBP_STAGE","GLOBAL",4)~ EXTERN ~NALIAJ~ QCBP_NLEAVE
  IF ~!IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",2) SetGlobal("QCBP_STAGE","GLOBAL",4)~ EXTERN ~KELDORJ~ QCBP_KELLEAVE
  IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",2) SetGlobal("QCBP_STAGE","GLOBAL",4)~ EXTERN ~AERIEJ~ QCBP_ASAD
  IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",2) SetGlobal("QCBP_STAGE","GLOBAL",4)~ EXTERN ~MAZZYJ~ QCBP_MWARN
  IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",2) SetGlobal("QCBP_STAGE","GLOBAL",4)~ GOTO abandon_final
END

IF ~~ THEN BEGIN abandon_final
 SAY @194
 IF ~~ THEN DO ~ReputationInc(-3) EscapeAreaDestroy(0)~ SOLVED_JOURNAL @103 EXIT
END


IF ~~ THEN BEGIN final_thank
 SAY @195
  IF ~IsValidForPartyDialog("Dorn")~ THEN EXTERN ~DORNJ~ QCBP_DREWARD
  IF ~!IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ QCBP_KELREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCBP_VREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

IF ~~ THEN BEGIN final_early
 SAY @196
  IF ~IsValidForPartyDialog("Dorn")~ THEN EXTERN ~DORNJ~ QCBP_DREWARD_EARLY
  IF ~!IsValidForPartyDialog("Dorn") IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ QCBP_KELREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCBP_VREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Dorn") !IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END


BEGIN ~QCBPGHOL~
IF ~Global("QCBP_FIGHT","GLOBAL",0)~ THEN BEGIN first
 SAY @197
 IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ QCBP_KGHINTRO
 IF ~!IsValidForPartyDialog("Keldorn")~ THEN GOTO gh_threat
END

IF ~~ THEN BEGIN gh_threat
 SAY @198
 IF ~~ THEN REPLY @199 GOTO gh_taunt
 IF ~~ THEN REPLY @200 GOTO gh_goal
END

IF ~~ THEN BEGIN gh_taunt
 SAY @201
 IF ~~ THEN DO ~SetGlobal("QCBP_FIGHT","GLOBAL",1) CreateCreature("QCBPLACD",[438.2136],0) CreateCreature("QCBPLACD",[508.909],0) CreateCreature("QCBPLACD",[634.2098],0) CreateCreature("QCBPLACD",[698.2105],0) CreateCreature("QCBPLACD",[670.2208],0) CreateCreature("QCBPLACD",[575.2260],0) CreateCreature("QCBPLACD",[516.2315],0) Enemy()~ EXIT
END

IF ~~ THEN BEGIN gh_goal
 SAY @202
 IF ~~ THEN DO ~SetGlobal("QCBP_FIGHT","GLOBAL",1) CreateCreature("QCBPLACD",[438.2136],0) CreateCreature("QCBPLACD",[508.909],0) CreateCreature("QCBPLACD",[634.2098],0) CreateCreature("QCBPLACD",[698.2105],0) CreateCreature("QCBPLACD",[670.2208],0) CreateCreature("QCBPLACD",[575.2260],0) CreateCreature("QCBPLACD",[516.2315],0) Enemy()~ EXIT
END

APPEND ~KORGANJ~
IF ~~ THEN BEGIN QCBP_KINTRO
 SAY @203
 IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QCBP_NREBUKE
 IF ~!IsValidForPartyDialog("Nalia")~ THEN EXTERN ~QCBPSHAL~ request_gold
END

IF ~~ THEN BEGIN QCBP_KREPLY
 SAY @204
 IF ~True()~ THEN EXTERN ~NALIAJ~ QCBP_NREPLY
END

IF ~~ THEN BEGIN QCBP_KSARCASM
 SAY @205
 IF ~True()~ THEN EXTERN ~NALIAJ~ QCBP_NSILENCE
END

IF ~~ THEN BEGIN QCBP_KREWARD
 SAY @206
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QCBP_NREWARD1
  IF ~!IsValidForPartyDialog("Nalia") IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Nalia") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

IF ~~ THEN BEGIN QCBP_KREWARD2
 SAY @207
 IF ~True()~ THEN EXTERN ~NALIAJ~ QCBP_NREWARD2
END

END

APPEND ~NALIAJ~
IF ~~ THEN BEGIN QCBP_NREBUKE
 SAY @208
 IF ~True()~ THEN EXTERN ~KORGANJ~ QCBP_KREPLY
END

IF ~~ THEN BEGIN QCBP_NREPLY
 SAY @209
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ request_gold
END

IF ~~ THEN BEGIN QCBP_NWHY
 SAY @210
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KSARCASM
  IF ~!IsValidForPartyDialog("Korgan")~ THEN EXTERN ~NALIAJ~ QCBP_NGIFT
END

IF ~~ THEN BEGIN QCBP_NSILENCE
 SAY @211
 IF ~True()~ THEN EXTERN ~NALIAJ~ QCBP_NGIFT
END

IF ~~ THEN BEGIN QCBP_NGIFT
 SAY @212
 IF ~True()~ THEN REPLY @213 EXTERN ~NALIAJ~ QCBP_NBITE
END

IF ~~ THEN BEGIN QCBP_NBITE
 SAY @214
  IF ~IsValidForPartyDialog("Rasaad")~ THEN EXTERN ~RASAADJ~ QCBP_RWOUND2
  IF ~!IsValidForPartyDialog("Rasaad")~ THEN EXTERN ~QCBPSHAL~ bite_choices
END

IF ~~ THEN BEGIN QCBP_NQUESTION
 SAY @215
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ appearance
END

IF ~~ THEN BEGIN QCBP_NAPPEAL
 SAY @216
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ leave_end
END

IF ~~ THEN BEGIN QCBP_NPROMISE
 SAY @217
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ quest_start_end
END

IF ~~ THEN BEGIN QCBP_NDORN
 SAY @218
 IF ~True()~ THEN EXTERN ~DORNJ~ QCBP_DSNAP
END

IF ~~ THEN BEGIN QCBP_NLEAVE
 SAY @219
  IF ~IsValidForPartyDialog("Keldorn")~ THEN DO ~LeaveParty() EscapeAreaDestroy(0)~ EXTERN ~KELDORJ~ QCBP_KELLEAVE
  IF ~!IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Aerie")~ THEN DO ~LeaveParty() EscapeAreaDestroy(0)~ EXTERN ~AERIEJ~ QCBP_ASAD
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Mazzy")~ THEN DO ~LeaveParty() EscapeAreaDestroy(0)~ EXTERN ~MAZZYJ~ QCBP_MWARN
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Mazzy")~ THEN DO ~LeaveParty() EscapeAreaDestroy(0)~ EXTERN ~QCBPSHAL~ abandon_final
END

IF ~~ THEN BEGIN QCBP_NREWARD1
 SAY @220
 IF ~True()~ THEN EXTERN ~KORGANJ~ QCBP_KREWARD2
END

IF ~~ THEN BEGIN QCBP_NREWARD2
 SAY @221
  IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

END

APPEND ~CERNDJ~
IF ~~ THEN BEGIN QCBP_CWOUND
 SAY @222
  IF ~IsValidForPartyDialog("Rasaad")~ THEN EXTERN ~RASAADJ~ QCBP_RWOUND
  IF ~!IsValidForPartyDialog("Rasaad")~ THEN EXTERN ~QCBPSHAL~ donation_thanks
END

IF ~~ THEN BEGIN QCBP_CCURE
 SAY @223
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ dead_please
END

END

APPEND ~RASAADJ~
IF ~~ THEN BEGIN QCBP_RWOUND
 SAY @224
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ donation_thanks
END

IF ~~ THEN BEGIN QCBP_RWOUND2
 SAY @225
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ bite_choices
END

END

APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN QCBP_JWOUND
 SAY @226
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ evade
END

IF ~~ THEN BEGIN QCBP_JCURE
 SAY @227
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ dead_please
END

IF ~~ THEN BEGIN QCBP_JCURE2
 SAY @228
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ dead_please
END

END

APPEND ~KELDORJ~
IF ~~ THEN BEGIN QCBP_KELWOUND
 SAY @229
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ last_warning
END

IF ~~ THEN BEGIN QCBP_KINFECT
 SAY @230
  IF ~IsValidForPartyDialog("Hexxat")~ THEN EXTERN ~HEXXATJ~ QCBP_HSICK
  IF ~!IsValidForPartyDialog("Hexxat") IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QCBP_NPROMISE
  IF ~!IsValidForPartyDialog("Hexxat") !IsValidForPartyDialog("Nalia")~ THEN EXTERN ~QCBPSHAL~ quest_start_end
END

END

APPEND ~DORNJ~
IF ~~ THEN BEGIN QCBP_DSCORN
 SAY @231
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ appearance_insist
END

IF ~~ THEN BEGIN QCBP_DNOHELP
 SAY @232
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QCBP_NDORN
  IF ~!IsValidForPartyDialog("Nalia")~ THEN EXTERN ~QCBPSHAL~ thanks_help
END

IF ~~ THEN BEGIN QCBP_DSNAP
 SAY @233
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ thanks_help
END

IF ~~ THEN BEGIN QCBP_DREWARD_EARLY
 SAY @234
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ QCBP_KELREWARD
  IF ~!IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCBP_VREWARD
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KREWARD
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

IF ~~ THEN BEGIN QCBP_DREWARD
 SAY @235
  IF ~IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ QCBP_KELREWARD
  IF ~!IsValidForPartyDialog("Keldorn") IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCBP_VREWARD
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KREWARD
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Keldorn") !IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

END

APPEND ~HEXXATJ~
IF ~~ THEN BEGIN QCBP_HSICK
 SAY @236
  IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN ~NALIAJ~ QCBP_NPROMISE
  IF ~!IsValidForPartyDialog("Nalia")~ THEN EXTERN ~QCBPSHAL~ quest_start_end
END

END

APPEND ~VICONIJ~
IF ~~ THEN BEGIN QCBP_VPOTION
 SAY @237
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ after_heal_note
END

IF ~~ THEN BEGIN QCBP_VCURE
 SAY @238
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ dead_please
END

IF ~~ THEN BEGIN QCBP_VREWARD
 SAY @239
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KREWARD
  IF ~!IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

END

APPEND ~AERIEJ~
IF ~~ THEN BEGIN QCBP_ACURE
 SAY @240
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ dead_please
END

IF ~~ THEN BEGIN QCBP_ASAD
 SAY @241
  IF ~IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MWARN
  IF ~!IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~QCBPSHAL~ abandon_final
END

IF ~~ THEN BEGIN QCBP_ACELEB
 SAY @242
  IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ QCBP_EWEARY
  IF ~!IsValidForPartyDialog("Edwin")~ THEN EXTERN ~QCBPSHAL~ final_thank
END

END

APPEND ~ANOMENJ~
IF ~~ THEN BEGIN QCBP_ANCURE
 SAY @243
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ dead_please
END

END

APPEND ~KELDORJ~
IF ~~ THEN BEGIN QCBP_KELLEAVE
 SAY @244
  IF ~IsValidForPartyDialog("Aerie")~ THEN DO ~LeaveParty() EscapeAreaDestroy(0)~ EXTERN ~AERIEJ~ QCBP_ASAD
  IF ~!IsValidForPartyDialog("Aerie") IsValidForPartyDialog("Mazzy")~ THEN DO ~LeaveParty() EscapeAreaDestroy(0)~ EXTERN ~MAZZYJ~ QCBP_MWARN
  IF ~!IsValidForPartyDialog("Aerie") !IsValidForPartyDialog("Mazzy")~ THEN DO ~LeaveParty() EscapeAreaDestroy(0)~ EXTERN ~QCBPSHAL~ abandon_final
END

IF ~~ THEN BEGIN QCBP_KELREWARD
 SAY @245
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCBP_VREWARD
  IF ~!IsValidForPartyDialog("Viconia") IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ QCBP_KREWARD
  IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") IsValidForPartyDialog("Mazzy")~ THEN EXTERN ~MAZZYJ~ QCBP_MREWARD
  IF ~!IsValidForPartyDialog("Viconia") !IsValidForPartyDialog("Korgan") !IsValidForPartyDialog("Mazzy")~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

IF ~~ THEN BEGIN QCBP_KGHINTRO
 SAY @246
 IF ~True()~ THEN EXTERN ~QCBPGHOL~ gh_threat
END

END

APPEND ~MAZZYJ~
IF ~~ THEN BEGIN QCBP_MWARN
 SAY @247
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ abandon_final
END

IF ~~ THEN BEGIN QCBP_MREWARD
 SAY @248
 IF ~True()~ THEN DO ~SetGlobal("QCBP_DONE","GLOBAL",1) SetGlobal("QCBP_STAGE","GLOBAL",3) SetGlobal("QCBP_CURE_RESPONSE","GLOBAL",0) ReputationInc(1) AddXPObject(Player1,10000) AddXPObject(Player2,10000) AddXPObject(Player3,10000) AddXPObject(Player4,10000) AddXPObject(Player5,10000) AddXPObject(Player6,10000)~ SOLVED_JOURNAL @102 EXIT
END

END

APPEND ~EDWINJ~
IF ~~ THEN BEGIN QCBP_EWEARY
 SAY @249
 IF ~True()~ THEN EXTERN ~QCBPSHAL~ final_thank
END

END
