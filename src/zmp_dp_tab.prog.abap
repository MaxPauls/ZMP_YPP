*&---------------------------------------------------------------------*
*& Report  ZMP_DP_TAB
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_dp_tab.

DATA: ref_struct TYPE REF TO data,
      ref_table TYPE REF TO data.

FIELD-SYMBOLS <gs_struct> TYPE any.
FIELD-SYMBOLS <gt_table> TYPE table.
FIELD-SYMBOLS <gs_comp> TYPE any.

PARAMETERS p_tab TYPE string.

START-OF-SELECTION.
  CREATE DATA ref_struct TYPE (p_tab).
  ASSIGN ref_struct->* TO <gs_struct>.

  CREATE DATA ref_table TYPE TABLE OF (p_tab).
  ASSIGN ref_table->* TO <gt_table>.

  SELECT * FROM (p_tab) INTO TABLE <gt_table> UP TO 50 ROWS.
  IF sy-subrc <> 0.
    MESSAGE 'Keine EintrÃ¤ge in der Tabelle' TYPE 'E'.
  ENDIF.

  LOOP AT <gt_table> ASSIGNING <gs_struct>.
    DO.
      ASSIGN COMPONENT sy-index OF STRUCTURE <gs_struct> TO <gs_comp>.
      IF sy-subrc <> 0.
        NEW-LINE.
        EXIT.
      ENDIF.
      WRITE <gs_comp>.
    ENDDO.




  ENDLOOP.
