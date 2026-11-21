BEGIN DHDIMW9

// This deliberately copies the Dark Horizons Tristan/Isolde structure:
// INITDLG on the CRE starts this dialogue automatically; CHAIN alternates
// speakers and ends by turning both hunters hostile.

CHAIN
IF ~True()~ THEN DHDIMW9 0
@120
== VICONJ @121
== DHDIMW9 @122
DO ~SetGlobal("DH9_TRIST_FIGHT","GLOBAL",1) Enemy() ActionOverride("DHZEPH8",Enemy()) AttackReevaluate(Player1,30) ActionOverride("DHZEPH8",AttackReevaluate(Player1,30))~
EXIT
