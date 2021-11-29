*&---------------------------------------------------------------------*
*& Report  ZMP_FORM1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_form1.


DATA fm_name TYPE rs38l_fnam.

CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname = 'ZMP_FORM1'
*   VARIANT  = ' '
*   DIRECT_CALL              = ' '
  IMPORTING
    fm_name  = fm_name
* EXCEPTIONS
*   NO_FORM  = 1
*   NO_FUNCTION_MODULE       = 2
*   OTHERS   = 3
  .


CALL FUNCTION fm_name.
