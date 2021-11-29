*&---------------------------------------------------------------------*
*& Report  ZMP_SINGLETON
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_singleton.

DATA lo_singleton1 TYPE REF TO zmp_cl_singleton.
DATA lo_singleton2 TYPE REF TO zmp_cl_singleton.

lo_singleton1 = zmp_cl_singleton=>get_singleton( ).
lo_singleton2 = zmp_cl_singleton=>get_singleton( ).
CHECK 1 = 1.
