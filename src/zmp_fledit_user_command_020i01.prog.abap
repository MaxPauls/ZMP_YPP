*----------------------------------------------------------------------*
***INCLUDE ZMP_FLEDIT_USER_COMMAND_020I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.
  CASE gv_ok_code.

    WHEN 'SAVE'.
      CALL FUNCTION 'ENQUEUE_EZ_SPFLI'
       EXPORTING
         MODE_SPFLI           = 'E'
         MANDT                = SY-MANDT
         CARRID               = spfli-carrid
         CONNID               = spfli-connid
*         X_CARRID             = ' '
*         X_CONNID             = ' '
*         _SCOPE               = '2'
*         _WAIT                = ' '
*         _COLLECT             = ' '
*       EXCEPTIONS
*         FOREIGN_LOCK         = 1
*         SYSTEM_FAILURE       = 2
*         OTHERS               = 3
                .
      IF sy-subrc <> 0.
        MESSAGE e009.
      ENDIF.



      IF spfli <> gv_wa.
        MODIFY spfli from spfli.
      ENDIF.

      CALL FUNCTION 'DEQUEUE_EZ_SPFLI'
       EXPORTING
         MODE_SPFLI       = 'E'
         MANDT            = SY-MANDT
         CARRID           = spfli-carrid
         CONNID           = spfli-connid
*         X_CARRID         = ' '
*         X_CONNID         = ' '
*         _SCOPE           = '3'
*         _SYNCHRON        = ' '
*         _COLLECT         = ' '
        .

      CALL FUNCTION 'DEQUEUE_EZ_SPFLI'
       EXPORTING
         MODE_SPFLI       = 'S'
         MANDT            = SY-MANDT
         CARRID           = spfli-carrid
         CONNID           = spfli-connid
*         X_CARRID         = ' '
*         X_CONNID         = ' '
*         _SCOPE           = '3'
*         _SYNCHRON        = ' '
*         _COLLECT         = ' '
                .

    WHEN 'BACK'.
      CALL FUNCTION 'DEQUEUE_EZ_SPFLI'
       EXPORTING
         MODE_SPFLI       = 'S'
         MANDT            = SY-MANDT
         CARRID           = spfli-carrid
         CONNID           = spfli-connid
*         X_CARRID         = ' '
*         X_CONNID         = ' '
*         _SCOPE           = '3'
*         _SYNCHRON        = ' '
*         _COLLECT         = ' '
                .

      RETURN.
    WHEN 'LEAVE'.
      LEAVE PROGRAM.
  ENDCASE.
  CLEAR gv_ok_code.
ENDMODULE.                 " USER_COMMAND_0200  INPUT
