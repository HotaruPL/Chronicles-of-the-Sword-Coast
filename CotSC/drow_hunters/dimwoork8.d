BEGIN DHDIMW8

// Exact Shante-style dialogue structure first; no Viconia interjection here.
// This isolates Dimwoork's own dialogue firing before we add the interjection
// back in a separate step.
IF ~~ THEN BEGIN 0
  SAY @120
  IF ~~ THEN GOTO 1
END

IF ~~ THEN BEGIN 1
  SAY @122
  IF ~~ THEN DO ~Enemy() ActionOverride("DHZEPH8",Enemy()) ActionOverride("DHZEPH8",AttackReevaluate(Player1,30)) AttackReevaluate(Player1,30)~ EXIT
END
