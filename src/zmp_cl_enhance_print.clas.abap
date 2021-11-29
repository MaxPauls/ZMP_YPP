class ZMP_CL_ENHANCE_PRINT definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZDP_IF_BADI_TEST .
protected section.
private section.
ENDCLASS.



CLASS ZMP_CL_ENHANCE_PRINT IMPLEMENTATION.


  method ZDP_IF_BADI_TEST~PRINT_TEXT.
    FORMAT RESET.
    Write: / 'Let the BAdIs hit the floor! - BAdI-Flachwitze sind viel cooler.'.
  endmethod.
ENDCLASS.
