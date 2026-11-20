// Ranger Don: missing wife Erica, Imnesvale.
BEGIN ~QCRWDON~
IF ~Global("QCRW_STAGE","GLOBAL",8)~ THEN BEGIN completed
  SAY @103
  IF ~~ THEN EXIT
END
IF ~Global("QCRW_STAGE","GLOBAL",6)~ THEN BEGIN reunited
  SAY @104
  IF ~IsValidForPartyDialog("Viconia")~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",8) GiveGoldForce(300) GiveItemCreate("AROW05",Player1,20,0,0) GiveItemCreate("AROW09",Player1,20,0,0) AddExperienceParty(5000)~ SOLVED_JOURNAL @102 EXTERN ~VICONIJ~ QCRW_VICONIA_REWARD
  IF ~!IsValidForPartyDialog("Viconia")~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",8) GiveGoldForce(300) GiveItemCreate("AROW05",Player1,20,0,0) GiveItemCreate("AROW09",Player1,20,0,0) AddExperienceParty(5000)~ SOLVED_JOURNAL @102 EXIT
END
IF ~Global("QCRW_STAGE","GLOBAL",7)~ THEN BEGIN empty_arms
  SAY @105
  IF ~~ THEN REPLY @106 GOTO lie
  IF ~~ THEN REPLY @107 GOTO truth
END
IF ~Global("QCRW_STAGE","GLOBAL",1)~ THEN BEGIN waiting
  SAY @108
  IF ~~ THEN EXIT
END
IF ~True()~ THEN BEGIN intro
  SAY @109
  IF ~~ THEN REPLY @110 GOTO lost
  IF ~~ THEN REPLY @111 GOTO no
END
IF ~~ THEN BEGIN no
  SAY @112
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN lost
  SAY @113
  IF ~~ THEN GOTO suspicion
END
IF ~~ THEN BEGIN suspicion
  SAY @114
  IF ~~ THEN REPLY @115 GOTO druid
END
IF ~~ THEN BEGIN druid
  SAY @116
  IF ~~ THEN GOTO jealousy
END
IF ~~ THEN BEGIN jealousy
  SAY @117
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCRW_VICONIA_WEAK
  IF ~!IsValidForPartyDialog("Viconia")~ THEN GOTO worry
END
IF ~~ THEN BEGIN worry
  SAY @118
  IF ~~ THEN REPLY @119 GOTO enclave
  IF ~~ THEN REPLY @120 GOTO bargain
  IF ~~ THEN REPLY @121 GOTO refuse
END
IF ~~ THEN BEGIN enclave
  SAY @122
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ QCRW_JAHEIRA
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN GOTO suspicion2
END
IF ~~ THEN BEGIN suspicion2
  SAY @123
  IF ~~ THEN GOTO village
END
IF ~~ THEN BEGIN village
  SAY @124
  IF ~~ THEN REPLY @125 GOTO accept
  IF ~~ THEN REPLY @126 GOTO bargain
  IF ~~ THEN REPLY @127 GOTO refuse
END
IF ~~ THEN BEGIN bargain
  SAY @128
  IF ~~ THEN REPLY @129 GOTO accept
  IF ~~ THEN REPLY @130 GOTO refuse
END
IF ~~ THEN BEGIN refuse
  SAY @131
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN lie
  SAY @132
  IF ~~ THEN GOTO lie_reward
END
IF ~~ THEN BEGIN lie_reward
  SAY @133
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",8) GiveGoldForce(300) GiveItemCreate("AROW05",Player1,20,0,0) GiveItemCreate("AROW09",Player1,20,0,0) AddExperienceParty(5000)~ SOLVED_JOURNAL @102 EXIT
END
IF ~~ THEN BEGIN truth
  SAY @134
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",8) AddExperienceParty(5000)~ SOLVED_JOURNAL @102 EXIT
END

// v1.2: Don's acceptance is a single speech. Companions may interject
// without forcing Don to repeat several tiny placeholder dialogue states.
CHAIN ~QCRWDON~ accept
  @135
  == ~VICONIJ~ IF ~IsValidForPartyDialog("Viconia")~ THEN
    @136
  == ~KORGANJ~ IF ~IsValidForPartyDialog("Korgan")~ THEN
    @137
  == ~MINSCJ~ IF ~IsValidForPartyDialog("Minsc")~ THEN
    @138
  == ~DORNJ~ IF ~IsValidForPartyDialog("Dorn")~ THEN
    @139
END
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",1)~ UNSOLVED_JOURNAL @100 EXIT

// Erica in BG2900 / Larswood; post-fight dialogue is highest priority.
BEGIN ~QCRWERA~
IF ~Global("QCRW_STAGE","GLOBAL",5) Dead("QCRWSEOR") Dead("QCRWDR1") Dead("QCRWDR2")~ THEN BEGIN after_battle
  SAY @141
  IF ~~ THEN REPLY @142 GOTO back_from_battle
END
IF ~Global("QCRW_STAGE","GLOBAL",6)~ THEN BEGIN at_home
  SAY @143
  IF ~~ THEN EXIT
END
IF ~Global("QCRW_STAGE","GLOBAL",7)~ THEN BEGIN stayed
  SAY @144
  IF ~~ THEN EXIT
END
IF ~Global("QCRW_STAGE","GLOBAL",1)~ THEN BEGIN erica_start
  SAY @145
  IF ~~ THEN REPLY @146 GOTO identified
  IF ~~ THEN REPLY @147 EXIT
