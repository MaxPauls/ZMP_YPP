class ZMP_CL_SINGLETON definition
  public
  final
  create private

  global friends ZMP_CL_FLINFO .

public section.

  class-methods CLASS_CONSTRUCTOR .
  class-methods GET_SINGLETON
    returning
      value(RO_SINGLETON) type ref to ZMP_CL_SINGLETON .
protected section.
private section.

  types:
    TY_CONNECTION_LIST TYPE TABLE OF SPFLI WITH KEY carrid .

  class-data MO_INSTANCE type ref to ZMP_CL_SINGLETON .
  class-data MT_CONNECTION_LIST type TY_CONNECTION_LIST .
ENDCLASS.



CLASS ZMP_CL_SINGLETON IMPLEMENTATION.


  method CLASS_CONSTRUCTOR.
*    mo_instance = new zmp_cl_singleton( ).
  endmethod.


  METHOD get_singleton.
    IF mo_instance IS INITIAL.
      mo_instance = NEW zmp_cl_singleton( ).
      SELECT * from spfli into TABLE mt_connection_list.
    ENDIF.
    ro_singleton = mo_instance.

  ENDMETHOD.
ENDCLASS.
