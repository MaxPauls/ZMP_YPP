*&---------------------------------------------------------------------*
*& Include ZMP_COMPANY_TOP                                   Modulpool        ZMP_COMPANY
*&
*&---------------------------------------------------------------------*

PROGRAM zmp_company.

CLASS lcl_employee DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string
                                   iv_firstname TYPE string
                                   iv_base_salary TYPE i
                                   iv_dob TYPE sy-datum,
             set_name     IMPORTING iv_name TYPE string,
             set_firstname IMPORTING iv_firstname TYPE string,
             set_address IMPORTING iv_address TYPE string,
             get_name RETURNING VALUE(r_name) TYPE string,
             get_firstname RETURNING VALUE(r_firstname) TYPE string,
             get_address RETURNING VALUE(r_address) TYPE string,
             get_dob RETURNING VALUE(r_dob) TYPE sy-datum,
             get_base_salary RETURNING VALUE(r_base_salary) TYPE i,
             get_salary RETURNING VALUE(r_salary) TYPE i,
             get_full_name RETURNING VALUE(r_full_name) TYPE string,
             change_base_salary IMPORTING iv_amount TYPE i,
             print.
    CLASS-METHODS get_n_o_employees RETURNING VALUE(r_n_o_employees) TYPE i.


  PRIVATE SECTION.
    DATA: mv_name TYPE string,
          mv_firstname TYPE string,
          mv_address TYPE string,
          mv_dob TYPE sy-datum,
          mv_base_salary TYPE i.
    CLASS-DATA n_o_employees TYPE i VALUE 0.

    METHODS: set_dob IMPORTING iv_dob TYPE sy-datum,
             init_base_salary IMPORTING iv_base_salary TYPE i.
ENDCLASS.

CLASS lcl_employee IMPLEMENTATION.
  METHOD constructor.
    mv_name = iv_name.
    mv_firstname = iv_firstname.
    mv_base_salary = iv_base_salary.
    mv_dob = iv_dob.
    n_o_employees = n_o_employees + 1.
  ENDMETHOD.
  METHOD set_name.
    mv_name = iv_name.
  ENDMETHOD.
  METHOD set_firstname.
    mv_firstname = iv_firstname.
  ENDMETHOD.
  METHOD set_address.
    mv_address = iv_address.
  ENDMETHOD.
  METHOD get_name.
    r_name = mv_name.
  ENDMETHOD.
  METHOD get_firstname.
    r_firstname = mv_firstname.
  ENDMETHOD.
  METHOD get_address.
    r_address = mv_address.
  ENDMETHOD.
  METHOD get_dob.
    r_dob = mv_dob.
  ENDMETHOD.
  METHOD get_base_salary.
    r_base_salary = mv_base_salary.
  ENDMETHOD.
  METHOD get_salary.
*    if ( sy-datum-get_dob( ) ) / 365 > 50.
*      r_salary = get_base_salary *
*
  ENDMETHOD.
  METHOD get_full_name.
    CONCATENATE mv_firstname ' ' mv_name INTO r_full_name.
  ENDMETHOD.
  METHOD change_base_salary.
    mv_base_salary = mv_base_salary + iv_amount.
  ENDMETHOD.
  METHOD print.
    WRITE: / get_full_name( ), get_address( ), get_dob( ) , get_base_salary( ).
  ENDMETHOD.
  METHOD get_n_o_employees.
    r_n_o_employees = n_o_employees.
  ENDMETHOD.
  METHOD set_dob.
    mv_dob = iv_dob.
  ENDMETHOD.
  METHOD init_base_salary.
    mv_base_salary = iv_base_salary.
  ENDMETHOD.
ENDCLASS.
