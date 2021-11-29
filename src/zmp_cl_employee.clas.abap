class ZMP_CL_EMPLOYEE definition
  public
  inheriting from ZMP_CL_PERSON
  create public .

public section.

  interfaces ZMP_IF_PRINTABLE .

  methods CONSTRUCTOR
    importing
      value(IV_NAME) type STRING
      value(IV_ADDRESSE) type STRING
      value(IV_DOB) type DATS
      value(IV_BASE_SALARY) type I .
  methods GET_BASE_SALARY
    returning
      value(RV_BASE_SALARY) type INT4 .
  methods SET_BASE_SALARY
    importing
      value(IV_BASE_SALARY) type INT4 .
  methods GET_SALARY
    returning
      value(RV_SALARY) type INT4 .
  methods PRINT .
  methods GET_ALTER
    returning
      value(RV_ALTER) type INT4 .
protected section.
private section.

  data MV_BASE_SALARY type INT4 .
ENDCLASS.



CLASS ZMP_CL_EMPLOYEE IMPLEMENTATION.


  method CONSTRUCTOR.
    super->constructor(
      EXPORTING
        iv_name     =  iv_name   " Name
        iv_addresse =  iv_addresse   " Addresse
        iv_dob      =  iv_dob   " Geburtsdatum
    ).
    mv_base_salary = iv_base_salary.
  endmethod.


  METHOD get_alter.
    rv_alter = ( sy-datum - me->get_dob( ) ) / 365.
  ENDMETHOD.


  METHOD get_base_salary.
    rv_base_salary = mv_base_salary.
  ENDMETHOD.


  METHOD get_salary.
    IF get_alter( ) > 50.
      rv_salary = get_base_salary( ) * '1.1'.
    ELSEIF get_alter( ) > 40.
      rv_salary = get_base_salary( ) * '1.05'.
    ELSE.
      rv_salary = get_base_salary( ).
    ENDIF.
  ENDMETHOD.


  METHOD print.
    WRITE: / 'Name: ', 11 get_name( ),
    / 'Addresse: ', 11 get_address( ),
    / 'Alter: ', 11 get_alter( ) LEFT-JUSTIFIED,
    / 'Gehalt: ', 11 get_salary( ) LEFT-JUSTIFIED.
  ENDMETHOD.


  METHOD set_base_salary.
    mv_base_salary = iv_base_salary.
  ENDMETHOD.


  method ZMP_IF_PRINTABLE~PRINT_OBJECT.
    print( ).
  endmethod.
ENDCLASS.
