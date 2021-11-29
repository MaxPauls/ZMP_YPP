*&---------------------------------------------------------------------*
*& Report  ZMP_SDESC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_SDESC.

DATA gr_descr type REF TO cl_abap_structdescr.
DATA gr_comp type  abap_compdescr.

PARAMETERS p_struct type string.

START-OF-SELECTION.

gr_descr ?= cl_abap_elemdescr=>get_data_type_kind( p_struct).

LOOP AT gr_descr->components into gr_comp.
  write: / gr_comp-name.

ENDLOOP.
