class ZMP_CL_MITARBEITER_ASSI definition
  public
  inheriting from CL_WD_COMPONENT_ASSISTANCE
  create public .

public section.

  methods GET_MA_LIST
    returning
      value(RT_LIST) type ZMP_TABELLENTYP_MITARBEITER .
  methods CHECK_NAME
    importing
      !IV_NAME type ZMP_DE_NAME
    returning
      value(RV_VALID) type BOOLEAN .
  methods CHECK_CURR
    importing
      !IV_CURR type WAERS_CURC
    returning
      value(RV_VALID) type BOOLEAN .
protected section.
private section.
ENDCLASS.



CLASS ZMP_CL_MITARBEITER_ASSI IMPLEMENTATION.


  METHOD check_curr.
    Data ls_wa TYPE tcurc.
    SELECT SINGLE * FROM tcurc into ls_wa WHERE waers = iv_curr.

    IF sy-subrc = 0.
      rv_valid = abap_true.
    ELSE.
      rv_valid = abap_false.
    ENDIF.
  ENDMETHOD.


  method CHECK_NAME.
    IF NOT iv_name is INITIAL.
      rv_valid = abap_true.
    ENDIF.

  endmethod.


  method GET_MA_LIST.
    SELECT * FROM zmp_mitarbeiter INTO TABLE rt_list.
  endmethod.
ENDCLASS.
