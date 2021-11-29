*&---------------------------------------------------------------------*
*& Report  ZMP_TESTFILES3
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_testfiles3.

TYPES BEGIN OF type.
TYPES a TYPE string.
TYPES willich TYPE char0256.
TYPES END OF type.


DATA ls_struct TYPE type.
DATA lv_string TYPE string.
DATA lv_string2 TYPE string.
DATA lv_tabdescr TYPE REF TO cl_abap_tabledescr.
DATA lv_descr2 TYPE REF TO cl_abap_typedescr.
DATA lv_descr3 TYPE REF TO cl_abap_structdescr.

DATA lt_table TYPE TABLE OF type.

ls_struct-a = 'Hugo'.
ls_struct-willich = 'Keks'.

APPEND ls_struct TO lt_table.

lv_tabdescr ?= cl_abap_tabledescr=>describe_by_data( p_data = lt_table ).

*lv_descr3 ?= cl_abap_structdescr=>describe_by_data( p_data = ls_struct ).
*lv_string = cl_abap_structdescr=>describe_by_data( p_data = ls_struct-willich )->get_relative_name( ).
*lv_string2 = cl_abap_typedescr=>describe_by_data( ls_struct )->get_relative_name( ).
*
*lv_descr = cl_abap_typedescr=>describe_by_data( ls_struct-willich ).
*lv_descr2 = cl_abap_typedescr=>describe_by_data( ls_struct ).

LOOP AT lv_tabdescr->key ASSIGNING FIELD-SYMBOL(<asd>).
  ULINE.
  WRITE: / <asd>-name.
ENDLOOP.

*DATA: ls_components TYPE abap_compdescr.
*DATA: lo_strucdescr TYPE REF TO cl_abap_structdescr.
*DATA: ls_t001 TYPE type.
*
*lo_strucdescr ?= cl_abap_typedescr=>describe_by_data( ls_t001 ).
*
*LOOP AT lo_strucdescr->components INTO ls_components.
*  WRITE:/ ls_components-name.
*ENDLOOP.


CHECK 1 = 1.
