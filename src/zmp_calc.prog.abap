*&---------------------------------------------------------------------*
*& Report  ZMP_CALC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_calc.

DATA: gv_result TYPE i,
      ge_type TYPE REF TO cx_sy_arithmetic_error.
PARAMETERS: p_a TYPE i,
            p_b TYPE i.

SELECTION-SCREEN BEGIN OF LINE.
  PARAMETERS p TYPE i.
  PARAMETERS e TYPE i.
SELECTION-SCREEN END OF LINE.

AT SELECTION-SCREEN.
  TRY.
      gv_result = p_a / p_b.
    CATCH CX_SY_ARITHMETIC_ERROR INTO ge_type.
      MESSAGE ge_type->get_text( ) TYPE 'E'.
      MESSAGE 'Teile gefälligst nicht durhc null' TYPE 'E'.
  ENDTRY.

START-OF-SELECTION.
  WRITE: 'Lösung: ', gv_result.
