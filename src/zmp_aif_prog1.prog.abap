*&---------------------------------------------------------------------*
*& Report  ZMP_AIF_PROG1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_aif_prog1.

*ZMP_AIF_UEBUNG1
DATA: lv_fuba TYPE funcname,
      gs_outputparams TYPE sfpoutputparams,
      lt_table TYPE TABLE OF sbook,
      ls_formoutput TYPE fpformoutput,
      gs_docparams TYPE sfpdocparams.


SELECT * FROM sbook INTO TABLE lt_table UP TO 20 ROWS.

CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
  EXPORTING
    i_name     = 'ZMP_AIF_UEBUNG1'
  IMPORTING
    e_funcname = lv_fuba.

gs_outputparams-dest = 'LOCL'.
**gs_outputparams-preview = 'X'.
*gs_outputparams-nodialog = abap_true.
*gs_outputparams-reqimm = abap_false.
*gs_outputparams-reqnew = abap_true.
gs_outputparams-getpdf = 'X'.
gs_outputparams-getxml = 'X'.
CALL FUNCTION 'FP_JOB_OPEN'
  CHANGING
    ie_outputparams = gs_outputparams.



CALL FUNCTION lv_fuba
  EXPORTING
    /1bcdwb/docparams  = gs_docparams
    sbooktabelle       = lt_table
  IMPORTING
    /1bcdwb/formoutput = ls_formoutput.


CALL FUNCTION 'FP_JOB_CLOSE'.
