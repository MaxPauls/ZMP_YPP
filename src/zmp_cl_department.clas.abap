class ZMP_CL_DEPARTMENT definition
  public
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IV_NAME type STRING .
  methods SET_NAME
    importing
      !IV_NAME type STRING .
  methods GET_NAME
    returning
      value(RV_NAME) type STRING .
  methods ADD_EMPLOYEE
    importing
      !IO_EMPLOYEE type ref to ZMP_CL_EMPLOYEE .
  methods GET_AVG_SALARY
    returning
      value(RV_AVG_SALARY) type I .
  methods GET_AVG_PERCENTAGE
    returning
      value(RV_AVG_PERCENTAGE) type I .
  methods PRINT .
protected section.
private section.

  data MV_NAME type STRING .
  data:
    mt_employees TYPE TABLE OF REF TO zmp_cl_employee .
ENDCLASS.



CLASS ZMP_CL_DEPARTMENT IMPLEMENTATION.


  method ADD_EMPLOYEE.

    APPEND io_employee TO mt_employees.

  endmethod.


  method CONSTRUCTOR.

    mv_name = iv_name.

  endmethod.


  method GET_AVG_PERCENTAGE.

    DATA: lo_employee TYPE REF TO zmp_cl_employee,
          lo_field_emp TYPE REF TO zmp_cl_field_employee.
    DATA: lv_count TYPE i VALUE 0,
          lv_global_percentage type i.
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

  endmethod.


  method GET_AVG_SALARY.

    DATA lv_gesamtgehalt TYPE i VALUE 0.
    DATA lo_wa TYPE REF TO zmp_cl_employee.
    DATA lv_count TYPE i VALUE 0.
    LOOP AT mt_employees INTO lo_wa.
      lv_gesamtgehalt = lv_gesamtgehalt + lo_wa->get_salary( ).
      lv_count = lv_count + 1.
    ENDLOOP.
    rv_avg_salary = lv_gesamtgehalt / lv_count.

  endmethod.


  method GET_NAME.

    rv_name = mv_name.

  endmethod.


  method PRINT.

    DATA lo_wa TYPE REF TO zmp_cl_employee.
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
    Uline.
    write:/ 'Durchschnittliches Gehalt', get_avg_salary( ).

  endmethod.


  method SET_NAME.

    mv_name = iv_name.

  endmethod.
ENDCLASS.
