FUNCTION z_zpm_sangebot.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(I_CARRID1) TYPE  SPFLI-CARRID
*"     REFERENCE(I_CONNID1) TYPE  SPFLI-CONNID
*"     REFERENCE(I_CARRID2) TYPE  SPFLI-CARRID
*"     REFERENCE(I_CONNID2) TYPE  SPFLI-CONNID
*"  EXPORTING
*"     REFERENCE(E_VERFUEGBAR) TYPE  INTEGER4
*"----------------------------------------------------------------------
  DATA: lt_flights TYPE TABLE OF sflight,
        ls_flight TYPE sflight,
        lv_hinflug TYPE i VALUE 0,
        lv_rueckflug TYPE i VALUE 0.

  e_verfuegbar = 0.

  SELECT * FROM sflight INTO TABLE lt_flights
    WHERE carrid = i_carrid1 AND connid = i_connid1.

  LOOP AT lt_flights INTO ls_flight.
    IF ls_flight-seatsmax - ls_flight-seatsocc > 0 OR
      ls_flight-seatsmax_f - ls_flight-seatsocc_f > 0 OR
      ls_flight-seatsmax_b - ls_flight-seatsocc_b > 0.
      lv_hinflug = 1.
    ENDIF.
  ENDLOOP.

  SELECT * FROM sflight INTO TABLE lt_flights
    WHERE carrid = i_carrid2 AND connid = i_connid2.

  LOOP AT lt_flights INTO ls_flight.
    IF ls_flight-seatsmax - ls_flight-seatsocc > 0 OR
      ls_flight-seatsmax_f - ls_flight-seatsocc_f > 0 OR
      ls_flight-seatsmax_b - ls_flight-seatsocc_b > 0.
      lv_rueckflug = 1.
    ENDIF.
  ENDLOOP.

  IF lv_hinflug = 1 AND lv_rueckflug = 1.
    e_verfuegbar = 1.
  ENDIF.


ENDFUNCTION.
