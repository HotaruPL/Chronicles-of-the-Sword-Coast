Bag of Holding in Irenicus Dungeon v1.0
========================================

A deliberately tiny Better Immersion / QC component.

What it does
------------
Adds a Bag of Holding to the existing container in AR0602 nearest the requested
X=3083, Y=2863 position. In the supplied AR0602.ARE this is "Jailkeep Table"
at X=3109, Y=2829.

Implementation
--------------
- Does NOT replace AR0602.ARE or AR0602.BCS.
- Patches the existing AR0602.ARE with WeiDU.
- Clones the standard BAG31 Bag of Holding as QC-prefixed resources:
    QCBAGI.ITM
    QCBAGI.STO
  so this bag has its own independent storage resource and does not share the
  Candlekeep component's QCBAGH store.
- Adds QCBAGI to container index 37 (Jailkeep Table) in AR0602.
- No other area content is changed.

Supported games: BG2EE and EET.
