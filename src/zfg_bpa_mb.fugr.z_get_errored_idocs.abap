FUNCTION z_get_errored_idocs.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(I_DATE_FROM) TYPE  SY-DATUM OPTIONAL
*"     VALUE(I_DATE_TO) TYPE  SY-DATUM OPTIONAL
*"     VALUE(I_IDOCTYP) TYPE  EDIDC-IDOCTP OPTIONAL
*"     VALUE(I_MESTYP) TYPE  EDIDC-MESTYP OPTIONAL
*"     VALUE(I_PARTNER) TYPE  EDIDC-SNDPRN OPTIONAL
*"     VALUE(I_ERR_DESC_FILTER) TYPE  STRING OPTIONAL
*"  TABLES
*"      T_IDOCS TYPE  ZTT_ERRORED_IDOC_RFC
*"  EXCEPTIONS
*"      NO_DATA_FOUND
*"----------------------------------------------------------------------

  " Clear output table
  REFRESH t_idocs.

  " Select IDocs first (RFC compatible way)
  SELECT docnum, idoctp, mestyp, sndprn AS partner, credat, cretim, status
    FROM edidc
    WHERE status = '51' " Errored IDocs
      AND ( credat BETWEEN @i_date_from AND @i_date_to OR
            ( @i_date_from IS INITIAL AND @i_date_to IS INITIAL ) OR
            ( @i_date_from IS NOT INITIAL AND @i_date_to IS INITIAL AND credat >= @i_date_from ) OR
            ( @i_date_from IS INITIAL AND @i_date_to IS NOT INITIAL AND credat <= @i_date_to ) )
      AND ( idoctp = @i_idoctyp OR @i_idoctyp IS INITIAL )
      AND ( mestyp = @i_mestyp OR @i_mestyp IS INITIAL )
      AND ( sndprn = @i_partner OR @i_partner IS INITIAL )
    INTO TABLE @DATA(lt_idocs).

  " If no IDocs found, raise exception
  IF lt_idocs IS INITIAL.
    RAISE no_data_found.
  ENDIF.

  " Process each IDoc
  LOOP AT lt_idocs ASSIGNING FIELD-SYMBOL(<fs_idoc>).
    " Get the latest error message for this IDoc
    " Cannot use ORDER BY with SELECT SINGLE, using TOP 1 instead
    SELECT statxt, stapa1, stapa2, stapa3, stapa4
      FROM edids
      WHERE docnum = @<fs_idoc>-docnum
      ORDER BY logtim DESCENDING
      INTO @DATA(ls_edids)
      UP TO 1 ROWS.
    ENDSELECT.

    " Create output structure
*    DATA(ls_output) = CORRESPONDING LINE OF ZTT_ERRORED_IDOC_RFC( <fs_idoc> ).

    DATA ls_output TYPE zst_errored_idoc_rfc.
    MOVE-CORRESPONDING <fs_idoc> TO ls_output.


    " Set error description
    IF ls_edids-statxt IS NOT INITIAL.
      ls_output-errdescr = ls_edids-statxt.
    ELSE.
      ls_output-errdescr = |{ ls_edids-stapa1 } { ls_edids-stapa2 } { ls_edids-stapa3 } { ls_edids-stapa4 }|.
      CONDENSE ls_output-errdescr.
    ENDIF.

    " Apply error description filter if provided
    IF i_err_desc_filter IS NOT INITIAL.
      IF NOT ls_output-errdescr CS i_err_desc_filter.
        CONTINUE. " Skip this IDoc if error description doesn't match filter
      ENDIF.
    ENDIF.

    " Add to output table
    APPEND ls_output TO t_idocs.
  ENDLOOP.

  " If all IDocs were filtered out, raise exception
  IF t_idocs[] IS INITIAL.
    RAISE no_data_found.
  ENDIF.

ENDFUNCTION.
