FUNCTION ZMP_F_CALC.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IM_OP1) TYPE  I
*"     VALUE(IM_OP2) TYPE  I
*"     VALUE(IM_OPERATOR) TYPE  C
*"  EXPORTING
*"     VALUE(EX_ERGEBNIS) TYPE  I
*"  EXCEPTIONS
*"      ZERO_DIVISION
*"      INVALID_OPERATOR
*"----------------------------------------------------------------------


case IM_OPERATOR.
  when '+'.
    EX_ERGEBNIS = IM_OP1 + IM_OP2.
  when '-'.
    EX_ERGEBNIS = IM_OP1 - IM_OP2.
  when '*'.
    EX_ERGEBNIS = IM_OP1 * IM_OP2.
  when '/'.


    IF IM_OP2 = 0.
      RAISE ZERO_DIVISION.
    endif.

    EX_ERGEBNIS = IM_OP1 / IM_OP2.
  when '%'.
    IF IM_OP2 = 0.
      RAISE ZERO_DIVISION.
    endif.
    EX_ERGEBNIS = IM_OP1 MOD IM_OP2.
  when others.
    RAISE INVALID_OPERATOR.
endcase.




ENDFUNCTION.
