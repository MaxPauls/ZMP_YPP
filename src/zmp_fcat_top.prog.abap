*&---------------------------------------------------------------------*
*& Include ZMP_FCAT_TOP                                      Modulpool        ZMP_FCAT
*&
*&---------------------------------------------------------------------*

PROGRAM zmp_fcat.

TYPES: BEGIN OF ty_book.
TYPES name TYPE scustom-name.
TYPES city TYPE scustom-city.
TYPES country TYPE scustom-country.
        INCLUDE TYPE sbook.
TYPES END OF ty_book.

TABLES: stravelag,
        scustom.

DATA: gv_okcode TYPE sy-ucomm,
      gr_containter TYPE REF TO cl_gui_custom_container,
      gr_alv TYPE REF TO cl_gui_alv_grid,

      gt_bookings TYPE TABLE OF ty_book,
      gs_booking type ty_book,

      gt_fcat TYPE TABLE OF lvc_s_fcat,
      gs_fcat TYPE lvc_s_fcat

      .
