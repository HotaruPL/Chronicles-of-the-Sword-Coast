// Taerom crafting integration for Manticore's Hide.
// Mirror the proven SotSC attachment points so the option appears from Taerom's
// normal shop/forge dialogue states without replacing his original dialogue.

EXTEND_BOTTOM ~TAEROM~ 4
  IF ~PartyHasItem("QCFMHIDE") Global("QCFManeCraft","GLOBAL",0)~ THEN REPLY @1 EXTERN TAEROM QCF_MANT_HIDE
  IF ~Global("QCFManeCraft","GLOBAL",1) GlobalTimerExpired("QCFManeTime","GLOBAL")~ THEN REPLY @2 EXTERN TAEROM QCF_MANT_DONE
END

EXTEND_BOTTOM ~TAEROM~ 8
  IF ~PartyHasItem("QCFMHIDE") Global("QCFManeCraft","GLOBAL",0)~ THEN REPLY @3 EXTERN TAEROM QCF_MANT_HIDE
  IF ~Global("QCFManeCraft","GLOBAL",1) GlobalTimerExpired("QCFManeTime","GLOBAL")~ THEN REPLY @4 EXTERN TAEROM QCF_MANT_DONE
END

EXTEND_BOTTOM ~TAEROM~ 12
  IF ~PartyHasItem("QCFMHIDE") Global("QCFManeCraft","GLOBAL",0)~ THEN REPLY @5 EXTERN TAEROM QCF_MANT_HIDE
  IF ~Global("QCFManeCraft","GLOBAL",1) GlobalTimerExpired("QCFManeTime","GLOBAL")~ THEN REPLY @6 EXTERN TAEROM QCF_MANT_DONE
END

EXTEND_BOTTOM ~TAEROM~ 0
  IF ~PartyHasItem("QCFMHIDE") Global("QCFManeCraft","GLOBAL",0)~ THEN REPLY @7 EXTERN TAEROM QCF_MANT_HIDE
  IF ~Global("QCFManeCraft","GLOBAL",1) GlobalTimerExpired("QCFManeTime","GLOBAL")~ THEN REPLY @8 EXTERN TAEROM QCF_MANT_DONE
END

EXTEND_BOTTOM ~TAEROM~ 14
  IF ~PartyHasItem("QCFMHIDE") Global("QCFManeCraft","GLOBAL",0)~ THEN REPLY @9 EXTERN TAEROM QCF_MANT_HIDE
  IF ~Global("QCFManeCraft","GLOBAL",1) GlobalTimerExpired("QCFManeTime","GLOBAL")~ THEN REPLY @10 EXTERN TAEROM QCF_MANT_DONE
END

CHAIN TAEROM QCF_MANT_HIDE
@11
END
  IF ~PartyGoldGT(4999)~ THEN REPLY @12 DO ~SetGlobalTimer("QCFManeTime","GLOBAL",THREE_DAYS) SetGlobal("QCFManeCraft","GLOBAL",1) TakePartyItem("QCFMHIDE") DestroyItem("QCFMHIDE") TakePartyGold(5000) DestroyGold(5000)~ EXIT
  IF ~~ THEN REPLY @13 DO ~TakePartyItem("QCFMHIDE") DestroyItem("QCFMHIDE") GiveGoldForce(5000) SetGlobal("QCFManeCraft","GLOBAL",3)~ EXIT

CHAIN TAEROM QCF_MANT_DONE
@14
DO ~GiveItemCreate("QCFMANE",Player1,1,0,0) SetGlobal("QCFManeCraft","GLOBAL",2)~
EXIT
