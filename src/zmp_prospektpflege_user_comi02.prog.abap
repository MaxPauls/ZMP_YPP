*----------------------------------------------------------------------*
***INCLUDE ZMP_PROSPEKTPFLEGE_USER_COMI02.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0104  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0104 INPUT.
  CASE gv_okcode.
    WHEN 'ANL4'.
      MODIFY zmp_t_prosp FROM zmp_t_prosp.
      Message s005.
      LEAVE TO SCREEN 102.
    WHEN 'BACK'.
      LEAVE TO SCREEN 102.

  ENDCASE.
ENDMODULE.                 " USER_COMMAND_0104  INPUT
