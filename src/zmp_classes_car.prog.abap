*&---------------------------------------------------------------------*
*&  Include           ZMP_CLASSES_CAR
*&---------------------------------------------------------------------*
CLASS lcl_fahrzeug DEFINITION.

  PUBLIC SECTION.
    METHODS: setname IMPORTING iv_name TYPE c,
             sethoechstgeschwindigkeit IMPORTING iv_geschw TYPE i,
             setsitzplaetze IMPORTING iv_sitzplaetze TYPE i,
             getname  RETURNING VALUE(rv_name) TYPE char20,
             gethoechstgeschwindigkeit RETURNING VALUE(rv_hoechstgeschwindikeit) TYPE i,
             getsitzplaetze RETURNING VALUE(rv_sitzplaetze) TYPE i,
             print.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: mv_name(20) TYPE c,
          mv_sitzplaetze TYPE i,
          mv_hoechstgeschwindigkeit TYPE i.
ENDCLASS.               "ZMP_CLasses_test


CLASS lcl_fahrzeug IMPLEMENTATION.
  METHOD setname.
    me->mv_name = iv_name.
  ENDMETHOD.

  METHOD sethoechstgeschwindigkeit.
    me->mv_hoechstgeschwindigkeit = iv_geschw.
  ENDMETHOD.

  METHOD setsitzplaetze.
    me->mv_sitzplaetze = iv_sitzplaetze.
  ENDMETHOD.

  METHOD gethoechstgeschwindigkeit.
    rv_hoechstgeschwindikeit = mv_hoechstgeschwindigkeit.
  ENDMETHOD.

  METHOD getname.
    rv_name = mv_name.
  ENDMETHOD.

  METHOD getsitzplaetze.
    rv_sitzplaetze = mv_sitzplaetze.
  ENDMETHOD.

  METHOD print.
    WRITE: / getname( ) , gethoechstgeschwindigkeit( ), getsitzplaetze( ).
  ENDMETHOD.
ENDCLASS.               "ZMP_CLasses_test



CLASS lcl_wasserfahrzeug DEFINITION INHERITING FROM lcl_fahrzeug.
  PUBLIC SECTION.
    METHODS: gettiefgang RETURNING VALUE(rv_tiefgang) TYPE i,
             settiefgang IMPORTING iv_tiefgang TYPE i,
             print REDEFINITION.
  PRIVATE SECTION.
    DATA mv_tiefgang TYPE i.
ENDCLASS.

CLASS lcl_wasserfahrzeug IMPLEMENTATION.
  METHOD settiefgang.
    me->mv_tiefgang = iv_tiefgang.
  ENDMETHOD.

  METHOD gettiefgang.
    rv_tiefgang = mv_tiefgang.
  ENDMETHOD.

  METHOD print.
    super->print( ).
    write: 'Tiefgang:', gettiefgang( ).
  ENDMETHOD.

ENDCLASS.


CLASS lcl_landfahrzeug DEFINITION INHERITING FROM lcl_fahrzeug.
  PUBLIC SECTION.
    METHODS: setraeder IMPORTING iv_raeder TYPE i,
             getraeder RETURNING VALUE(rv_raeder) TYPE i,
             print REDEFINITION.
  PRIVATE SECTION.
    DATA mv_anzahlraeder TYPE i.
ENDCLASS.


CLASS lcl_landfahrzeug IMPLEMENTATION.
  METHOD setraeder.
    me->mv_anzahlraeder = iv_raeder.
  ENDMETHOD.

  METHOD getraeder.
    rv_raeder = mv_anzahlraeder.
  ENDMETHOD.

  METHOD print.
    super->print( ).
    write: 'Raeder:', getraeder( ).
  ENDMETHOD.
ENDCLASS.
