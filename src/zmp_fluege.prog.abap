*&---------------------------------------------------------------------*
*& Report  ZMP_FLUEGE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_fluege MESSAGE-ID zmp_messages.

DATA: gt_fluege TYPE TABLE OF spfli,
      gs_wa TYPE spfli.

DATA: gt_flight  TYPE TABLE OF sflight,
          gs_wa2 TYPE sflight.

DATA: gt_fieldcat  TYPE slis_t_fieldcat_alv,
      gs_fieldcatwa  TYPE slis_fieldcat_alv.

TABLES sscrfields.



SELECTION-SCREEN COMMENT /1(30) msg1.
SELECTION-SCREEN ULINE /1(50).
SELECTION-SCREEN SKIP.
PARAMETERS: p_carr TYPE spfli-carrid DEFAULT 'LH'.
SELECTION-SCREEN COMMENT 50(50) msg2.
SELECTION-SCREEN SKIP.

SELECTION-SCREEN PUSHBUTTON /30(30)  btn USER-COMMAND tuwas.



INITIALIZATION.
  msg1 = 'Das ist ausgewählt....'.
  btn = 'Eingabe Löschen'.
  msg2 = 'Bitte nur gültige Werte eingeben'.



AT SELECTION-SCREEN.
  IF sy-ucomm = 'TUWAS'.
    CLEAR p_carr.
  ENDIF.


START-OF-SELECTION.
  IF sy-ucomm = 'BACK'.
    EXIT.
  ENDIF.
*Funktionsbaustein aufrufen, Liste mit Flügen erhalten
  CALL FUNCTION 'Z_ZMP_GET_FLUEGE'
    EXPORTING
      i_carrid  = p_carr
    IMPORTING
      e_liste   = gt_fluege
    EXCEPTIONS
      sql_error = 1
      no_auth   = 2
      OTHERS    = 3.

  IF sy-subrc = 1.
    "SQL Fehler
    MESSAGE e001.
  ELSEIF sy-subrc = 2.
    "Authentifizierung fehlgeschlagen
    MESSAGE e002.
  ELSE.
    MESSAGE s000 WITH p_carr.

    CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
      EXPORTING
        i_internal_tabname     = 'GT_FLUEGE'
        i_structure_name       = 'SPFLI'
      CHANGING
        ct_fieldcat            = gt_fieldcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.
    IF sy-subrc <> 0.
      .
* Implement suitable error handling here.
    ENDIF.

    LOOP AT gt_fieldcat INTO gs_fieldcatwa.
      IF gs_fieldcatwa-key = 'X'.
        gs_fieldcatwa-key = ' '.
      ENDIF.

      IF gs_fieldcatwa-fieldname = 'CARRID' OR
            gs_fieldcatwa-fieldname = 'CONNID'.
        gs_fieldcatwa-emphasize = 'C500'.
      ENDIF.
      MODIFY gt_fieldcat FROM gs_fieldcatwa.
    ENDLOOP.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
*        i_structure_name = 'SPFLI'
        it_fieldcat      = gt_fieldcat
      TABLES
        t_outtab         = gt_fluege
      EXCEPTIONS
        program_error    = 1
        OTHERS           = 2.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.



*    FORMAT COLOR 2.
*    ULINE /(70).
*    WRITE: / '|Verbindung', 15 '|Von', 42 '|Nach', 70'|'.
*    ULINE /(70).
*    FORMAT RESET.
*
*    "Die Einträge der Tabelle darstellen
*    LOOP AT gt_fluege INTO gs_wa.
*      WRITE:  / '|', gs_wa-carrid, gs_wa-connid, 15 '|', gs_wa-countryfr, gs_wa-cityfrom, 42 '|', gs_wa-countryto, gs_wa-cityto, 70'|'.
*      HIDE gs_wa.
*      ULINE /(70).
*    ENDLOOP.
  ENDIF.

AT LINE-SELECTION.
  IF sy-lsind = 1 AND sy-lilli > 5.
    FORMAT COLOR  5.
    WRITE: / 'Flüge zu der Verbindung: ', gs_wa-carrid, gs_wa-connid.
    FORMAT RESET.



    SELECT * FROM sflight INTO TABLE gt_flight
    WHERE carrid = gs_wa-carrid AND connid = gs_wa-connid.
    IF sy-subrc = 0.
      MESSAGE s003 WITH gs_wa-connid.
    ELSE.
      MESSAGE e002.
    ENDIF.




*    FORMAT COLOR  2.
*    ULINE /(53).
*    WRITE: / '|Datum ', 14  '|Flugzeugtyp', 27 '|Plätze', 40 '|Belegt', 53'|'.
*    ULINE /(53).
*    FORMAT RESET.
*
*    LOOP AT gt_flight INTO gs_wa2.
*      WRITE: / '|', gs_wa2-fldate,
*       '|', gs_wa2-planetype,
*      '|', gs_wa2-seatsmax,
*      '|', gs_wa2-seatsocc,
*      '|'.
*      ULINE /(53).
*    ENDLOOP.
  ENDIF.
