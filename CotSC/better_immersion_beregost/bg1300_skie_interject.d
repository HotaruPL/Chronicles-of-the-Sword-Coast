// Skie interjection for the BG1300 Entar Silvershield commoner.
// Use INTERJECT_COPY_TRANS so the original dialogue flow is preserved and
// the party reaction is inserted before the conversation ends.
INTERJECT_COPY_TRANS BIBHUM13 0 BISKIE1300
  == SKIEJ IF ~InParty("SKIE")~ THEN @1
END
