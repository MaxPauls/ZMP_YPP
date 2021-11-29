*&---------------------------------------------------------------------*
*& Report  ZMP_COMPANY2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zmp_company2.

INCLUDE zmp_include_classes                        .    " global Data                        .    " global Data

* INCLUDE ZMP_COMPANY_O01                         .  " PBO-Modules
* INCLUDE ZMP_COMPANY_I01                         .  " PAI-Modules
* INCLUDE ZMP_COMPANY_F01                         .  " FORM-Routines
DATA: lo_employee TYPE REF TO lcl_employee,
      go_department TYPE REF TO lcl_department.

START-OF-SELECTION.
  CREATE OBJECT go_department
    EXPORTING
      iv_name = 'Abteilung der Käsefighter'.

  CREATE OBJECT lo_employee
    EXPORTING
      iv_name        = 'Pauls'
      iv_firstname   = 'Max'
      iv_base_salary = 10000
      iv_dob         = '19910106'.
  lo_employee->set_address( 'Berliner Brücke 10' ).
  go_department->add_employee( lo_employee ).

  CREATE OBJECT lo_employee
    EXPORTING
      iv_name        = 'Adler'
      iv_firstname   = 'Kai'
      iv_base_salary = -3
      iv_dob         = '20000205'.
  lo_employee->set_address( 'Horstallee 13' ).
  go_department->add_employee( lo_employee ).

  CREATE OBJECT lo_employee
    EXPORTING
      iv_name        = 'Schlüpfer'
      iv_firstname   = 'Rosa'
      iv_base_salary = 1000
      iv_dob         = '19000506'.
  lo_employee->set_address( 'Zwischen den Backen 3' ).
  go_department->add_employee( lo_employee ).

  go_department->print( ).
uline.

  WRITE: / lcl_employee=>get_n_o_employees( ) LEFT-JUSTIFIED, 'Mitarbeiter mit einem Durchschnitsgehalt von', go_department->get_avg_salary( ) LEFT-JUSTIFIED.
