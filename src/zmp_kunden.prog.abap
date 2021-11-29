*&---------------------------------------------------------------------*
*& Report  ZMP_KUNDEN
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_kunden MESSAGE-ID zmp_messages.

DATA: gt_customer TYPE TABLE OF scustom,
      gs_wa TYPE scustom,
      gv_customertype TYPE scustom-custtype,
      gv_visible TYPE i VALUE 1.


SELECTION-SCREEN BEGIN OF SCREEN 800 AS SUBSCREEN.
SELECT-OPTIONS so_name FOR gs_wa-name.
SELECT-OPTIONS so_str FOR gs_wa-street MODIF ID vsb.
SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT (35) msg1 MODIF ID vsb.
SELECT-OPTIONS so_pcode  FOR gs_wa-postcode NO INTERVALS NO-EXTENSION MODIF ID vsb.
SELECT-OPTIONS so_city  FOR gs_wa-city NO INTERVALS NO-EXTENSION MODIF ID vsb.
SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN PUSHBUTTON 5(10) buttona USER-COMMAND switch.
SELECTION-SCREEN END OF SCREEN 800.

SELECTION-SCREEN BEGIN OF SCREEN 810 AS SUBSCREEN.
SELECT-OPTIONS so_disc FOR gs_wa-discount.
PARAMETERS :
             p_type1 RADIOBUTTON GROUP gr1,
             p_type2 RADIOBUTTON GROUP gr1.

SELECTION-SCREEN END OF SCREEN 810.


SELECTION-SCREEN: BEGIN OF TABBED BLOCK blockname FOR 15 LINES,
                    TAB (20) button1 USER-COMMAND push1 DEFAULT SCREEN 800,
                    TAB (20) button2 USER-COMMAND push2 DEFAULT SCREEN 810,
                  END OF BLOCK blockname.

INITIALIZATION.
  buttona = 'Ausblenden'.
  button1 = 'Adressdaten'.
  button2 = 'Kundendaten'.
  msg1 = 'PLZ/ORT'.

AT SELECTION-SCREEN ON so_city.
  IF so_city CA '0123456789'.
    MESSAGE e004.
  ENDIF.

*Es wurde ein Knopf gedrückt
AT SELECTION-SCREEN.
  IF sy-ucomm = 'SWITCH' AND sy-dynnr = 800.
    gv_visible = ( gv_visible + 1 )  MOD 2 .
    IF gv_visible = 1.
      buttona = 'Einblenden'.
    ELSE.
      buttona = 'Ausblenden'.
    ENDIF.
  ENDIF.

*Anpassen des Outputs
AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN.
    IF screen-group1 = 'VSB'.
      screen-active = gv_visible.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.


START-OF-SELECTION.
  IF p_type1 = 'X'.
    gv_customertype = 'B'.
  ELSE.
    gv_customertype = 'P'.
  ENDIF.

  SELECT * FROM scustom INTO TABLE gt_customer
      WHERE name IN so_name
        AND street IN so_str
        AND postcode IN so_pcode
        AND city IN so_city
        AND discount IN so_disc
        AND custtype = gv_customertype.

  LOOP AT gt_customer INTO gs_wa.
    WRITE:  / gs_wa.
  ENDLOOP.
