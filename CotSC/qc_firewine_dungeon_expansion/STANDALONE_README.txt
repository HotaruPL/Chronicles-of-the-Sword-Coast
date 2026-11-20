Firewine dungeon expansion - v1.37 - stable visibility range 8

New in v1.29:
- Keeps the confirmed-improved v1.28 WED wall occlusion.
- QCCFIR now caps party VISUALRANGE at 8 while inside the dungeon: a little more forward visibility while retaining the strong WED wall occlusion.
- This changes only fog-of-war/vision radius; it does not apply the Blindness state or any THAC0/AC penalties.
- On returning through the connected stairs to BG5201, a small BG5201 script extension restores the party's normal visual range to 14.
- Existing gameplay, Lara, transitions, music, Manticore, enemies, traps, containers and loot are unchanged.

Firewine dungeon expansion - v1.23 Lara any-party-member fix

New in v1.23:
- Lara is no longer hard-wired to Player1/Charname.
- Her override script now uses the same proven pattern as the earlier Kira/Delcia encounters: See([PC]), MoveToObject(LastSeenBy(Myself)), and StartDialogueNoSet(LastSeenBy(Myself)).
- She therefore approaches and speaks to whichever party member she sees first.
- Lara's working v1.22 dialogue entry-state fix remains unchanged.

Firewine dungeon expansion - v1.19 transitions, Lara, and dungeon music

New in v1.19:
- QCCFIR X=781,Y=1184 now has a door-icon transition to BG5201 X=55,Y=872 and a matching return transition.
- BG5201 is patched with COPY_EXISTING, preserving EET/other-mod area changes rather than overwriting the area with the supplied reference file.
- Lara is added to BG5201 at X=130,Y=856, facing north. She is based on GERDE, wears LEAT01 leather armour and HELM01, warns the party automatically on sight, then uses EscapeArea() to walk toward the nearest exit and disappear.
- QCCFIR now uses explicit BG1 DUNG1 music (EET song slot 121) for day/night; the already-working Firewine ambience remains unchanged. BG5201 itself uses -1/inherited music entries, so its raw song block is not copied.

New in v1.17:
- Manticore Hide sale now uses GiveGoldForce(5000), so Taerom always pays the full 5,000 gp.
- Rasaad Manticore interjections use EET BG1 joined dialogue RASAADJ_.
- Manticore dialogue proxy is NEUTRAL (EA 128), so hostile monsters do not select/attack it.
- QCCFIR now uses the BG1 Firewine Bridge Ruins ambient bed (AMB_S05A) plus periodic rat sounds (AMB_E45A/B/C), copied from the Firewine-style BG1009 ambient setup.


Area: QCCFIR

Preserved from the confirmed-working baseline:
- all 6 containers remain openable
- all requested container loot remains unchanged
- Boots of Traitor remains usable by any class containing Thief and blocked for non-Thief classes
- the locked/trapped chest remains unchanged
- all 10 floor traps retain the confirmed one-shot Entered() behavior
- all v1.13 hostile creatures and kobold roaming behavior are preserved
- area graphics, collision, container polygons and trap regions are unchanged

New in v1.15:

1) Manticore dialogue proxy
- QCFMANT is placed at QCCFIR X=1302,Y=451.
- It is based on SQUIRL only for a tiny collision footprint.
- GOODBUTBLUE allegiance gives it a blue selection circle.
- Permanent transparency makes the creature sprite itself invisible, leaving the circle/dialogue point over the static manticore artwork.
- Minimum-HP protection prevents accidental killing; the dialogue destroys the proxy explicitly when the manticore is mercy-killed.

2) Manticore dialogue
- Full conversation from the supplied design is implemented in QCFMANTC.DLG.
- Initial reactions are included for Dynaheir, Branwen, Coran, Ajantis, Edwin, Faldorn, Garrick, Jaheira, Khalid, Tiax, Xzar, Neera, Rasaad and EET Imoen.
- Dynaheir has the Underdark/tunnel interjection.
- Ajantis and Jaheira react to the request for death.
- Faldorn reacts when the player agrees to kill the manticore.
- Killing the manticore gives 1200 party XP and Manticore's Hide, then removes the blue-circle proxy.
- Sparing it leaves the proxy in place and gives the later kill/spare dialogue on subsequent clicks.

