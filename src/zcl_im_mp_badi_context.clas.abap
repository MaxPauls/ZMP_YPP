class ZCL_IM_MP_BADI_CONTEXT definition
  public
  final
  create public .

public section.

  interfaces IF_EX_WB_OBJ_CTMENU .
protected section.
private section.
ENDCLASS.



CLASS ZCL_IM_MP_BADI_CONTEXT IMPLEMENTATION.


  METHOD if_ex_wb_obj_ctmenu~update_context_menu.
    IF sy-uname = 'POSTLER'.
      p_context_menu->clear( ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
