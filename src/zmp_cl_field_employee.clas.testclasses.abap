
CLASS zmp_fieldstaff_test2 DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
.
*?﻿<asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">
*?<asx:values>
*?<TESTCLASS_OPTIONS>
*?<TEST_CLASS>zmp_Fieldstaff_Test2
*?</TEST_CLASS>
*?<TEST_MEMBER>f_Cut
*?</TEST_MEMBER>
*?<OBJECT_UNDER_TEST>ZMP_CL_FIELD_EMPLOYEE
*?</OBJECT_UNDER_TEST>
*?<OBJECT_IS_LOCAL/>
*?<GENERATE_FIXTURE/>
*?<GENERATE_CLASS_FIXTURE/>
*?<GENERATE_INVOCATION/>
*?<GENERATE_ASSERT_EQUAL>X
*?</GENERATE_ASSERT_EQUAL>
*?</TESTCLASS_OPTIONS>
*?</asx:values>
*?</asx:abap>
  PRIVATE SECTION.
    DATA:
      f_cut TYPE REF TO zmp_cl_field_employee.  "class under test
    DATA lv_employee TYPE REF TO zmp_cl_field_employee.

    METHODS: get_percentage FOR TESTING.
    METHODS: setup.
    methods: get_Salary for testing.
*    methods: get_Sales for testing.
*    methods: print for testing.
*    methods: set_Percentage for testing.
*    methods: set_Sales for testing.
ENDCLASS.       "zmp_Fieldstaff_Test2


CLASS zmp_fieldstaff_test2 IMPLEMENTATION.

  METHOD setup.

    lv_employee = NEW zmp_cl_field_employee(
        iv_name        = 'asd'
        iv_base_salary = '100'
        iv_addresse    = 'asdf'
        iv_dob         = '01011991'
        iv_sales       = 500
        iv_percentage  = 10
    ).
  ENDMETHOD.


  METHOD get_percentage.


    cl_abap_unit_assert=>assert_equals(
      act   = lv_employee->get_percentage( )
      exp   = 10 "<--- please adapt expected value
      msg   = 'Testing value 5'
*     level =
    ).
  ENDMETHOD.



  METHOD get_salary.

    cl_abap_unit_assert=>assert_equals(
      act   = lv_employee->get_salary( )
      exp   = 130          "<--- please adapt expected value
      msg   = 'Testing value rv_Salary'
*     level =
    ).
  ENDMETHOD.

*
*  method get_Sales.
*
*
*
*
*    cl_Abap_Unit_Assert=>assert_Equals(
*      act   = lv_employee->get_sales( )
*      exp   = 500          "<--- please adapt expected value
*    " msg   = 'Testing value rv_Sales'
**     level =
*    ).
*  endmethod.
*
*
*  method print.
*
*
*
*
*  endmethod.
*
*
*  method set_Percentage.
*
*
*
*
*  endmethod.
*
*
*  method set_Sales.
*
*
*
*
*  endmethod.
*



ENDCLASS.
