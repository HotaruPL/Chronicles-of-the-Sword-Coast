// Companion reactions now run sequentially in a single interjection chain.
// Each line is independently conditional, so every companion who is present gets to speak.
INTERJECT_COPY_TRANS QCASTAR 6 QCA_ASTAR_COMPANION_REACTIONS
  == AJANTJ IF ~InParty("Ajantis")~ THEN @28
  == KAGAIJ IF ~InParty("Kagain")~ THEN @29
  == KHALIJ IF ~InParty("Khalid")~ THEN @30
  == VICONJ IF ~InParty("Viconia")~ THEN @31
  == RASAADJ_ IF ~InParty("Rasaad")~ THEN @32
END
