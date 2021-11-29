class ZCL_IM_MP_BADI_KONTEXTMENU definition
  public
  final
  create public .

public section.

  interfaces IF_EX_WB_OBJ_CTMENU .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_MP_BADI_KONTEXTMENU IMPLEMENTATION.


  METHOD if_ex_wb_obj_ctmenu~update_context_menu.
    IF sy-uname = 'PAULS'.


    ENDIF.
  ENDMETHOD.
ENDCLASS.
