*&---------------------------------------------------------------------*
*& Report  ZMP_TEST2
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zmp_test2.

Data a type String VALUE 'ichbi?nblöd?unddumm'.
Data b type String.
Data c type String.

SPLIT a at '?' into b c.

WRITE: / a.
WRITE: / b.
WRITE: / c.

DATA ls_spfli type spfli.
DATA lt_spfli type TABLE OF spfli.

Select * from spfli into TABLE lt_spfli.

Read TABLE lt_spfli with KEY  carrid = 'MM' TRANSPORTING NO FIELDS.

WRITE: / sy-tabix.
ls_spfli-carrid = 'XC'.
ls_spfli-connid = '1234'.

INSERT ls_spfli INTO lt_spfli INDEX sy-tabix + 1.

check 1 = 1.
