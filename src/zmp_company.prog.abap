*&---------------------------------------------------------------------*
*& Modulpool         ZMP_COMPANY
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*


INCLUDE zmp_company_top                         .    " global Data

* INCLUDE ZMP_COMPANY_O01                         .  " PBO-Modules
* INCLUDE ZMP_COMPANY_I01                         .  " PAI-Modules
* INCLUDE ZMP_COMPANY_F01                         .  " FORM-Routines
DATA: lo_employee TYPE REF TO lcl_employee,
      gt_employees TYPE TABLE OF REF TO lcl_employee.

START-OF-SELECTION.
CREATE OBJECT lo_employee
  EXPORTING
    iv_name        = 'Pauls'
    iv_firstname   = 'Max'
    iv_base_salary = 10000
    iv_dob         = '20190106'.
APPEND lo_employee TO gt_employees.


LOOP AT gt_employees INTO lo_employee.
  lo_employee->print( ).
ENDLOOP.
