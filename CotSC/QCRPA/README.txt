REPUTATION ADJUSTER- READ README!
Better Immersion for Baldur's Gate / EET
Version 1.0 - Optional, cheat-like utility component
==========================================================

IMPORTANT: READ BEFORE INSTALLING

This component intentionally allows a player to change the party's
reputation unlawfully, without earning or losing it through normal play.
It is an OPTIONAL CHEAT/QUALITY-OF-LIFE TWEAK, not a quest, nor a balancing
feature. If you want the original reputation challenge, do not install it.

Four characters can set party reputation for free to ANY integer from
1 through 20. Speak to them, select a range, then select the exact value.
You can return for further adjustments at any time.

BG1 (BG2304): Mervin, X=491, Y=287, facing southwest.
  Appearance base: FUMIN, with dark/black hair.
Siege of Dragonspear (BD3000): Flora, X=2303, Y=1723, facing west.
  Appearance base: AMMAJIRA.
Shadows of Amn (AR0901): Sebastien, X=1140, Y=333, facing south.
  Appearance base: PRIHEL.
Throne of Bhaal (AR4500): Kai, X=2252, Y=1123, facing south.
  Appearance base: BDLEMURE. His dialogue references Bhaal's essence
  and his creation from the player's psyche in the Pocket Plane.

This is NOT a reputation-lock feature:
* The game continues to apply its original reputation consequences.
* Party members may become unhappy or leave at certain values.
* Changing reputation does not automatically restore departed companions.
* Guard hostility, temple/shop prices, and reputation-sensitive scripts,
  quests or class conditions may respond to the new value normally.
* There is no gold cost, cooldown, journal entry, or hidden quest.

TECHNICAL NOTES

- One standalone WeiDU component, EET only.
- All newly-created resources begin with QC and fit within 8-character resrefs.
- Source creature files FUMIN, AMMAJIRA, PRIHEL, BDLEMURE are copied,
  NOT overwritten. The resulting NPCs are neutral and their inherited AI
  scripts are cleared; special scripts and other mod components untouched.
- Uses the built-in ReputationSet(value) script action in conversation.
- NPC placements patch the specified existing areas with fj_are_structure.
- For reliable placement tests use a save from BEFORE first entering the area.
- Installer requires all the original named CRE and ARE resources and
  fails with an explicit message if one is missing.

INSTALLATION

Extract the QCRPA folder and setup-QCRPA.exe into the EET game folder
(containing chitin.key). Run setup-QCRPA.exe and choose the single component
"Reputation Adjuster- READ README!".

Testing console commands:
  C:CreateCreature("QCRPMERV")
  C:CreateCreature("QCRPFLOR")
  C:CreateCreature("QCRPSEBA")
  C:CreateCreature("QCRPKAI")

No files or data from any other Better Immersion component are changed.
