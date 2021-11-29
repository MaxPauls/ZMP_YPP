*&---------------------------------------------------------------------*
*& Report  ZMP_RTTC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_rttc.

DATA gr_table_type TYPE REF TO cl_abap_tabledescr.
DATA gr_line_type TYPE REF TO cl_abap_structdescr.
DATA gr_key TYPE abap_keydescr_tab.
DATA gr_table TYPE REF TO data.

FIELD-SYMBOLS <gs_symbol> TYPE ANY TABLE.
FIELD-SYMBOLS <gs_struct> TYPE ANY.


APPEND 'CARRID' TO gr_key.
APPEND 'CONNID' TO gr_key.

gr_line_type ?= cl_abap_typedescr=>describe_by_name('SPFLI').

*                                             TRY.
CALL METHOD cl_abap_tabledescr=>create
  EXPORTING
    p_line_type  = gr_line_type
    p_table_kind = cl_abap_tabledescr=>tablekind_sorted
    p_unique     = abap_true
    p_key        = gr_key
  RECEIVING
    p_result     = gr_table_type.

CREATE DATA gr_table TYPE HANDLE gr_table_type.

ASSIGN gr_table->* TO <gs_symbol>.

SELECT * FROM spfli INTO TABLE <gs_symbol>.

*LOOP AT <gs_symbol> into <gs_struct>.
*  write: / <gs_struct>-carrid.
*ENDLOOP.
