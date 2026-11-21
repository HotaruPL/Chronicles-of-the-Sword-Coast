// Viconia dialogue for Drow Hunters.
// The initial hunter reaction is appended to Viconia's REAL BG1/EET joined dialogue
// resource, following the proven Q&C pattern: EXTERN VICONJ <state>.

// Later clue conversations remain in the dedicated Drow Hunters dialogue so they
// can be explicitly started by the area scripts, as in the working earlier build.
BEGIN DHVICON

IF ~Global("DH7_CLUE1_STARTED","GLOBAL",1) Global("DH7_VICONIA_1","GLOBAL",0)~ THEN BEGIN 10
  SAY @123
  IF ~~ THEN REPLY @124 GOTO 11
  IF ~Gender(Player1,MALE)~ THEN REPLY @125 GOTO 12M
  IF ~Gender(Player1,FEMALE)~ THEN REPLY @125 GOTO 12F
  IF ~~ THEN REPLY @126 GOTO 13
END

IF ~~ THEN BEGIN 11
  SAY @127
  IF ~~ THEN DO ~AddJournalEntry(@100,QUEST) SetGlobal("DH7_VICONIA_1","GLOBAL",1) SetGlobal("DH7_CLUE1_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 12M
  SAY @162
  IF ~~ THEN DO ~AddJournalEntry(@100,QUEST) SetGlobal("DH7_VICONIA_1","GLOBAL",1) SetGlobal("DH7_CLUE1_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 12F
  SAY @163
  IF ~~ THEN DO ~AddJournalEntry(@100,QUEST) SetGlobal("DH7_VICONIA_1","GLOBAL",1) SetGlobal("DH7_CLUE1_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 13
  SAY @129
  IF ~~ THEN DO ~AddJournalEntry(@100,QUEST) SetGlobal("DH7_VICONIA_1","GLOBAL",1) SetGlobal("DH7_CLUE1_STARTED","GLOBAL",0)~ EXIT
END

// After the Peter clue.
IF ~Global("DH7_CLUE2_STARTED","GLOBAL",1) Global("DH7_VICONIA_2","GLOBAL",0)~ THEN BEGIN 20
  SAY @130
  IF ~~ THEN REPLY @131 GOTO 21
  IF ~~ THEN REPLY @132 GOTO 22
  IF ~~ THEN REPLY @133 GOTO 23
END
IF ~~ THEN BEGIN 21
  SAY @134
  IF ~~ THEN DO ~AddJournalEntry(@101,QUEST) SetGlobal("DH7_VICONIA_2","GLOBAL",1) SetGlobal("DH7_CLUE2_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 22
  SAY @135
  IF ~~ THEN DO ~AddJournalEntry(@101,QUEST) SetGlobal("DH7_VICONIA_2","GLOBAL",1) SetGlobal("DH7_CLUE2_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 23
  SAY @136
  IF ~~ THEN DO ~AddJournalEntry(@101,QUEST) SetGlobal("DH7_VICONIA_2","GLOBAL",1) SetGlobal("DH7_CLUE2_STARTED","GLOBAL",0)~ EXIT
END

// After Davaeorn's letter.
IF ~Global("DH7_CLUE3_STARTED","GLOBAL",1) Global("DH7_VICONIA_3","GLOBAL",0)~ THEN BEGIN 30
  SAY @137
  IF ~~ THEN REPLY @138 GOTO 31
  IF ~~ THEN REPLY @139 GOTO 32
  IF ~~ THEN REPLY @140 GOTO 33
END
IF ~~ THEN BEGIN 31
  SAY @141
  IF ~~ THEN DO ~AddJournalEntry(@102,QUEST) SetGlobal("DH7_VICONIA_3","GLOBAL",1) SetGlobal("DH7_CLUE3_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 32
  SAY @142
  IF ~~ THEN DO ~AddJournalEntry(@102,QUEST) SetGlobal("DH7_VICONIA_3","GLOBAL",1) SetGlobal("DH7_CLUE3_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 33
  SAY @143
  IF ~~ THEN DO ~AddJournalEntry(@102,QUEST) SetGlobal("DH7_VICONIA_3","GLOBAL",1) SetGlobal("DH7_CLUE3_STARTED","GLOBAL",0)~ EXIT
END

// After Jardak dies.
IF ~Global("DH7_FINAL_STARTED","GLOBAL",1) Global("DH7_FINAL_TALK","GLOBAL",0)~ THEN BEGIN 40
  SAY @152
  IF ~~ THEN REPLY @153 GOTO 41
  IF ~~ THEN REPLY @154 GOTO 43
END
IF ~~ THEN BEGIN 41
  SAY @155
  IF ~~ THEN GOTO 43
END
IF ~~ THEN BEGIN 43
  SAY @156
  IF ~~ THEN REPLY @157 GOTO 44
  IF ~~ THEN REPLY @158 GOTO 45
  IF ~~ THEN REPLY @159 GOTO 46
END
IF ~~ THEN BEGIN 44
  SAY @164
  IF ~~ THEN DO ~AddExperienceParty(2000) AddJournalEntry(@105,QUEST_DONE) SetGlobal("DH7_FINAL_TALK","GLOBAL",1) SetGlobal("DH7_FINAL_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 45
  SAY @160
  IF ~~ THEN DO ~AddExperienceParty(2000) AddJournalEntry(@105,QUEST_DONE) SetGlobal("DH7_FINAL_TALK","GLOBAL",1) SetGlobal("DH7_FINAL_STARTED","GLOBAL",0)~ EXIT
END
IF ~~ THEN BEGIN 46
  SAY @161
  IF ~~ THEN DO ~AddExperienceParty(2000) AddJournalEntry(@105,QUEST_DONE) SetGlobal("DH7_FINAL_TALK","GLOBAL",1) SetGlobal("DH7_FINAL_STARTED","GLOBAL",0)~ EXIT
END
