*&---------------------------------------------------------------------*
*&  Include           ZMP_INCLUDE_CLASSES
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*& Include ZMP_COMPANY2_TOP                                  Report ZMP_COMPANY2
*&
*&---------------------------------------------------------------------*


CLASS lcl_employee DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string
                                   iv_firstname TYPE string
                                   iv_base_salary TYPE i
                                   iv_dob TYPE sy-datum,
             set_name     IMPORTING iv_name TYPE string,
             set_firstname IMPORTING iv_firstname TYPE string,
             set_address IMPORTING iv_address TYPE string,
             get_name RETURNING VALUE(rv_name) TYPE string,
             get_firstname RETURNING VALUE(rv_firstname) TYPE string,
             get_address RETURNING VALUE(rv_address) TYPE string,
             get_dob RETURNING VALUE(rv_dob) TYPE sy-datum,
             get_alter RETURNING VALUE(rv_alter) TYPE i,
             get_base_salary RETURNING VALUE(rv_base_salary) TYPE i,
             get_salary RETURNING VALUE(rv_salary) TYPE i,
             get_full_name RETURNING VALUE(rv_full_name) TYPE string,
             change_base_salary IMPORTING iv_amount TYPE i,
             print.
    CLASS-METHODS get_n_o_employees RETURNING VALUE(rv_n_o_employees) TYPE i.


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
    init_base_salary( iv_base_salary ).
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
    rv_name = mv_name.
  ENDMETHOD.
  METHOD get_firstname.
    rv_firstname = mv_firstname.
  ENDMETHOD.
  METHOD get_address.
    rv_address = mv_address.
  ENDMETHOD.
  METHOD get_dob.
    rv_dob = mv_dob.
  ENDMETHOD.
  METHOD get_alter.
    rv_alter = ( sy-datum - get_dob( ) ) / 365.
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
  METHOD get_full_name.
    CONCATENATE mv_firstname mv_name INTO rv_full_name SEPARATED BY ' '.
  ENDMETHOD.
  METHOD change_base_salary.
    mv_base_salary = mv_base_salary + iv_amount.
    IF mv_base_salary < 0.
      mv_base_salary = 0.
    ENDIF.
  ENDMETHOD.
  METHOD print.
    WRITE: / 'Name: ', 11 get_full_name( ),
    / 'Addresse: ', 11 get_address( ),
    / 'Alter: ', 11 get_alter( ) LEFT-JUSTIFIED,
    / 'Gehalt: ', 11 get_salary( ) LEFT-JUSTIFIED.
    SKIP.
  ENDMETHOD.
  METHOD get_n_o_employees.
    rv_n_o_employees = n_o_employees.
  ENDMETHOD.
  METHOD set_dob.
    mv_dob = iv_dob.
  ENDMETHOD.
  METHOD init_base_salary.
    IF iv_base_salary < 0.
      mv_base_salary = 0.
    ELSE.
      mv_base_salary = iv_base_salary.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_department DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string,
             set_name     IMPORTING iv_name TYPE string,
             get_name RETURNING VALUE(rv_name) TYPE string,
             add_employee IMPORTING io_employee TYPE REF TO lcl_employee,
             get_avg_salary RETURNING VALUE(rv_avg_salary) TYPE i,
             print.

  PRIVATE SECTION.
    DATA: mv_name TYPE string,
          mt_employees TYPE TABLE OF REF TO lcl_employee.


ENDCLASS.

CLASS lcl_department IMPLEMENTATION.
  METHOD constructor.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD set_name.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD get_name.
    rv_name = mv_name.
  ENDMETHOD.

  METHOD add_employee.
    APPEND io_employee TO mt_employees.
  ENDMETHOD.

  METHOD get_avg_salary.
    DATA lv_gesamtgehalt TYPE i VALUE 0.
    DATA lo_wa TYPE REF TO lcl_employee.
    DATA lv_count TYPE i VALUE 0.
    LOOP AT mt_employees INTO lo_wa.
      lv_gesamtgehalt = lv_gesamtgehalt + lo_wa->get_salary( ).
      lv_count = lv_count + 1.
    ENDLOOP.
    rv_avg_salary = lv_gesamtgehalt / lv_count.
  ENDMETHOD.

  METHOD print.
    DATA lo_wa TYPE REF TO lcl_employee.
    FORMAT COLOR 4.
    WRITE: / 'Name der Abteilung:', get_name( ).
    FORMAT RESET.
    ULINE.
    WRITE:   / 'Die Mitarbeiter der Abteilung sind: '.
    ULINE.
    LOOP AT me->mt_employees INTO lo_wa.
      lo_wa->print( ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
