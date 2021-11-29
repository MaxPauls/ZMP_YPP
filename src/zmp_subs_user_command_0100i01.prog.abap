*----------------------------------------------------------------------*
***INCLUDE ZMP_SUBS_USER_COMMAND_0100I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE gv_ok_code.
    WHEN 'BACK'.
      LEAVE PROGRAM.
    WHEN 'FC1' OR 'FC2'.
      zmp_tabstrip-activetab = gv_ok_code.
    WHEN 'ANZ' OR 'ENTER'.
      Select single * from scustom into gv_wa
        where id = scustom-id.
*      scustom = gv_wa.

  ENDCASE.
  clear gv_ok_code.
ENDMODULE.                 " USER_COMMAND_0100  INPUT
