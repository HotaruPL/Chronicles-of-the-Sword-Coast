BEGIN ~QCCORAL~
IF ~Global("QCCOR_ST","GLOBAL",1) PartyHasItem("QCCPEARL")~ THEN BEGIN pearl_ready
  SAY @105
  IF ~~ THEN REPLY @106 GOTO pearl_return
  IF ~Global("QCCOR_PROM","GLOBAL",1)~ THEN REPLY @107 GOTO coral_threat
  IF ~~ THEN REPLY @108 GOTO not_yet
  IF ~~ THEN REPLY @109 GOTO abandon
END
IF ~Global("QCCOR_ST","GLOBAL",1)~ THEN BEGIN checkin
  SAY @110
  IF ~PartyHasItem("QCCPEARL")~ THEN REPLY @111 GOTO pearl_return
  IF ~Global("QCCOR_PROM","GLOBAL",1)~ THEN REPLY @112 GOTO coral_threat
  IF ~~ THEN REPLY @113 GOTO not_yet
  IF ~~ THEN REPLY @114 GOTO abandon
END
IF ~Global("QCCOR_ST","GLOBAL",2)~ THEN BEGIN returned
  SAY @115
  IF ~~ THEN EXIT
END
IF ~Global("QCCOR_ST","GLOBAL",0)~ THEN BEGIN start
  SAY @116
  IF ~~ THEN REPLY @117 GOTO introduction
  IF ~~ THEN REPLY @118 GOTO threaten
END
IF ~~ THEN BEGIN threaten
  SAY @119
  IF ~~ THEN REPLY @120 GOTO introduction
  IF ~~ THEN REPLY @121 GOTO depart
END
IF ~~ THEN BEGIN introduction
  SAY @122
  IF ~~ THEN GOTO intro2
END
IF ~~ THEN BEGIN intro2
  SAY @123
  IF ~~ THEN GOTO intro3
END
IF ~~ THEN BEGIN intro3
  SAY @124
  IF ~~ THEN REPLY @125 GOTO accept_free
  IF ~~ THEN REPLY @126 GOTO reward_offer
  IF ~~ THEN REPLY @127 GOTO depart
END
IF ~~ THEN BEGIN accept_free
  SAY @128
  IF ~~ THEN DO ~SetGlobal("QCCOR_ST","GLOBAL",1)~ UNSOLVED_JOURNAL @100 EXIT
END
IF ~~ THEN BEGIN reward_offer
  SAY @129
  IF ~~ THEN REPLY @130 GOTO accept_price
  IF ~~ THEN REPLY @131 GOTO depart
END
IF ~~ THEN BEGIN accept_price
  SAY @132
  IF ~~ THEN DO ~SetGlobal("QCCOR_ST","GLOBAL",1)~ UNSOLVED_JOURNAL @100 EXIT
END
IF ~~ THEN BEGIN depart
  SAY @133
  IF ~~ THEN DO ~SetGlobal("QCCOR_ST","GLOBAL",4) EscapeArea()~ EXIT
END
IF ~~ THEN BEGIN pearl_return
  SAY @134
  IF ~~ THEN DO ~SetGlobal("QCCOR_ST","GLOBAL",2) TakePartyItem("QCCPEARL") DestroyItem("QCCPEARL") GiveItemCreate("AROW04",Player1,80,0,0) AddXPObject(Player1,15000) AddXPObject(Player2,15000) AddXPObject(Player3,15000) AddXPObject(Player4,15000) AddXPObject(Player5,15000) AddXPObject(Player6,15000) EscapeArea()~ SOLVED_JOURNAL @102 EXIT
END
IF ~~ THEN BEGIN coral_threat
  SAY @135
  IF ~~ THEN DO ~Enemy()~ EXIT
END
IF ~~ THEN BEGIN not_yet
  SAY @136
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN abandon
  SAY @137
  IF ~~ THEN DO ~SetGlobal("QCCOR_ST","GLOBAL",4) EscapeArea()~ SOLVED_JOURNAL @104 EXIT
END

BEGIN ~QCCOZEX~
IF ~Global("QCCOR_PROM","GLOBAL",1) Dead("QCCORAL") Global("QCCOR_PAY","GLOBAL",0)~ THEN BEGIN contract_paid
  SAY @138
  IF ~~ THEN REPLY @139 GOTO reward_cloak
  IF ~~ THEN REPLY @140 GOTO fight
END
IF ~Global("QCCOR_PROM","GLOBAL",1) Global("QCCOR_PAY","GLOBAL",0)~ THEN BEGIN awaiting_kill
  SAY @141
  IF ~Dead("QCCORAL")~ THEN REPLY @142 GOTO reward_cloak
  IF ~Global("QCCOR_ST","GLOBAL",4)~ THEN REPLY @143 GOTO refused
  IF ~~ THEN REPLY @144 GOTO fight
  IF ~~ THEN REPLY @145 GOTO soon
