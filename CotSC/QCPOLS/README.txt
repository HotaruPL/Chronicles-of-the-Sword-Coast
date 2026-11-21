POTIONS OF LIFE SAVING — QC Better Immersion (EET) — v1.0
======================================================

A standalone, single-component WeiDU mod that adds 15 rare Potions of Life Saving
in existing containers throughout EET. It does not add merchants, new quests,
new NPCs, or any loot beyond the 15 listed potions.

POTION
  Name: Potion of Life Saving
  Resref: QCPLIFE (different from Eastern Carnival's QCLIFE)
  Effect: instant restoration of 80 Hit Points, consumed on use
  Weight: 1 lb (inherited from the original POTN08 potion)
  Source: Original Eastern Carnival WeiDU code / original QCLIFE.BAM asset
  Artwork: unmodified binary copy of Eastern Carnival's original QCLIFE.BAM
  Description: identical to Eastern Carnival's potion
  Shop inventory: NONE

INSTALL
  1. Extract this archive into the EET game folder beside chitin.key.
     It should contain the QCPOLS folder and setup-QCPOLS.exe.
  2. Run setup-QCPOLS.exe.
  3. Select Potions of Life Saving - Rare Potions in EET Containers.
  4. Test a newly visited area, preferably before its container data was saved.

IMPORTANT: There is no dependency on Eastern Carnival or Miscellaneous Merchants.
The new QCPLIFE resource has its own item/icon names. Neither other mod is patched,
replaced or uninstalled. Eastern Carnival's QCLIFE remains available separately.

PLACEMENT
  Every area receives exactly ONE potion in the EXISTING container nearest
  the requested coordinates. All existing contents are preserved.
  If a target area is absent or has no containers, the installer prints a
  warning (rather than inventing a container). Check the installation log.

  BG1                3 potions
  Siege of Dragonspear 2 potions
  Shadows of Amn     8 potions
  Throne of Bhaal    2 potions
  TOTAL             15 potions

  Full list: QCPOLS/PLACEMENT_MANIFEST.csv

TEST
  After installing, summon the item via the EE console:
  C:CreateItem("QCPLIFE")
  Compare 80 HP restoration and the inventory icon against the Carnival potion.
  Existing saved area instances may not receive the added loot; test with a
  save created before first entering the location when possible.

NOTES
  - This is one installable component, distinct from QCMM and Eastern Carnival.
  - It doesn't touch any creature, store, script, dialogue or Carnival file.
  - No merchant stocks the potions. They're intended to be found, not bought.
  - Missing-target warnings do not change other already patched areas.
  - This package was structurally validated, not run inside the user's EET.
