INTERJECT_COPY_TRANS DRELIK 0 DH_DRELIK7
  == DRELIK IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @166
  == VICONJ IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @144
  == DRELIK IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @145 DO ~AddJournalEntry(@103,QUEST)~
END

INTERJECT_COPY_TRANS JARDAK 0 DH_JARDAK7
  == JARDAK IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @167
  == VICONJ IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @146
  == JARDAK IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @147
  == VICONJ IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @148
  == JARDAK IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @149
  == VICONJ IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @150
  == JARDAK IF ~InParty("Viconia") Global("DH7_VICONIA_3","GLOBAL",1)~ THEN @151
END
