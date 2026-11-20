// Imoen alone delivers these lines, with her own avatar/portrait.
// This is started explicitly by her own actor script (the same pattern as QCHSTIM).
BEGIN ~QCHDIIM~
IF ~Global("QCHDI_PHASE","GLOBAL",2)~ THEN BEGIN first
  SAY ~Who... who are you?!~
  IF ~~ THEN DO ~SetGlobal("QCHDI_PHASE","GLOBAL",3)~ EXIT
END
IF ~Global("QCHDI_PHASE","GLOBAL",6)~ THEN BEGIN second
  SAY ~You are not me! Only one of us can exist! This is nothing but a mere illusion.~
  IF ~~ THEN DO ~SetGlobal("QCHDI_PHASE","GLOBAL",7)~ EXIT
END
IF ~Global("QCHDI_PHASE","GLOBAL",10)~ THEN BEGIN final
  SAY ~Never! I will sooner die than accept evil into my heart. Bhaal and I share blood, and only that!~
  IF ~~ THEN DO ~SetGlobal("QCHDI_PHASE","GLOBAL",11)~ EXIT
END
