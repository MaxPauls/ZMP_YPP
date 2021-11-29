FUNCTION Z_MP_SANGEBOT.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_CARRID1) TYPE  SPFLI-CARRID
*"     REFERENCE(IV_CARRID2) TYPE  SPFLI-CARRID
*"     REFERENCE(IV_CONNID1) TYPE  SPFLI-CONNID
*"     REFERENCE(IV_CONNID2) TYPE  SPFLI-CONNID
*"  EXPORTING
*"     REFERENCE(EV_VERFUEGBAR) TYPE  INTEGER4
*"----------------------------------------------------------------------

* Yannicks Lösung macht nur fldate-Zugriff, vermutlich besser weil weniger Daten
DATA gt_fluege TYPE STANDARD TABLE OF SFLIGHT.

SELECT * FROM SFLIGHT INTO TABLE gt_fluege
  WHERE carrid = iv_carrid1 AND connid = iv_connid1
    AND ( SEATSMAX > SFLIGHT~SEATSOCC
      OR SEATSMAX_F > SFLIGHT~SEATSOCC_F
        OR SEATSMAX_B > SFLIGHT~SEATSOCC_B ).

IF sy-dbcnt > 0.

SELECT * FROM SFLIGHT INTO TABLE gt_fluege
  WHERE carrid = iv_carrid2 AND connid = iv_connid2
    AND ( SEATSMAX > SFLIGHT~SEATSOCC
      OR SEATSMAX_F > SFLIGHT~SEATSOCC_F
        OR SEATSMAX_B > SFLIGHT~SEATSOCC_B ).

    IF sy-dbcnt > 0.
     ev_verfuegbar = 1.
    ELSE.
      ev_verfuegbar = 0.
    ENDIF.

ELSE.
  ev_verfuegbar = 0.
ENDIF.

ENDFUNCTION.
