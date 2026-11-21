// QCTHIEF state 1 is ACCUSE. QCTHIEF.DLG is compiled immediately before this
// file, so INTERJECT_COPY_TRANS patches that existing state without adding a
// free-standing selectable state to Kivan's normal dialogue flow.
INTERJECT_COPY_TRANS QCTHIEF 1 QCThKivInt
  == KIVANJ IF ~IsValidForPartyDialog("Kivan")~ THEN @1
END