3) Manticore's Hide
- Resource: QCFMHIDE.ITM
- Custom inventory art is derived from the supplied orange-hide screenshot.
- Inventory-only crafting material with a custom description.

4) Taerom crafting
- Taerom is extended at the same normal dialogue attachment states used by Shades of the Sword Coast: 0, 4, 8, 12 and 14.
- If the party has Manticore's Hide, Taerom offers either:
  * craft armor for 5000 gold and 3 days, or
  * buy the hide for 5000 gold.
- After 3 days, Taerom gives Manticore's Mane.

5) Manticore's Mane
- Resource: QCFMANE.ITM
- Uses OHLEAT51.ITM as its base when that resource exists, exactly as requested.
- Adds +20% Fire Resistance and +20% Cold Resistance while equipped.
- If OHLEAT51 is absent, LEAT01 is used only as a compatibility fallback so the standalone component can still install.

6) Wild magic
- QCCFIR now has its own QCCFIR.BCS area script.
- It reproduces the exact mechanism used by Shades of the Sword Coast in Firewine Bridge (AR4500):
    ApplySpell(Player1,WILD_MAGIC_AREA)
    SetGlobalTimer("WildmagicTimer","QCCFIR",14)
- This turns the custom dungeon into the same style of wild-magic area as Lava's Firewine implementation.

Testing priorities:
- Confirm the blue circle is visible and clickable at 1302,451 while no proxy sprite is visible.
- Run both initial Manticore replies and companion interjections.
- Test mercy-kill: 1200 XP, Manticore's Hide appears, circle disappears permanently.
- Test spare, click again, then kill/spare follow-up.
- Cast spells in QCCFIR and verify wild-magic behavior.
- Take the Hide to Taerom; test both sale and 5000-gold/3-day crafting paths.
- Confirm Manticore's Mane uses the expected OHLEAT51 base on the target install and grants +20 Fire / +20 Cold resistance.


v1.19: Lara auto-dialogue now uses the proven Range(Player1,20) local-guard pattern. Added BG5201 map note "Lower Level" at X=55,Y=872.


v1.20: Lara auto-dialogue fix: BG5201 actor now explicitly assigns QCFLARS as its ARE override script (fj_bcs_override), matching the proven Sandrine actor pattern. Lara now sees Player1, approaches, speaks via StartDialogueNoSet, then leaves.

v1.21 Lara dialogue-call fix:
- Preserves the confirmed-working v1.20 ARE-level QCFLARS override assignment and approach behavior.
- Replaces StartDialogueNoSet(Player1) with explicit StartDialog("QCFLARA",Player1), so Lara does not depend on implicit CRE dialogue binding.


v1.22: Lara dialogue entry-state fix. The first QCFLARA state now has a real LOCALS trigger matching her AI state, following the confirmed-working Sandrine/Kira pattern. No other gameplay content changed.


v1.24 FINAL — low-occlusion validation:
- QCCFIRSR.BMP already uses only terrain 4 (walkable) and terrain 8 (blocked but see-through).
- There are no terrain-0 opaque blockers in QCCFIRSR.BMP.
- QCCFIR.WED contains zero wall/cover polygons.
- Therefore QCCFIR is already at the intended low-occlusion setup for its narrow corridors while preserving collision.
- No QCCFIR gameplay, graphics, collision, dialogue, creature, trap, loot, music, ambience, transition, or item resource was changed from the confirmed-working v1.23 baseline.


v1.25 occlusion test:
- Preserves the v1.24 light-blocking search-map treatment.
- Adds 23 shallow WED wall polygons along south/front-facing corridor and room-wall boundaries.
- QCCFIR.WED previously contained zero wall polygons, so sprite/wall covering could not occur.
- No gameplay, dialogue, music, transitions, encounters, containers, traps, loot, or area graphics changed.


v1.26 stronger corridor occlusion test:
- Keeps the v1.25 wall polygon geometry unchanged.
- Changes all 23 QCCFIR wall polygon flags from 0x01 (shade wall) to 0x0D (shade wall + both cover-animation flags).
- Intended to make actors/enemies become fully covered by the narrow corridor walls sooner, reducing visibility without expanding polygons over walkable floor.
- All gameplay/content from v1.25 is unchanged.

