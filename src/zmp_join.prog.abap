*&---------------------------------------------------------------------*
*& Report  ZMP_JOIN
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_join.

*Erstellung der Struktur
TYPES: BEGIN OF gy_join,
        carrid TYPE spfli-carrid,
        connid TYPE spfli-connid,
        cityfrom TYPE spfli-cityfrom,
        carrname TYPE scarr-carrname.
TYPES END OF gy_join.

DATA: gt_flights TYPE TABLE OF gy_join,
      gs_flight TYPE gy_join.

*Join ausführen und in interne Tabelle speichern
SELECT spfli~carrid connid cityfrom carrname
  FROM spfli INNER JOIN scarr ON spfli~carrid = scarr~carrid
  INTO TABLE gt_flights.


*interne Tabelle ausgeben
LOOP AT gt_flights INTO gs_flight.
  WRITE: / gs_flight.
ENDLOOP.
