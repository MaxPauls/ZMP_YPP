*&---------------------------------------------------------------------*
*&  Include           ZMP_FCAT_CLASSES
*&---------------------------------------------------------------------*

CLASS lcl_event_handler DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS: on_double_click FOR EVENT double_click OF cl_gui_alv_grid IMPORTING es_row_no.

ENDCLASS.

CLASS lcl_event_handler IMPLEMENTATION.
  METHOD: on_double_click.
    READ TABLE gt_bookings INDEX es_row_no-row_id INTO gs_booking.
    SELECT SINGLE * FROM scustom INTO scustom WHERE id = gs_booking-customid.
    LEAVE TO SCREEN 0300.
  ENDMETHOD.
ENDCLASS.
