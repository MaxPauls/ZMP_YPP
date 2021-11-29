*&---------------------------------------------------------------------*
*& Report  ZMP_NKTEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_nktest.

DATA gv_nr TYPE i.

CALL FUNCTION 'NUMBER_GET_NEXT'
  EXPORTING
    nr_range_nr = '1'
    object      = 'zmp_nk'
*   QUANTITY    = '1'
*   SUBOBJECT   = ' '
*   TOYEAR      = '0000'
*   IGNORE_BUFFER                 = ' '
 IMPORTING
    number      = gv_nr.
*   QUANTITY    =
*   RETURNCODE  =
* EXCEPTIONS
*   INTERVAL_NOT_FOUND            = 1
*   NUMBER_RANGE_NOT_INTERN       = 2
*   OBJECT_NOT_FOUND              = 3
*   QUANTITY_IS_0                 = 4
*   QUANTITY_IS_NOT_1             = 5
*   INTERVAL_OVERFLOW             = 6
*   BUFFER_OVERFLOW               = 7
*   OTHERS      = 8

IF sy-subrc <> 0.

ENDIF.

WRITE: 'Nummer', gv_nr, 'wurde geliefert'.
