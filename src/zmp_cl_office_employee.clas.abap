class ZMP_CL_OFFICE_EMPLOYEE definition
  public
  inheriting from ZMP_CL_EMPLOYEE
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      value(IV_NAME) type STRING
      value(IV_ADDRESSE) type STRING
      value(IV_DOB) type DATS
      value(IV_BASE_SALARY) type I
      value(IV_OFFICE) type STRING .
  methods GET_OFFICE
    returning
      value(RV_OFFICE) type STRING .
  methods SET_OFFICE
    importing
      value(IV_OFFICE) type STRING .

  methods PRINT
    redefinition .
protected section.
private section.

  data MV_OFFICE type STRING .
ENDCLASS.



CLASS ZMP_CL_OFFICE_EMPLOYEE IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
  EXPORTING
    IV_NAME        = iv_name
    IV_ADDRESSE    = iv_addresse
    IV_DOB         = iv_dob
    IV_BASE_SALARY = iv_base_salary
    .
  set_office( iv_office ).
  endmethod.


  method GET_OFFICE.
    rv_office = mv_office.
  endmethod.


  METHOD print.
    CALL METHOD super->print.
    WRITE:/ 'Büro: ', get_office( ).
  ENDMETHOD.


  method SET_OFFICE.
    mv_office = iv_office.
  endmethod.
ENDCLASS.
