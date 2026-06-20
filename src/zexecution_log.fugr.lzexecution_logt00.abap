*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEXECUTION_LOG1.................................*
DATA:  BEGIN OF STATUS_ZEXECUTION_LOG1               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEXECUTION_LOG1               .
*.........table declarations:.................................*
TABLES: *ZEXECUTION_LOG1               .
TABLES: ZEXECUTION_LOG1                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
