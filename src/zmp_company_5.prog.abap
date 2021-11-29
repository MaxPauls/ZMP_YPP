*&---------------------------------------------------------------------*
*& Report  ZMP_COMPANY_5
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_COMPANY_5.

INCLUDE ZMP_COMPANY_5_CLS.

DATA: go_building TYPE REF TO lcl_building,
      go_conference_room TYPE REF TO lcl_conference_room,
      go_office_employee TYPE REF TO lcl_office_employee,
      go_department TYPE REF TO lcl_department.

START-OF-SELECTION.
CREATE OBJECT go_department
  EXPORTING
    iv_name = 'asdff'
  .


CREATE OBJECT go_building
  EXPORTING
    iv_small_rooms  = 1
    iv_medium_rooms = 1
    iv_large_rooms  = 2
  .
CREATE OBJECT go_office_employee
    EXPORTING
      iv_name        = 'Bohne'
      iv_firstname   = 'Grüne'
      iv_base_salary = 500
      iv_dob         = '19900303'
      iv_office      = 'Berliiiiin'.
  go_office_employee->set_address( 'jkl' ).
  go_building->add_requirement( go_office_employee ).

  CREATE OBJECT go_office_employee
    EXPORTING
      iv_name        = 'Bohne'
      iv_firstname   = 'Grüne'
      iv_base_salary = 500
      iv_dob         = '19900303'
      iv_office      = 'Berliiiiin'.
  go_office_employee->set_address( 'jkl' ).
  go_building->add_requirement( go_office_employee ).

  CREATE OBJECT go_office_employee
    EXPORTING
      iv_name        = 'Bohne'
      iv_firstname   = 'Rote'
      iv_base_salary = 366650
      iv_dob         = '19300303'
      iv_office      = 'Biiiiiilefeld'.
  go_office_employee->set_address( 'mno' ).
  go_building->add_requirement( go_office_employee ).

  CREATE OBJECT go_conference_room
    EXPORTING
      iv_name     = 'Konferenzraum: Raum der Stille'
    .
  go_building->add_requirement( go_conference_room ).

  CREATE OBJECT go_office_employee
    EXPORTING
      iv_name        = 'Bohne'
      iv_firstname   = 'Rote'
      iv_base_salary = 366650
      iv_dob         = '19300303'
      iv_office      = 'Biiiiiilefeld'.
  go_office_employee->set_address( 'mno' ).
  go_building->add_requirement( go_office_employee ).

  CREATE OBJECT go_conference_room
    EXPORTING
      iv_name     = 'Schuhschrank: Kartoffelschälerraum'
    .
  go_building->add_requirement( go_conference_room ).

  CREATE OBJECT go_conference_room
    EXPORTING
      iv_name     = 'Zweibettzimmer'
    .
  go_building->add_requirement( go_conference_room ).

*  go_building->print_utilization( ).

  go_department->print( ).
