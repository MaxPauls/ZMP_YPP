*&---------------------------------------------------------------------*
*& Report  ZMP_FORM2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_form2.

DATA: lt_mytable TYPE TABLE OF zmp_s_position,
      ls_mytable TYPE zmp_s_position,
      ls_adress TYPE adrc.
DATA fm_name TYPE rs38l_fnam.


SELECT tknum tpnum vttp~vbeln pstyv arktx
  FROM vttp JOIN lips ON lips~vbeln = vttp~vbeln
  INTO TABLE lt_mytable
  WHERE vttp~tknum = '0000001275'.

SELECT SINGLE * FROM adrc INTO ls_adress WHERE addrnumber = '0000001929'.



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

CALL FUNCTION '/1BCDWB/SF00000657'
  EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
    iv_addr  = ls_adress-addrnumber
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
  TABLES
    it_table = lt_mytable
* EXCEPTIONS
*   FORMATTING_ERROR           = 1
*   INTERNAL_ERROR             = 2
*   SEND_ERROR                 = 3
*   USER_CANCELED              = 4
*   OTHERS   = 5
  .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


CHECK 1 = 1.
