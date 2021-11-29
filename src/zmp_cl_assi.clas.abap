class ZMP_CL_ASSI definition
  public
  inheriting from CL_WD_COMPONENT_ASSISTANCE
  create public .

public section.

  methods CHECK
    importing
      value(IV_CARRID) type S_CARR_ID
      value(IV_CONNID) type S_CONN_ID
    returning
      value(RV_RESULT) type BOOLEAN .
  methods GET_MA_LIST
    returning
      value(RT_LIST) type ZMP_TABELLENTYP_MITARBEITER .
protected section.
private section.
ENDCLASS.



CLASS ZMP_CL_ASSI IMPLEMENTATION.


  method CHECK.
  endmethod.


  METHOD get_ma_list.
    SELECT * FROM zmp_mitarbeiter INTO TABLE rt_list.
  ENDMETHOD.
ENDCLASS.
