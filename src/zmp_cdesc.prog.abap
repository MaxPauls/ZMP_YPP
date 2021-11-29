*&---------------------------------------------------------------------*
*& Report  ZMP_CDESC
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_cdesc.

INCLUDE zmp_include_classes_2.

DATA go_office_employee TYPE REF TO lcl_office_employee.
DATA go_employee TYPE REF TO lcl_employee.
DATA gr_desc TYPE REF TO cl_abap_classdescr.

START-OF-SELECTION.
  CREATE OBJECT go_office_employee
    EXPORTING
      iv_name        = 'Pauls'
      iv_firstname   = 'Max'
      iv_base_salary = 123456
      iv_dob         = '01011991'
      iv_office      = 'Bielefeld'.

  go_employee = go_office_employee.


  gr_desc ?= cl_abap_typedescr=>describe_by_object_ref( go_employee ).

  WRITE: / gr_desc->get_relative_name( ).
  WRITE: / gr_desc->get_super_class_type( )->get_relative_name( ).
  WRITE: / gr_desc->get_super_class_type( )->get_super_class_type( )->get_relative_name( ).
