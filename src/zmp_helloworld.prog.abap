*&---------------------------------------------------------------------*
*& Report  ZMP_HELLOWORLD
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_helloworld.

**
TYPES: BEGIN OF fli,
  carrid TYPE spfli-carrid,
  asd LIKE spfli-airpto,
  id TYPE spfli-connid,
  END OF fli.

DATA wa TYPE fli.

FIELD-SYMBOLS <asd> TYPE any.
