// BG2 companion interjections for Quentin's lich reveal.
// Proven Keldorn INTERJECT_COPY_TRANS pattern; Mazzy is added using the same BG2 joined-party dialogue resource.
INTERJECT_COPY_TRANS ~QCQUENT~ 14 QCFI_QUENT_COMPANIONS
  == ~KELDORJ~ IF ~InParty("Keldorn")~ THEN ~To fall into a trap so easily. We must put a stop to this madness! Defend yourself!~
  == ~MAZZYJ~ IF ~InParty("Mazzy")~ THEN ~Some ambitious plan. Shall we cut him down, or do you wish to waste more time listening to his sickening aspirations?~
END
