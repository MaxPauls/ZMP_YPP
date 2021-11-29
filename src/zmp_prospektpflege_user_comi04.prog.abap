*----------------------------------------------------------------------*
***INCLUDE ZMP_PROSPEKTPFLEGE_USER_COMI04.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  CASE gv_okcode.
    WHEN 'BACK'.
      LEAVE TO SCREEN 104.
    WHEN 'SPANG'.
      modify zmp_t_angebot from zmp_t_angebot.
      Message s003.
      LEAVE TO SCREEN 106.
  ENDCASE.
ENDMODULE.                 " USER_COMMAND_0200  INPUT
