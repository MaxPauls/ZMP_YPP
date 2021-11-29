*&---------------------------------------------------------------------*
*& Report  ZMP_CLASSES_TEST
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_classes_test.
INCLUDE zmp_classes_car.
*&---------------------------------------------------------------------*
*&       Class ZMP_CLasses_test
*&---------------------------------------------------------------------*
*        Text
*----------------------------------------------------------------------*

DATA: go_car TYPE REF TO lcl_landfahrzeug,
      go_boat TYPE REF TO lcl_wasserfahrzeug,
      go_fahrzeug TYPE REF TO lcl_fahrzeug,
      gt_fahrzeuge TYPE TABLE OF REF TO lcl_fahrzeug.

START-OF-SELECTION.
  CREATE OBJECT go_car.
  go_car->setname( 'Audi A4' ).
  go_car->sethoechstgeschwindigkeit( 25 ).
  go_car->setsitzplaetze( 4 ).
  go_car->setraeder( 4 ).
  APPEND go_car TO gt_fahrzeuge.

  CREATE OBJECT go_car.
  go_car->setname( 'Audi A5' ).
  go_car->sethoechstgeschwindigkeit( 30 ).
  go_car->setsitzplaetze( 5 ).
  go_car->setraeder( 4 ).
  APPEND go_car TO gt_fahrzeuge.

  CREATE OBJECT go_car.
  go_car->setname( 'Audi A8' ).
  go_car->sethoechstgeschwindigkeit( 40 ).
  go_car->setsitzplaetze( 8 ).
  go_car->setraeder( 4 ).
  APPEND go_car TO gt_fahrzeuge.

  CREATE OBJECT go_boat.
  go_boat->sethoechstgeschwindigkeit( 300000 ).
  go_boat->setsitzplaetze( 4 ).
  go_boat->setname( 'sehr schnelles Teil' ).
  go_boat->settiefgang( 12 ).
  APPEND go_boat to gt_fahrzeuge.

  CREATE OBJECT go_boat.
  go_boat->sethoechstgeschwindigkeit( 27 ).
  go_boat->setsitzplaetze( 4 ).
  go_boat->setname( 'schnelles Teil' ).
  go_boat->settiefgang( 12 ).
  APPEND go_boat to gt_fahrzeuge.

  LOOP AT gt_fahrzeuge INTO go_fahrzeug.
    go_fahrzeug->print( ).
  ENDLOOP.
