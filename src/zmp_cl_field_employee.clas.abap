class ZMP_CL_FIELD_EMPLOYEE definition
  public
  inheriting from ZMP_CL_EMPLOYEE
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IV_NAME type STRING
      !IV_BASE_SALARY type I
      !IV_ADDRESSE type STRING
      !IV_DOB type SY-DATUM
      !IV_SALES type I
      !IV_PERCENTAGE type I .
  methods SET_SALES
    importing
      !IV_SALES type I .
  methods GET_SALES
    returning
      value(RV_SALES) type I .
  methods SET_PERCENTAGE
    importing
      !IV_PRECENTAGE type I .
  methods GET_PERCENTAGE
    returning
      value(RV_PERCENTAGE) type I .

  methods GET_SALARY
    redefinition .
  methods PRINT
    redefinition .
protected section.
private section.

  data MV_PERCENTAGE type I .
  data MV_SALES type I .
ENDCLASS.



CLASS ZMP_CL_FIELD_EMPLOYEE IMPLEMENTATION.


  method CONSTRUCTOR.

    super->constructor(
      EXPORTING
        iv_name        = iv_name
        iv_base_salary = iv_base_salary
        iv_dob         = iv_dob
        iv_addresse = iv_addresse
    ).
    set_sales( iv_sales ).
    set_percentage( iv_percentage ).

  endmethod.


  method GET_PERCENTAGE.

    rv_percentage = mv_percentage.

  endmethod.


  method GET_SALARY.

    rv_salary = get_base_salary( ) + ( ( get_sales( ) * get_percentage( ) ) / 100 ).


  endmethod.


  method GET_SALES.

    rv_sales = mv_sales.

  endmethod.


  method PRINT.

    WRITE: / 'Name: ', 11 get_name( ),
    / 'Typ:', 11 'auswärts',
    / 'Addresse: ', 11 get_address( ),
    / 'Alter: ', 11 get_alter( ) LEFT-JUSTIFIED,
    / 'Gehalt: ', 11 get_salary( ) LEFT-JUSTIFIED,
    / 'Verkauft:', 11 get_sales( ) LEFT-JUSTIFIED,
    / 'Prozent: ', 11 get_percentage( ) LEFT-JUSTIFIED.

  endmethod.


  method SET_PERCENTAGE.

    mv_percentage = iv_precentage.

  endmethod.


  method SET_SALES.

    mv_sales = iv_sales.

  endmethod.
ENDCLASS.
