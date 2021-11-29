*&---------------------------------------------------------------------*
*& Report  ZMP_CUKY_TEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_CUKY_TEST.

data rv_result type wdy_boolean.

    call function 'CMS_API_GENERAL_CURRENCY_CHECK'
      exporting
        i_waers                = 'EERUR'
     EXCEPTIONS
       INVALID_CURRENCY       = 1
       OTHERS                 = 2
              .
    if sy-subrc = 1.
      rv_result = abap_false.
    elseif sy-subrc = 0.
      rv_result = abap_true.
      else.
       rv_result = abap_false.
    endif.

    write rv_result.
