class ZMP_PRINDCLSS definition
  public
  final
  create public .

public section.

  interfaces IF_BADI_INTERFACE .
  interfaces ZDP_IF_BADI_TEST .
protected section.
private section.
ENDCLASS.



CLASS ZMP_PRINDCLSS IMPLEMENTATION.


  method ZDP_IF_BADI_TEST~PRINT_TEXT.
    Write: / 'Juhuuu, Max ist mein Buddy'.
  endmethod.
ENDCLASS.
