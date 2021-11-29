*&---------------------------------------------------------------------*
*& Report  ZMP_SUCHE
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_suche.

TYPES: BEGIN OF gy_output,
  from TYPE zmp_sview-cityfrom,
  to TYPE zmp_sview-cityto,
  date TYPE zmp_sview-fldate,
  free TYPE i,
  class TYPE sbook-class,
  max TYPE zmp_sview-seatsmax,
  airline TYPE zmp_sview-carrname.
TYPES END OF gy_output.
DATA: gv_class TYPE sbook-class,
      gv_bedingung(40) TYPE c,
      gv_freieplaetze TYPE i,
      gv_max TYPE i.

DATA: gs_output TYPE gy_output,
      gt_output TYPE TABLE OF gy_output.

DATA: gs_wa TYPE zmp_sview,
      gt_table TYPE TABLE OF zmp_sview.



SELECTION-SCREEN: BEGIN OF SCREEN 500,
                  COMMENT /1(80) strandk,
                  SKIP,
                  COMMENT /1(80) willko,
                  ULINE /1(80).
SELECT-OPTIONS so_date FOR gs_wa-fldate.
SELECTION-SCREEN: SKIP,
                  COMMENT /1(80) abflug.
SELECT-OPTIONS so_cfr FOR gs_wa-countryfr NO INTERVALS.
SELECT-OPTIONS so_ctfr FOR gs_wa-cityfrom NO INTERVALS.

SELECTION-SCREEN: SKIP,
                  COMMENT /1(80) landung.
SELECT-OPTIONS so_cto FOR gs_wa-countryto NO INTERVALS.
SELECT-OPTIONS so_ctto FOR gs_wa-cityto NO INTERVALS.

SELECTION-SCREEN SKIP.
PARAMETERS p_class TYPE sbook-class DEFAULT 'C'.
SELECT-OPTIONS so_price FOR gs_wa-price.

SELECTION-SCREEN PUSHBUTTON /1(40) btn USER-COMMAND loesche.

SELECTION-SCREEN END OF SCREEN 500.




INITIALIZATION.
  strandk = '-------------------------------  STRANDKORB AG  ------------------------------------'.
  willko = 'Herzlich Willkommen im Flugsuche-System der Strandkorb AG'.
  abflug = 'Wo soll der Flug starten?'.
  landung = 'Wohin sol lder Flug gehen?'.
  btn = 'Eingabe löschen'.
  CALL SCREEN 500 STARTING AT 10 1.

AT SELECTION-SCREEN OUTPUT.

AT SELECTION-SCREEN.

  CASE sy-ucomm.
    WHEN 'LOESCHE'.
      REFRESH so_cfr.
      CLEAR p_class.
      REFRESH so_ctfr.
      REFRESH so_cto.
      REFRESH so_ctto.
      REFRESH so_date.
      REFRESH so_price.
    WHEN OTHERS.
  ENDCASE.



START-OF-SELECTION.
  CASE p_class.
    WHEN 'C'.
      gv_bedingung = ' seatsmax_b > zmp_sview~seatsocc_b'.
    WHEN 'Y'.
      gv_bedingung = ' seatsmax > zmp_sview~seatsocc'.
    WHEN 'F'.
      gv_bedingung = ' seatsmax_f > zmp_sview~seatsocc_f'.
  ENDCASE.

  SELECT * FROM zmp_sview INTO TABLE gt_table
      WHERE countryfr IN so_cfr AND
      cityfrom IN so_ctfr AND
      cityto IN so_ctto AND
      countryto IN so_cto AND
      fldate IN so_date AND
      price IN so_price AND
      (gv_bedingung).



  LOOP AT gt_table INTO gs_wa.
    gs_output-airline = gs_wa-carrname.
    gs_output-class = p_class.
    gs_output-date = gs_wa-fldate.
    gs_output-from = gs_wa-cityfrom.
    gs_output-to = gs_wa-cityto.
    CASE p_class.
      WHEN 'F'.
        gs_output-free =  gs_wa-seatsmax_f - gs_wa-seatsocc_f.
        gs_output-max =  gs_wa-seatsmax_f.
      WHEN 'Y'.
        gs_output-free =  gs_wa-seatsmax - gs_wa-seatsocc.
        gs_output-max = gs_wa-seatsmax.
      WHEN 'C'.
        gs_output-free =  gs_wa-seatsmax_b - gs_wa-seatsocc_b.
        gs_output-max = gs_wa-seatsmax_b.
    ENDCASE.
    APPEND gs_output to gt_output.
  ENDLOOP.

  sort gt_output BY free DESCENDING.
  DESCRIBE TABLE gt_output.
  WRITE: / 'Es gab ',sy-tfill,' Suchtreffer. Diese Flüge wurden gefunden:'.
  ULINE /1(120).
  FORMAT COLOR 4.
  WRITE: / '|VON',  25'|NACH', 45'|DATUM',  60'|freie Pl.',  68'|KLASSE',  85'|GESAMTPL', 95'|GESELLSCHAFT'.
  FORMAT RESET.
  ULINE /1(120).
  LOOP AT gt_output INTO gs_output.
    WRITE: / '|', gs_output-from,  '|', gs_output-to, '|', gs_output-date, '|', gs_output-free, '|', gs_output-class,'|' , gs_output-max ,'|', gs_output-airline, '|'.
  ENDLOOP.


*  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
*    EXPORTING
*      i_structure_name = 'ZMP_SVIEW'
*    TABLES
*      t_outtab         = gt_table.



END-OF-SELECTION.
