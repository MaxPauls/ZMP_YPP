*----------------------------------------------------------------------*
***INCLUDE ZMP_PROSPEKTPFLEGE_USER_COMI03.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0106  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0106 INPUT.
  CASE gv_okcode.
    WHEN 'SPEI'.
      MODIFY zmp_t_prosp FROM zmp_t_prosp.
      Message s002.
      LEAVE TO SCREEN 102.
    WHEN 'BACK'.
      LEAVE TO SCREEN 102.
    WHEN 'ANGANL'.
      zmp_t_angebot-prospid = zmp_t_prosp-prospid.
      LEAVE TO SCREEN 200.
  ENDCASE.
ENDMODULE.                 " USER_COMMAND_0106  INPUT
