*&---------------------------------------------------------------------*
*& Report  ZMP_STATISTIK
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_STATISTIK.


*Erstellung der Struktur
TYPES: BEGIN OF gy_joined,
        carrid TYPE spfli-carrid,
        carrname TYPE scarr-carrname,
        fltime TYPE spfli-fltime.
TYPES END OF gy_joined.

DATA: gt_flights TYPE TABLE OF gy_joined,
      gs_flight TYPE gy_joined.

*Join ausführen und in interne Tabelle speichern
SELECT spfli~carrid carrname MAX( fltime ) as time
  FROM spfli INNER JOIN scarr ON spfli~carrid = scarr~carrid
  INTO TABLE gt_flights
  GROUP BY spfli~carrid scarr~carrname
  Having MAX( fltime ) > 420
  ORDER BY time DESCENDING.



*interne Tabelle ausgeben
LOOP AT gt_flights INTO gs_flight.
  WRITE: / gs_flight-carrid, gs_flight-carrname, gs_flight-fltime.
ENDLOOP.
