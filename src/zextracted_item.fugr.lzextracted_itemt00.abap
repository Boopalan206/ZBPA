*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEXTRACTED_ITEM.................................*
DATA:  BEGIN OF STATUS_ZEXTRACTED_ITEM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEXTRACTED_ITEM               .
CONTROLS: TCTRL_ZEXTRACTED_ITEM
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEXTRACTED_ITEM               .
TABLES: ZEXTRACTED_ITEM                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
