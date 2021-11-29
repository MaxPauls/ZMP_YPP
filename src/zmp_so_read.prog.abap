*&---------------------------------------------------------------------*
*& Report  ZMP_SO_READ
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_SO_READ.

DATA ref TYPE REF TO zmp_area.

ref = zmp_area=>attach_for_read( ).


LOOP AT ref->root->catalogue->connections ASSIGNING FIELD-SYMBOL(<fs>).
 WRITE:/ <fs>-carrid, <fs>-connid, <fs>-cityfrom, <fs>-cityto.
ENDLOOP.
