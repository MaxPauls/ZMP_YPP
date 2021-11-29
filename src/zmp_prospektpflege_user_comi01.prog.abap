*----------------------------------------------------------------------*
***INCLUDE ZMP_PROSPEKTPFLEGE_USER_COMI01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0102  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0102 INPUT.

  CASE gv_okcode.
    WHEN 'LOESCH'.
      SELECT SINGLE * FROM zmp_t_prosp INTO zmp_t_prosp
        WHERE prospid = zmp_t_prosp-prospid.
      IF sy-subrc = 0.
        DELETE zmp_t_prosp FROM zmp_t_prosp.
        MESSAGE s004.
      ENDIF.
      CLEAR zmp_t_prosp.
      LEAVE TO SCREEN 102.
    WHEN 'AEND'.
      SELECT SINGLE * FROM zmp_t_prosp INTO zmp_t_prosp
        WHERE prospid = zmp_t_prosp-prospid.
      IF sy-subrc = 0.
        MESSAGE s001.
        LEAVE TO SCREEN 106.
      ENDIF.
      LEAVE TO SCREEN 102.
    WHEN 'ANL'.
      LEAVE TO SCREEN 104.
    WHEN 'BACK'.
      LEAVE PROGRAM.

  ENDCASE.

ENDMODULE.                 " USER_COMMAND_0102  INPUT
