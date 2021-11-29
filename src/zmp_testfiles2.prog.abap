*&---------------------------------------------------------------------*
*& Modulpool         ZMP_TESTFILES2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

Report ZMP_TESTFILES2.
class Z_MYCLASS definition.
   public section.
   data r_it_mytable type ref to DATA. "use generic TYPE REF TO DATA
   methods constructor importing i_tab_type type any.
endclass.
class Z_MYCLASS implementation.
   method constructor.
      "create a pointer to a table of type passed by parameter
      create data R_IT_MYTABLE type table of (I_TAB_TYPE).
   endmethod.
endclass.
start-of-selection.
   data gr_myclass type ref to z_myclass.

   create object gr_myclass exporting i_tab_type = 'SFLIGHT'.
   Check 1 = 1.
