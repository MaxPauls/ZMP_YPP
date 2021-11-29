*----------------------------------------------------------------------*
***INCLUDE ZMP_SUBS_STATUS_0100O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
SET PF-STATUS '0100'.
*  SET TITLEBAR 'xxx'.
  CASE zmp_tabstrip-activetab.
    WHEN 'FC1'.
      dynnr = '0101'.
    WHEN 'FC2'.
      dynnr = '0102'.
    WHEN OTHERS.
      dynnr = '0101'.
      zmp_tabstrip-activetab = 'FC1'.
  ENDCASE.
  scustom = gv_wa.
ENDMODULE.                 " STATUS_0100  OUTPUT
