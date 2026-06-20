*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEXTRACTED_DATA.................................*
DATA:  BEGIN OF STATUS_ZEXTRACTED_DATA               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEXTRACTED_DATA               .
CONTROLS: TCTRL_ZEXTRACTED_DATA
            TYPE TABLEVIEW USING SCREEN '0003'.
*.........table declarations:.................................*
TABLES: *ZEXTRACTED_DATA               .
TABLES: ZEXTRACTED_DATA                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
