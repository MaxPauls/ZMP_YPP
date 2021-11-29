*&---------------------------------------------------------------------*
*& Include ZMP_SUBS_TOP                                      Modulpool        ZMP_SUBS
*&
*&---------------------------------------------------------------------*

PROGRAM zmp_subs.

TABLES scustom.

DATA: gv_ok_code TYPE sy-ucomm,
      gv_wa TYPE scustom,
      dynnr TYPE sy-dynnr.
CONTROLS zmp_tabstrip TYPE TABSTRIP.
