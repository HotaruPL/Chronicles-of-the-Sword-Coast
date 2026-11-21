BETTER IMMERSION FOR BALDUR'S GATE
MISCELLANEOUS MERCHANTS — COMPLETE SAGA
Release v1.4 | Single-component edition | EET only

ONE INSTALLER CHOICE
--------------------
The entire mod now installs or uninstalls with ONE WeiDU component:
  Miscellaneous Merchants - Complete Saga (Items, Merchants, NPC Provisions, All Container Loot)

This combines all ELEVEN former installation selections, in their previous
working order. All in-game items, icons, NPCs, dialogues, stores, prices,
voices, quests, companion inventories, and container loot definitions have
been preserved from the v1.3 release. The change is to installer packaging,
not to gameplay.

WHAT IT INCLUDES
----------------
  * Eleven new QC food/trade items (stacking, weight, healing, BAM icons).
  * BG1 merchants and fixed-price buying conversations.
  * Siege of Dragonspear merchants and Horst's original-store additions.
  * Shadows of Amn merchants, trade dialogues, Ulvryn's hostility script,
    and the three previously included container placements.
  * Throne of Bhaal merchants and Felicia's one-time Calimshan fabric trade.
  * Riggo / Igor soundset corrections.
  * BG1-wide additional items inside existing containers.
  * The fifteen BG1 recruitable companion starting provisions.
  * Siege of Dragonspear container items.
  * Shadows of Amn container items.
  * Throne of Bhaal container items.

INSTALL ON A NEW / CLEAN EET MOD SETUP
--------------------------------------
1. Extract setup-QCMM.exe and the QCMM directory into the EET game folder.
2. Run setup-QCMM.exe.
3. Install the SINGLE offered component. There are no optional subcomponents.
4. Play from a save made before first visiting any affected area to see
   its newly added NPCs/container items, or start a new game.

IMPORTANT: UPGRADING FROM THE OLD 11-COMPONENT v1.3 INSTALL
----------------------------------------------------------
DO NOT simply overwrite an installed multi-component package with this new
merged .tp2 and press Re-install. The old install has eleven different
WeiDU component indices (0–10); the new install has one (0), and WeiDU
needs to uninstall the old components using the OLD script first.

Recommended safe migration:
1. BACK UP your game (including WeiDU.log, the QCMM folder, QCMM/backup,
   and current saves).
2. WITH v1.3's original setup-QCMM.exe and original QCMM/QCMM.tp2 in place,
   use the old installer to UNINSTALL every installed Miscellaneous Merchants
   component, in reverse numerical order (10 down to 0). If WeiDU asks
   to temporarily uninstall/reinstall other mods because of install order,
   follow its prompts or migrate on a new EET installation instead.
3. Only AFTER all eleven old entries are removed from WeiDU.log, extract
   v1.4 over the existing setup-QCMM.exe and QCMM folder.
4. Run setup-QCMM.exe and choose the sole merged component.
5. Test in a fresh/unvisited area. Saved-area state and existing creatures
   generally do not refresh merely because a mod was reinstalled.

If you have misplaced the original v1.3 package, use the previously supplied
QC_Miscellaneous_Merchants_ToB_Container_Loot_v1.3.zip to uninstall
BEFORE copying the merged edition.

This release does not attempt an automatic migration of old WeiDU backup
records or already-created creature instances.

RESOURCES / CONSOLE TESTS
-------------------------
C:CreateItem("QCMEAT")     10 HP
C:CreateItem("QCSAUSG")    6 HP
C:CreateItem("QCBREAD")    5 HP
C:CreateItem("QCCOKIE")    4 HP
C:CreateItem("QCWATER")   12 HP
C:CreateItem("QCHONEY")    Trade good
C:CreateItem("QCCORN")     Trade good
C:CreateItem("QCEGGS")     Trade good
C:CreateItem("QCFLOUR")    Trade good, 100 lbs
C:CreateItem("QCGRAIN")    Trade good, 165 lbs
C:CreateItem("QCFABRC")    Trade good, 54 lbs, base value 9,000 GP

DEVELOPMENT_HISTORY.txt retains the original accumulated release notes.

QUALITY CHECK
-------------
The archive and all resource files were inspected. All nonstructural
installer content is preserved verbatim and in its original order. This
release has not been installed inside an EET game by the packager; please
test its single-component install on your EET setup.
