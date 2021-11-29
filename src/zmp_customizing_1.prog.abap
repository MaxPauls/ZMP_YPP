*&---------------------------------------------------------------------*
*& Report  ZMP_CUSTOMIZING_1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT ZMP_CUSTOMIZING_1.
Data gs_table type t005.

PARAMETERS gp_lkey type t005-land1.

select single * from t005 into gs_table where land1 = gp_lkey.

*  gs_table-waers = 'EUR'.
*
*MODIFY t005 from gs_table.

write: / 'Währung ist' , gs_table-waers.
