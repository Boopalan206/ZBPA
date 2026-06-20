*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZBS_DEMO_PARTNER................................*
DATA:  BEGIN OF STATUS_ZBS_DEMO_PARTNER              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZBS_DEMO_PARTNER              .
CONTROLS: TCTRL_ZBS_DEMO_PARTNER
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZEXECUTION_LOG2.................................*
DATA:  BEGIN OF STATUS_ZEXECUTION_LOG2               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEXECUTION_LOG2               .
CONTROLS: TCTRL_ZEXECUTION_LOG2
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZBS_DEMO_PARTNER              .
TABLES: *ZEXECUTION_LOG2               .
TABLES: ZBS_DEMO_PARTNER               .
TABLES: ZEXECUTION_LOG2                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
