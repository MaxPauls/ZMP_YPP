*----------------------------------------------------------------------*
***INCLUDE ZMP_FLEDIT_USER_COMMAND_010I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE gv_ok_code.

    WHEN 'SELECT' OR 'ENTER'.
      CALL FUNCTION 'ENQUEUE_EZ_SPFLI'
       EXPORTING
         MODE_SPFLI           = 'S'
         MANDT                = SY-MANDT
         CARRID               = spfli-carrid
         CONNID               = spfli-connid
         X_CARRID             = ' '
         X_CONNID             = ' '
*         _SCOPE               = '2'
*         _WAIT                = ' '
*         _COLLECT             = ' '
       EXCEPTIONS
         FOREIGN_LOCK         = 1
         SYSTEM_FAILURE       = 2
         OTHERS               = 3
                .
      IF sy-subrc <> 0.
        MESSAGE e009.
      ENDIF.

      SELECT SINGLE * FROM spfli INTO gv_wa
        WHERE carrid = spfli-carrid
        AND connid = spfli-connid.
      IF sy-subrc <> 0.
        "Keine Verbindung gefunden
        MESSAGE e005 with spfli-carrid spfli-connid.
      ENDIF.
      MESSAGE s006 with spfli-carrid spfli-connid.
    WHEN 'BACK'.
      LEAVE PROGRAM.
  ENDCASE.
  CLEAR gv_ok_code.
ENDMODULE.                 " USER_COMMAND_0100  INPUT
