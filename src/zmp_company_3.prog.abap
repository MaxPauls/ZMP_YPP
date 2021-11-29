*&---------------------------------------------------------------------*
*& Report  ZMP_COMPANY_3
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_COMPANY_3.
*&---------------------------------------------------------------------*
*& Report  ZMP_COMPANY2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

INCLUDE zmp_company_3_cls                        .    " global Data                        .    " global Data

* INCLUDE ZMP_COMPANY_O01                         .  " PBO-Modules
* INCLUDE ZMP_COMPANY_I01                         .  " PAI-Modules
* INCLUDE ZMP_COMPANY_F01                         .  " FORM-Routines
DATA: go_employee TYPE REF TO lcl_employee,
      go_office_employee TYPE REF TO lcl_office_employee,
      go_field_employee TYPE REF TO lcl_field_employee,
      go_department TYPE REF TO lcl_department.

START-OF-SELECTION.
  CREATE OBJECT go_department
    EXPORTING
      iv_name = 'Abteilung der Käsefighter'.



  CREATE OBJECT go_field_employee
    EXPORTING
      iv_name        = 'Karotte'
      iv_firstname   = 'Hugo'
      iv_base_salary = 2500
      iv_dob         = '19550202'
      iv_sales       = 10000
      iv_percentage  = 5.
  go_field_employee->set_address( 'abc' ).
  go_department->add_employee( io_employee = go_field_employee ).

  CREATE OBJECT go_field_employee
    EXPORTING
      iv_name        = 'Möhre'
      iv_firstname   = 'Rote'
      iv_base_salary = 1000000
      iv_dob         = '19450101'
      iv_sales       = 2500000
      iv_percentage  = 10.
  go_field_employee->set_address( 'def' ).
  go_department->add_employee( io_employee = go_field_employee ).

  CREATE OBJECT go_field_employee
    EXPORTING
      iv_name        = 'Fisch'
      iv_firstname   = 'Roter'
      iv_base_salary = 1000000
      iv_dob         = '19450101'
      iv_sales       = 2500000
      iv_percentage  = 15.
  go_field_employee->set_address( 'ghi' ).
  go_department->add_employee( io_employee = go_field_employee ).

  CREATE OBJECT go_office_employee
    EXPORTING
      iv_name        = 'Bohne'
      iv_firstname   = 'Grüne'
      iv_base_salary = 1000000
      iv_dob         = '19900303'
      iv_office      = 'Berliiiiin'.
  go_field_employee->set_address( 'jkl' ).
  go_department->add_employee( io_employee = go_office_employee ).

  CREATE OBJECT go_office_employee
    EXPORTING
      iv_name        = 'Bohne'
      iv_firstname   = 'Rote'
      iv_base_salary = 366650
      iv_dob         = '19300303'
      iv_office      = 'Biiiiiilefeld'.
  go_field_employee->set_address( 'mno' ).
  go_department->add_employee( io_employee = go_office_employee ).


  go_department->print( ).
  ULINE.

  WRITE: / lcl_employee=>get_n_o_employees( ) LEFT-JUSTIFIED, 'Mitarbeiter mit einem Durchschnitsgehalt von',
    go_department->get_avg_salary( ) LEFT-JUSTIFIED,
    ' und durchschnittlichem Provisionssatz von ',
    go_department->get_avg_percentage( ).
