// v68. Direct worldmap reveal after General Sovalidaas's first greeting.
// This runs in his existing dialogue transition, not only BALDUR.BCS.
// No existing dialogue text, branches or creature resources are modified.
ADD_TRANS_ACTION ~%qcug_soval_file%~ BEGIN %qcug_soval_state% END BEGIN END
  ~SetGlobal("QCUGSovalMet","GLOBAL",1)
   SetGlobal("QCUGMapShown","GLOBAL",1)
   RevealAreaOnMap("QCCGRV")
   AddWorldmapAreaFlag("QCCGRV",VISIBLE)
   AddWorldmapAreaFlag("QCCGRV",ENABLED)
   AddWorldmapAreaFlag("QCCGRV",EXPLORABLE)~
