class ZMP_CL_WAEHRUNG_ASSI definition
  public
  inheriting from CL_WD_COMPONENT_ASSISTANCE
  create public .

public section.

  methods CHECK_WAEHRUNG
    importing
      !IV_WAEHRUNG type ZMP_DE_CUKY
    returning
      value(RV_RESULT) type WDY_BOOLEAN .
protected section.
private section.
ENDCLASS.



CLASS ZMP_CL_WAEHRUNG_ASSI IMPLEMENTATION.


  method check_waehrung.

    if iv_waehrung = ''.
      rv_result = abap_false.
      return.
      endif.

    call function 'CMS_API_GENERAL_CURRENCY_CHECK'
      exporting
        i_waers          = iv_waehrung
      exceptions
        invalid_currency = 1
        others           = 2.

    if sy-subrc = 0.
      rv_result = abap_true.
    else.
      rv_result = abap_false.
    endif.
  endmethod.
ENDCLASS.
