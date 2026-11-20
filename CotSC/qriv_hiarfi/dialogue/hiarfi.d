BEGIN ~QRHIARFI~
IF ~Global("QHIA_DONE","GLOBAL",1)~ THEN BEGIN done_repeat
  SAY @102
  IF ~~ THEN EXIT
END
IF ~Global("QHIA_MET","GLOBAL",1) PartyHasItem("QRHFLUT")~ THEN BEGIN recovered
  SAY @103
  IF ~~ THEN DO ~TakePartyItem("QRHFLUT") DestroyItem("QRHFLUT") SetGlobal("QHIA_DONE","GLOBAL",1) GiveGoldForce(400) GiveItemCreate("POTN03",Player1,1,0,0) AddExperienceParty(400)~ SOLVED_JOURNAL @101 EXIT
END
IF ~Global("QHIA_QUEST","GLOBAL",1)~ THEN BEGIN waiting
  SAY @104
  IF ~~ THEN REPLY @105 EXIT
  IF ~~ THEN REPLY @106 GOTO flute
  IF ~~ THEN REPLY @107 GOTO clues
END
IF ~Global("QHIA_MET","GLOBAL",1)~ THEN BEGIN return
  SAY @108
  IF ~~ THEN REPLY @109 GOTO flute
  IF ~~ THEN REPLY @110 GOTO clues
  IF ~~ THEN REPLY @111 GOTO refuse
END
IF ~True()~ THEN BEGIN start
  SAY @112
  IF ~~ THEN REPLY @113 GOTO favour
  IF ~~ THEN REPLY @114 GOTO intro
  IF ~~ THEN REPLY @115 GOTO no
END
IF ~~ THEN BEGIN favour
  SAY @116
  IF ~~ THEN GOTO intro
END
IF ~~ THEN BEGIN intro
  SAY @117
  IF ~~ THEN GOTO stolen
END
IF ~~ THEN BEGIN stolen
  SAY @118
  IF ~~ THEN GOTO plea
END
IF ~~ THEN BEGIN plea
  SAY @119
  IF ~~ THEN REPLY @120 DO ~SetGlobal("QHIA_MET","GLOBAL",1)~ GOTO flute
  IF ~~ THEN REPLY @121 DO ~SetGlobal("QHIA_MET","GLOBAL",1)~ GOTO college
  IF ~~ THEN REPLY @122 DO ~SetGlobal("QHIA_MET","GLOBAL",1)~ GOTO clues
  IF ~~ THEN REPLY @123 DO ~SetGlobal("QHIA_MET","GLOBAL",1)~ GOTO refuse
END
IF ~~ THEN BEGIN no
  SAY @124
  // No quest accepted and no conversation progression: greet afresh next time.
  IF ~~ THEN DO ~SetGlobal("QHIA_MET","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN flute
  SAY @125
  IF ~~ THEN GOTO flute2
END
IF ~~ THEN BEGIN flute2
  SAY @126
  IF ~IsValidForPartyDialog("HaerDalis")~ THEN EXTERN ~HAERDAJ~ QRHIA_HAER
  IF ~!IsValidForPartyDialog("HaerDalis")~ THEN GOTO decision
END
IF ~~ THEN BEGIN pity
  SAY @127
  IF ~~ THEN GOTO decision
END
IF ~~ THEN BEGIN decision
  SAY @128
  IF ~~ THEN REPLY @129 GOTO college
  IF ~~ THEN REPLY @130 GOTO clues
  IF ~~ THEN REPLY @131 GOTO refuse
END
IF ~~ THEN BEGIN college
  SAY @132
  IF ~~ THEN GOTO college2
END
IF ~~ THEN BEGIN college2
  SAY @133
  IF ~~ THEN REPLY @134 GOTO flute
  IF ~~ THEN REPLY @135 GOTO clues
  IF ~~ THEN REPLY @136 GOTO refuse
END
IF ~~ THEN BEGIN clues
  SAY @137
  IF ~~ THEN REPLY @138 GOTO accept
  IF ~~ THEN REPLY @139 GOTO refuse
END
IF ~~ THEN BEGIN accept
  SAY @140
  IF ~~ THEN DO ~SetGlobal("QHIA_MET","GLOBAL",1) SetGlobal("QHIA_QUEST","GLOBAL",1)~ UNSOLVED_JOURNAL @100 EXIT
END
IF ~~ THEN BEGIN refuse
  SAY @141
  IF ~~ THEN DO ~SetGlobal("QHIA_MET","GLOBAL",1)~ EXIT
END
APPEND ~HAERDAJ~
IF ~~ THEN BEGIN QRHIA_HAER
  SAY @142
  IF ~~ THEN EXTERN ~QRHIARFI~ pity
END
END