END
IF ~Global("QCCOR_PAY","GLOBAL",1)~ THEN BEGIN afterpay
  SAY @146
  IF ~~ THEN EXIT
END
IF ~Global("QCCOR_OFFER","GLOBAL",1) Global("QCCOR_PROM","GLOBAL",0)~ THEN BEGIN wait_decision
  SAY @147
  IF ~~ THEN REPLY @148 GOTO promise
  IF ~~ THEN REPLY @149 GOTO fight
  IF ~~ THEN REPLY @150 GOTO later
END
IF ~True()~ THEN BEGIN first
  SAY @151
  IF ~Global("QCCOR_MET","GLOBAL",1)~ THEN REPLY @152 GOTO pearl_inquire
  IF ~~ THEN REPLY @153 EXIT
END
IF ~~ THEN BEGIN pearl_inquire
  SAY @154
  IF ~~ THEN GOTO jewellery
END
IF ~~ THEN BEGIN jewellery
  SAY @155
  IF ~~ THEN REPLY @156 GOTO jeweller
  IF ~~ THEN REPLY @157 GOTO barter
  IF ~~ THEN REPLY @158 GOTO sirine_here
END
IF ~~ THEN BEGIN jeweller
  SAY @159
  IF ~~ THEN GOTO jeweller2
END
IF ~~ THEN BEGIN jeweller2
  SAY @160
  IF ~~ THEN REPLY @161 GOTO barter
  IF ~~ THEN REPLY @162 GOTO sirine_here
  IF ~~ THEN REPLY @163 EXIT
END
IF ~~ THEN BEGIN barter
  SAY @164
  IF ~~ THEN GOTO barter2
END
IF ~~ THEN BEGIN barter2
  SAY @165
  IF ~~ THEN GOTO barter3
END
IF ~~ THEN BEGIN barter3
  SAY @166
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ QCCVIC_1
  IF ~!IsValidForPartyDialog("Viconia")~ THEN GOTO contract_intro
END
IF ~~ THEN BEGIN contract_intro
  SAY @167
  IF ~~ THEN GOTO choose
END
IF ~~ THEN BEGIN choose
  SAY @168
  IF ~~ THEN REPLY @169 GOTO promise
  IF ~~ THEN REPLY @170 GOTO fight
  IF ~~ THEN REPLY @171 GOTO later
END
IF ~~ THEN BEGIN sirine_here
  SAY @172
  IF ~~ THEN GOTO where
END
IF ~~ THEN BEGIN where
  SAY @173
  IF ~~ THEN REPLY @174 GOTO where2
END
IF ~~ THEN BEGIN where2
  SAY @175
  IF ~~ THEN GOTO choose
END
IF ~~ THEN BEGIN promise
  SAY @176
  IF ~~ THEN DO ~SetGlobal("QCCOR_OFFER","GLOBAL",1) SetGlobal("QCCOR_PROM","GLOBAL",1)~ UNSOLVED_JOURNAL @101 EXIT
END
IF ~~ THEN BEGIN later
  SAY @177
  IF ~~ THEN DO ~SetGlobal("QCCOR_OFFER","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN soon
  SAY @178
  IF ~~ THEN EXIT
END
IF ~~ THEN BEGIN refused
  SAY @179
  IF ~~ THEN DO ~SetGlobal("QCCOR_PAY","GLOBAL",1) SetGlobal("QCCOR_ST","GLOBAL",4) EscapeArea()~ SOLVED_JOURNAL @104 EXIT
END
IF ~~ THEN BEGIN reward_cloak
  SAY @180
  IF ~~ THEN DO ~SetGlobal("QCCOR_PAY","GLOBAL",1) SetGlobal("QCCOR_ST","GLOBAL",3) GiveItemCreate("QCCVEST",Player1,1,0,0) AddXPObject(Player1,15000) AddXPObject(Player2,15000) AddXPObject(Player3,15000) AddXPObject(Player4,15000) AddXPObject(Player5,15000) AddXPObject(Player6,15000)~ SOLVED_JOURNAL @103 EXIT
END
IF ~~ THEN BEGIN fight
  SAY @181
  IF ~~ THEN DO ~SetGlobal("QCCOR_FIGHT","GLOBAL",1) ActionOverride("sahpr2",Enemy()) Enemy()~ EXIT
END
APPEND ~VICONIJ~
IF ~~ THEN BEGIN QCCVIC_1
  SAY @182
  IF ~~ THEN EXTERN ~QCCOZEX~ contract_intro
END
END