END
IF ~True()~ THEN BEGIN otherwise
  SAY @148
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN identified
  SAY @149
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCRW_VICONIA_ERA
  IF ~!IsValidForPartyDialog("Viconia")~ THEN GOTO erica_minsc
END
IF ~~ THEN BEGIN erica_minsc
  SAY @150
  IF ~IsValidForPartyDialog("Minsc")~ THEN EXTERN ~MINSCJ~ QCRW_MINSC_ERA
  IF ~!IsValidForPartyDialog("Minsc")~ THEN GOTO marriage
END
IF ~~ THEN BEGIN marriage
  SAY @151
  IF ~~ THEN GOTO seorad_history
END
IF ~~ THEN BEGIN seorad_history
  SAY @152
  IF ~~ THEN GOTO plea_era
END
IF ~~ THEN BEGIN plea_era
  SAY @153
  IF ~~ THEN REPLY @154 GOTO agree_lie
  IF ~~ THEN REPLY @155 GOTO force
END
IF ~~ THEN BEGIN agree_lie
  SAY @156
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",7) GiveItemCreate("POTN52",Player1,2,0,0) GiveItemCreate("POTN20",Player1,2,0,0) GiveItemCreate("POTN14",Player1,1,0,0)~ UNSOLVED_JOURNAL @101 EXIT
END
IF ~~ THEN BEGIN force
  SAY @157
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",4)~ EXIT
END
IF ~~ THEN BEGIN erica_cry
  SAY @158
  IF ~~ THEN EXTERN ~QCRWSEOR~ seorad_angry
END
IF ~~ THEN BEGIN back_from_battle
  SAY @159
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",6) SetGlobal("QCRW_RETURN_HOME","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN persuaded
  SAY @160
  IF ~~ THEN EXTERN ~QCRWSEOR~ seorad_wedding
END
IF ~~ THEN BEGIN persuaded2
  SAY @161
  IF ~~ THEN EXTERN ~QCRWSEOR~ seorad_cold
END
IF ~~ THEN BEGIN persuaded3
  SAY @162
  IF ~~ THEN EXTERN ~QCRWSEOR~ seorad_cruel
END
IF ~~ THEN BEGIN persuaded4
  SAY @163
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",6) SetGlobal("QCRW_RETURN_HOME","GLOBAL",1)~ EXIT
END

// Seorad arrives with his druids only during the attempted forced return.
BEGIN ~QCRWSEOR~
IF ~Global("QCRW_STAGE","GLOBAL",4)~ THEN BEGIN seorad_start
  SAY @164
  IF ~~ THEN EXTERN ~QCRWERA~ erica_cry
END
IF ~True()~ THEN BEGIN seorad_repeat
  SAY @165
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN seorad_angry
  SAY @166
  IF ~~ THEN REPLY @167 GOTO seorad_attack
  IF ~IsValidForPartyDialog("Keldorn")~ THEN REPLY @168 EXTERN ~KELDORJ~ QCRW_KELDORN
  IF ~IsValidForPartyDialog("Hexxat")~ THEN REPLY @169 EXTERN ~HEXXATJ~ QCRW_HEXXAT_1
END
IF ~~ THEN BEGIN seorad_attack
  SAY @170
  IF ~~ THEN DO ~SetGlobal("QCRW_STAGE","GLOBAL",5) ActionOverride("QCRWDR1",Enemy()) ActionOverride("QCRWDR2",Enemy()) Enemy() Attack(Player1)~ EXIT
END
IF ~~ THEN BEGIN seorad_wedding
  SAY @171
  IF ~~ THEN EXTERN ~QCRWERA~ persuaded2
END
IF ~~ THEN BEGIN seorad_cold
  SAY @172
  IF ~~ THEN EXTERN ~QCRWERA~ persuaded3
END
IF ~~ THEN BEGIN seorad_cruel
  SAY @173
  IF ~~ THEN EXTERN ~QCRWERA~ persuaded4
END

// These interjections speak in the real companions' voices, then return to QC dialogue.
APPEND ~VICONIJ~
IF ~~ THEN BEGIN QCRW_VICONIA_WEAK
  SAY @174
  IF ~~ THEN EXTERN ~QCRWDON~ worry
END
IF ~~ THEN BEGIN QCRW_VICONIA_ERA
  SAY @175
  IF ~~ THEN EXTERN ~QCRWERA~ erica_minsc
END
IF ~False()~ THEN BEGIN QCRW_VICONIA_REWARD
  SAY @140
  IF ~~ THEN EXIT
END
END
APPEND ~JAHEIRAJ~
IF ~~ THEN BEGIN QCRW_JAHEIRA
  SAY @176
  IF ~~ THEN EXTERN ~QCRWDON~ suspicion2
END
END
APPEND ~MINSCJ~
IF ~~ THEN BEGIN QCRW_MINSC_ERA
  SAY @177
  IF ~~ THEN EXTERN ~QCRWERA~ marriage
END
END
APPEND ~KELDORJ~
IF ~~ THEN BEGIN QCRW_KELDORN
  SAY @178
  IF ~~ THEN EXTERN ~QCRWERA~ persuaded
END
END
APPEND ~HEXXATJ~
IF ~~ THEN BEGIN QCRW_HEXXAT_1
  SAY @179
  IF ~~ THEN EXTERN ~HEXXATJ~ QCRW_HEXXAT_2
END
IF ~~ THEN BEGIN QCRW_HEXXAT_2
  SAY @180
  IF ~~ THEN EXTERN ~QCRWERA~ persuaded
END
END

