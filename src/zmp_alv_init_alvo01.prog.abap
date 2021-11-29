*----------------------------------------------------------------------*
***INCLUDE ZMP_ALV_INIT_ALVO01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  INIT_ALV  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE init_alv OUTPUT.
  CREATE OBJECT gr_container EXPORTING container_name = 'FELDNAME'.
  CREATE OBJECT gr_alv EXPORTING i_parent = gr_container.

  SELECT * FROM scarr INTO TABLE gt_scarr.

  data: variant type disvariant.     "<----  Here

  variant-report = sy-repid.           "<----  Here
  variant-username  = sy-uname.  "<----  Here

*  gr_alv->set_table_for_first_display( EXPORTING i_structure_name = 'SCARR'
*                                       CHANGING  it_outtab = gt_scarr ).

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
   I_STRUCTURE_NAME                  = 'SCARR'
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT                         =
*   IT_FIELDCAT                       =
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT                           =
*   IT_FILTER                         =
*   IS_SEL_HIDE                       =
*   I_DEFAULT                         = 'X'
   I_SAVE                            = 'A'
   IS_VARIANT                        = variant
*   IT_EVENTS                         =
*   IT_EVENT_EXIT                     =
*   IS_PRINT                          =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab                          = gt_scarr
* EXCEPTIONS
*   PROGRAM_ERROR                     = 1
*   OTHERS                            = 2
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


ENDMODULE.                 " INIT_ALV  OUTPUT
