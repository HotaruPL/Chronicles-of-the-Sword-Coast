Bag of Holding in Candlekeep v1.0
==================================

A deliberately tiny Better Immersion / QC component.

What it does
------------
Adds a Bag of Holding to the existing container in BG2617 nearest the requested
X=132, Y=280 position. In the supplied BG2617.ARE this is "Container 1" at
X=119, Y=300.

Implementation
--------------
- Does NOT replace BG2617.ARE, BG2617.WED, or BG2617.BCS.
- Patches the existing BG2617.ARE with WeiDU.
- Clones the standard BAG31 Bag of Holding as QC-prefixed resources:
    QCBAGH.ITM
    QCBAGH.STO
  so the bag has its own independent storage resource.
- Adds QCBAGH to container index 0 (Container 1) in BG2617.
- No other area content is changed.

Supported games: BGEE and EET.