v1.27 final occlusion tighten:
- Preserves the successful v1.26 WED wall flags and 23 wall polygons.
- Extends only the south/walkable edge of each existing wall polygon by 6 pixels for a small additional reduction in corridor visibility.
- No gameplay, dialogue, transition, music, creature, trap, loot, or area-script changes.


v1.28 super-low corridor occlusion:
- Preserves the v1.26 stronger wall/cover flags and all v1.27 gameplay/content.
- Extends the lower edge of all 23 QCCFIR wall polygons by a further 24 pixels.
- Wall occlusion strips are now 64 pixels deep (up from 40 in v1.27) for very aggressive visibility limiting in narrow halls.


v1.30 ultra-low visual-range action fix:
- Corrects the v1.29 install failure: SetVisualRange() is not a BGEE/EET ACTION.IDS action.
- Uses the EE-supported ChangeStat(Object,VISUALRANGE,Value,SET) action instead.
- QCCFIR sets party VISUALRANGE to 2 while inside the dungeon.
- BG5201 restores VISUALRANGE to the standard 14 after returning through the stairs.
- Preserves the aggressive v1.28 WED wall/cover occlusion and all finished gameplay/content.


v1.31 visibility fix
--------------------
Replaces the ineffective ChangeStat(VISUALRANGE) experiment with the engine-supported opcode 262 visual-range effect. QCFLOWV.SPL sets visual range flat to 2 for 3 seconds and QCCFIR.BCS reapplies it once per second only while the party is in QCCFIR. The effect expires after leaving. A one-time UndoExplore() resets fog in existing test saves so previously over-revealed rooms do not mask the change. The v1.28 strong WED wall occlusion remains unchanged.


v1.32 visibility fix:
- Removed the 3-second/reapply cycle that caused the fog radius to pulse.
- QCFIR now applies VISUALRANGE 1 once on entry via opcode 262.
- The effect is long-lived and never refreshed while inside the dungeon.
- Returning to BG5201 applies QCFVRES (opcode 321), which removes the QCFLOWV effect immediately.
- QCCFIR WED occlusion remains the strong v1.28 geometry.

v1.33 visibility tuning:
- Keeps the stable one-time opcode 262 setup from v1.32; there is still no periodic refresh or pulsing.
- Raises QCFIR visual range only from 1 to 2, giving a slightly larger visible area while preserving very tight corridor visibility.
- Includes a one-time migration block so saves already tested under v1.32 have the old range-1 effect removed and replaced with the new range-2 effect immediately.
- Strong v1.28 WED wall occlusion and all finished gameplay/content remain unchanged.


v1.34 visibility tuning:
- Keeps the stable one-time opcode 262 setup; no periodic refresh or pulsing.
- Raises QCCFIR visual range from 2 to 4 so the party can see a useful stretch of corridor ahead while retaining strongly limited room visibility.
- Adds a one-time migration that removes the old range-1/range-2 effect from existing test saves and immediately applies range 4.
- Strong v1.28 WED wall occlusion and all finished gameplay/content remain unchanged.


v1.35 visibility tuning:
- Keeps the stable one-time opcode 262 setup; no periodic refresh or pulsing.
- Raises QCCFIR visual range from 4 to 5 for a modest increase in forward corridor visibility.
- Adds a one-time migration that removes the old range-4 effect from existing test saves and immediately applies range 5.
- Strong v1.28 WED wall occlusion and all finished gameplay/content remain unchanged.


v1.36 visibility tuning:
- Keeps the stable one-time opcode 262 setup; no periodic refresh or pulsing.
- Raises QCCFIR visual range from 5 to 7 as requested.
- Adds a one-time migration that removes the old range-5 effect from existing test saves and immediately applies range 7.
- Strong v1.28 WED wall occlusion and all finished gameplay/content remain unchanged.


v1.37 visibility tuning:
- Keeps the stable one-time opcode 262 setup; no periodic refresh or pulsing.
- Raises QCCFIR visual range from 7 to 8 as requested.
- Adds a one-time migration that removes the old range-7 effect from existing test saves and immediately applies range 8.
- Strong v1.28 WED wall occlusion and all finished gameplay/content remain unchanged.
