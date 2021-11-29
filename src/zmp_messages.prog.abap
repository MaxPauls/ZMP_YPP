*&---------------------------------------------------------------------*
*& Report  ZMP_MESSAGES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_MESSAGES.

DATA gt_user TYPE TABLE OF syst_uname.

FIELD-SYMBOLS <gv_user> TYPE syst_uname.

APPEND 'POSTLER' TO gt_user.

LOOP AT gt_user ASSIGNING <gv_user>.
  CALL FUNCTION 'TH_POPUP'
    EXPORTING
      client         = '800'
      user           = <gv_user>
      message        = 'Hände hoch, das ist ein Überfall!'
      message_len    = 200
*     CUT_BLANKS     = ' '
    EXCEPTIONS
      user_not_found = 1
      OTHERS         = 2.



  IF sy-subrc <> 0.

    WRITE: /, <gv_user>, '... nicht geklappt'.

  ENDIF.

ENDLOOP.
