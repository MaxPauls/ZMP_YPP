*&---------------------------------------------------------------------*
*& Report  ZMP_DREF
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_dref.

DATA: cityfrom TYPE spfli-cityfrom,
      ref_cityto TYPE REF TO spfli-cityto,
      ref_generic TYPE REF TO data.
FIELD-SYMBOLS <gs_fields> TYPE ANY.
FIELD-SYMBOLS <gs_fields2> TYPE ANY.

cityfrom = 'FRANKFURT'.

GET REFERENCE OF cityfrom INTO ref_cityto.

write: / ref_cityto->*.

ref_generic = ref_cityto.

ASSIGN ref_generic->* to <gs_fields>.
write: / <gs_fields>.

GET REFERENCE OF cityfrom INTO ref_generic.

ASSIGN ref_generic->* to <gs_fields2>.
WRITE: / <gs_fields2>.
