*&---------------------------------------------------------------------*
*& Include ZMP_ALV_TOP                                       Modulpool        ZMP_ALV
*&
*&---------------------------------------------------------------------*

PROGRAM ZMP_ALV.

DATA: gv_okcode type sy-ucomm,
      gr_container type REF TO cl_gui_custom_container ,
      gr_alv TYPE REF TO cl_gui_alv_grid,
      gt_scarr TYPE TABLE OF scarr.
