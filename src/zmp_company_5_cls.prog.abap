

INTERFACE li_room_requirement.
  METHODS: get_roomsize RETURNING VALUE(rv_roomsize) TYPE i,
           print_requirement.

ENDINTERFACE.


CLASS lcl_employee DEFINITION ABSTRACT.
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
             print,
             print_type ABSTRACT.
    CLASS-METHODS get_n_o_employees RETURNING VALUE(rv_n_o_employees) TYPE i.
    EVENTS employee_created.

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
    RAISE EVENT employee_created.
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
    / 'Typ: '. print_type( ).
    WRITE:
    / 'Addresse: ', 11 get_address( ),
    / 'Alter: ', 11 get_alter( ) LEFT-JUSTIFIED,
    / 'Gehalt: ', 11 get_salary( ) LEFT-JUSTIFIED.
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


CLASS lcl_office_employee DEFINITION INHERITING FROM lcl_employee.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string
                                   iv_firstname TYPE string
                                   iv_base_salary TYPE i
                                   iv_dob TYPE sy-datum
                                   iv_office TYPE string,
             set_office IMPORTING iv_office TYPE string,
             get_office RETURNING VALUE(rv_office) TYPE string,
             print REDEFINITION,
             print_type REDEFINITION.
    INTERFACES li_room_requirement.

  PRIVATE SECTION.
    DATA: mv_office TYPE string.
ENDCLASS.

CLASS lcl_office_employee IMPLEMENTATION.
  METHOD constructor.
    super->constructor(
      EXPORTING
        iv_name        = iv_name
        iv_firstname   = iv_firstname
        iv_base_salary = iv_base_salary
        iv_dob         = iv_dob
    ).
    set_office( iv_office ).
  ENDMETHOD.

  METHOD li_room_requirement~get_roomsize.
    IF get_salary( ) > 1000.
      rv_roomsize = 2.
    ELSE.
      rv_roomsize = 1.
    ENDIF.
  ENDMETHOD.

  METHOD li_room_requirement~print_requirement.
    WRITE: / 'Der Mitarbeiter'.
    print( ).
    WRITE: /  'hat eine Anforderung der Größe ',
              me->li_room_requirement~get_roomsize( ).

  ENDMETHOD.

  METHOD set_office.
    mv_office = iv_office.
  ENDMETHOD.

  METHOD get_office.
    rv_office = mv_office.
  ENDMETHOD.

  METHOD print_type.
    WRITE: 'intern'.
  ENDMETHOD.

  METHOD print.
    super->print( ).
    WRITE:
    / 'Büroort:', 11 get_office( ).
  ENDMETHOD.
ENDCLASS.


CLASS lcl_field_employee DEFINITION INHERITING FROM lcl_employee.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string
                                   iv_firstname TYPE string
                                   iv_base_salary TYPE i
                                   iv_dob TYPE sy-datum
                                   iv_sales TYPE i
                                   iv_percentage TYPE i,
             set_sales IMPORTING iv_sales TYPE i,
             get_sales RETURNING VALUE(rv_sales) TYPE i,
             set_percentage IMPORTING iv_precentage TYPE i,
             get_percentage RETURNING VALUE(rv_percentage) TYPE i,
             get_salary REDEFINITION,
             print REDEFINITION,
             print_type REDEFINITION.

  PRIVATE SECTION.
    DATA: mv_percentage TYPE i,
          mv_sales TYPE i.
ENDCLASS.

