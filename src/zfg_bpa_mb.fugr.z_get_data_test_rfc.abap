FUNCTION z_get_data_test_rfc.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_DOCUMENT_NUMBER) TYPE  EDIDC-DOCNUM
*"     VALUE(IT_IDOC_DATA) TYPE  EDIDD_TT
*"  EXPORTING
*"     VALUE(EV_RESULT) TYPE  STRING
*"----------------------------------------------------------------------

  DATA : lt_idoc_data   TYPE TABLE OF edidd,
         lt_idoc_status TYPE TABLE OF edi_ds40.

  CALL FUNCTION 'EDI_DOCUMENT_OPEN_FOR_EDIT'
    EXPORTING
      document_number               = iv_document_number
    TABLES
      idoc_data                     = lt_idoc_data
    EXCEPTIONS
      document_foreign_lock         = 1
      document_not_exist            = 2
      document_not_open             = 3
      status_is_unable_for_changing = 4
      OTHERS                        = 5.

  IF sy-subrc <> 0.

    CASE sy-subrc.
      WHEN 1.
        ev_result = |IDOC { iv_document_number } is on foreign lock|.
      WHEN 2.
        ev_result = |IDOC { iv_document_number } does not exist|.
      WHEN 3.
        ev_result = |IDOC { iv_document_number } is on not opened|.
      WHEN 4.
        ev_result = |IDOC { iv_document_number } is unable for changing|.
      WHEN OTHERS.
        ev_result = |IDOC { iv_document_number } cannot be opened|.
    ENDCASE.

  ELSEIF sy-subrc = 0.

    CALL FUNCTION 'EDI_CHANGE_DATA_SEGMENTS'
      TABLES
        idoc_changed_data_range = lt_idoc_data
      EXCEPTIONS
        idoc_not_open           = 1
        data_record_not_exist   = 2
        OTHERS                  = 3.

    IF sy-subrc <> 0.

      CASE sy-subrc.
        WHEN 1.
          ev_result = |IDOC { iv_document_number } not opened|.
        WHEN 2.
          ev_result = |IDOC { iv_document_number } data record does not exist|.
        WHEN OTHERS.
          ev_result = |IDOC { iv_document_number } cannot be changed|.
      ENDCASE.

    ELSEIF sy-subrc = 0.

      CALL FUNCTION 'EDI_DOCUMENT_CLOSE_EDIT'
        EXPORTING
          document_number = iv_document_number
        TABLES
          status_records  = lt_idoc_status
        EXCEPTIONS
          idoc_not_open   = 1
          db_error        = 2
          OTHERS          = 3.

      IF sy-subrc <> 0.

        CASE sy-subrc.
          WHEN 1.
            ev_result = |IDOC { iv_document_number } not opened|.
          WHEN 2.
            ev_result = |IDOC { iv_document_number } has db error|.
          WHEN OTHERS.
            ev_result = |IDOC { iv_document_number } cannot be closed|.
        ENDCASE.

      ENDIF.

    ENDIF.

    ev_result = | IDOC { iv_document_number } edited successfully |.

  ENDIF.

ENDFUNCTION.
