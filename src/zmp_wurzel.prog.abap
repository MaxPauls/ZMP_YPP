*&---------------------------------------------------------------------*
*& Report  ZMP_WURZEL
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_wurzel.

DATA gv_root TYPE f.

gv_root = sqrt( 2 ).

WRITE / gv_root.
skip.
WRITE AT 4 gv_root.
skip.
WRITE  gv_root DECIMALS 10 EXPONENT 6.
skip.
WRITE 5(5) gv_root.
skip.
WRITE (6) gv_root EXPONENT 0.
SKIP.
