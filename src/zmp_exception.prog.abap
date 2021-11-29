*&---------------------------------------------------------------------*
*& Report  ZMP_EXCEPTION
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_exception.

DATA: gs_wa TYPE spfli,
      cx_failor TYPE REF TO zcx_zmp_exception.

TRY.
    WRITE: / 'Erster Try Block:'.
    zmp_cl_flinfo=>get_connection(
      EXPORTING
        iv_carrid     = 'LH'
        iv_connid     = 400
      RECEIVING
        rv_connection = gs_wa ).

    WRITE: / gs_wa-cityfrom , gs_wa-cityto.
  CATCH zcx_zmp_exception INTO cx_failor.
    WRITE / cx_failor->get_text( ).

ENDTRY.

SKIP.
ULINE (30).

TRY.
    WRITE: / 'Zweiter Try Block:'.
    zmp_cl_flinfo=>get_connection(
      EXPORTING
        iv_carrid     = 'LH'
        iv_connid     = 0001
      RECEIVING
        rv_connection = gs_wa ).

    WRITE: / gs_wa-cityfrom , gs_wa-cityto.
  CATCH zcx_zmp_exception INTO cx_failor.
    WRITE / cx_failor->get_text( ).

ENDTRY.
