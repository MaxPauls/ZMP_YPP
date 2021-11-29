*&---------------------------------------------------------------------*
*& Report  ZMP_COMPANY_GLOBAL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_COMPANY_GLOBAL.

DATA: go_department TYPE REF TO zmp_cl_department,
      go_office_employee TYPE REF TO zmp_cl_office_employee,
      go_field_employee TYPE REF TO zmp_cl_field_employee.

CREATE OBJECT go_department
  EXPORTING
    iv_name = 'Tolle Abteilung'.

CREATE OBJECT go_field_employee
  EXPORTING
    iv_name        = 'Hugo'
    iv_base_salary = 10000
    iv_addresse    = 'Keks'
    iv_dob         = '19000101'
    iv_sales       = 300000
    iv_percentage  = 10.

CREATE OBJECT go_office_employee
  EXPORTING
    iv_name        = 'Martha'
    iv_addresse    = 'Brutto'
    iv_dob         = '19000101'
    iv_base_salary = 1000
    iv_office      = 'Büroooo'.

CALL METHOD go_department->add_employee
  EXPORTING
    io_employee = go_field_employee.


go_department->add_employee( io_employee = go_office_employee ).

go_department->print( ).