CLASS lcl_field_employee IMPLEMENTATION.
  METHOD constructor.
    super->constructor(
      EXPORTING
        iv_name        = iv_name
        iv_firstname   = iv_firstname
        iv_base_salary = iv_base_salary
        iv_dob         = iv_dob
    ).
    set_sales( iv_sales ).
    set_percentage( iv_percentage ).
  ENDMETHOD.


  METHOD print_type.
    WRITE: 'auswärts'.
  ENDMETHOD.

  METHOD set_sales.
    mv_sales = iv_sales.
  ENDMETHOD.

  METHOD get_sales.
    rv_sales = mv_sales.
  ENDMETHOD.

  METHOD set_percentage.
    mv_percentage = iv_precentage.
  ENDMETHOD.

  METHOD get_percentage.
    rv_percentage = mv_percentage.
  ENDMETHOD.

  METHOD get_salary.
    rv_salary = get_base_salary( ) + ( ( get_sales( ) / 100 ) * get_percentage( ) ).

  ENDMETHOD.

  METHOD print.
    super->print( ).
    WRITE:
    / 'Verkauft:', 11 get_sales( ) LEFT-JUSTIFIED,
    / 'Prozent: ', 11 get_percentage( ) LEFT-JUSTIFIED.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_department DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string,
             set_name     IMPORTING iv_name TYPE string,
             get_name RETURNING VALUE(rv_name) TYPE string,
             add_employee IMPORTING io_employee TYPE REF TO lcl_employee,
             get_avg_salary RETURNING VALUE(rv_avg_salary) TYPE i,
             get_avg_percentage RETURNING VALUE(rv_avg_percentage) TYPE i,
             print,
             on_employee_created FOR EVENT employee_created of lcl_employee
                                            IMPORTING sender.

  PRIVATE SECTION.
    DATA: mv_name TYPE string,
          mt_employees TYPE TABLE OF REF TO lcl_employee.


ENDCLASS.

CLASS lcl_department IMPLEMENTATION.
  METHOD on_employee_created.
    add_employee( sender ).
  ENDMETHOD.

  METHOD constructor.
    mv_name = iv_name.
    SET HANDLER on_employee_created FOR ALL INSTANCES.
  ENDMETHOD.

  METHOD get_avg_percentage.
    DATA: lo_employee TYPE REF TO lcl_employee,
          lo_field_emp TYPE REF TO lcl_field_employee.
    DATA: lv_count TYPE i VALUE 0,
          lv_global_percentage TYPE i.
    LOOP AT mt_employees INTO lo_employee.
      TRY.
          lo_field_emp ?= lo_employee.
          lv_global_percentage = lv_global_percentage + lo_field_emp->get_percentage( ).
          lv_count = lv_count + 1.
        CATCH cx_sy_move_cast_error.
          "FAilor! Kein außendienst...
      ENDTRY.
      rv_avg_percentage = lv_global_percentage / lv_count.

    ENDLOOP.
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
      SKIP.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_building DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_small_rooms TYPE i
                                   iv_medium_rooms TYPE i
                                   iv_large_rooms TYPE i,
             add_requirement IMPORTING ii_room_requirement TYPE REF TO li_room_requirement,
             print_utilization.

  PRIVATE SECTION.
    DATA: mt_requirements TYPE TABLE OF REF TO li_room_requirement,
          mv_small_rooms TYPE i,
          mv_medium_rooms TYPE i,
          mv_large_rooms.
ENDCLASS.

CLASS lcl_building IMPLEMENTATION.
  METHOD constructor.
    mv_small_rooms = iv_small_rooms.
    mv_medium_rooms = iv_medium_rooms.
    mv_large_rooms = iv_large_rooms.
  ENDMETHOD.


  METHOD add_requirement.
    APPEND ii_room_requirement TO mt_requirements.
  ENDMETHOD.

  METHOD print_utilization.
    Data: lv_smallrooms type i,
          lv_mediumrooms TYPE i,
          lv_largerooms type i.
    lv_largerooms = mv_large_rooms.
    lv_mediumrooms = mv_medium_rooms.
    lv_smallrooms = mv_small_rooms.
    WRITE: / 'Folgende Bedarfe gibt es für das Haupthaus:'.
    SKIP.
    ULINE.
    DATA li_wa TYPE REF TO li_room_requirement.
    LOOP AT mt_requirements INTO li_wa.
        li_wa->print_requirement( ).
        skip.
        ULINE (30).
        SKIP.
    ENDLOOP.
    ULINE.
  ENDMETHOD.
ENDCLASS.


CLASS lcl_conference_room DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_name TYPE string.
    INTERFACES li_room_requirement.

  PRIVATE SECTION.
    DATA mv_name  TYPE string.
ENDCLASS.

CLASS lcl_conference_room IMPLEMENTATION.
  METHOD constructor.
    mv_name = iv_name.

  ENDMETHOD.

  METHOD li_room_requirement~get_roomsize.
    rv_roomsize = 3.
  ENDMETHOD.

  METHOD li_room_requirement~print_requirement.
    WRITE: 'Konferenzraum: ', mv_name.
  ENDMETHOD.
ENDCLASS.
