*----------------------------------------------------------------------*
***INCLUDE ZMP_PPFLEGE_USER_COMMAND_01I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
module user_command_0100 input.

  data gv_okcode type sy-ucomm.

  case gv_okcode.
    when 'TABP'. " die 1
    when 'TABA'. " die 2
    when 'SELECT' or 'ENTER'.
    when 'BACK'.
      leave program.
      "Programm neu laden?
    when 'LEAVE'.
      leave program.
  endcase.
  clear gv_okcode.

endmodule.                 " USER_COMMAND_0100  INPUT
