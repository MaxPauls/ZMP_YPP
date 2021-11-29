class ZMP_CL_PERSON definition
  public
  create public .

public section.

  methods CONSTRUCTOR
    importing
      value(IV_NAME) type STRING
      value(IV_ADDRESSE) type STRING
      value(IV_DOB) type DATS .
  methods GET_NAME
    returning
      value(RV_NAME) type STRING .
  methods SET_NAME
    importing
      value(IV_NAME) type STRING .
  methods SET_DOB
    importing
      value(IV_DOB) type DATS .
  methods GET_DOB
    returning
      value(RV_DOB) type DATS .
  methods SET_ADDRESS
    importing
      value(IV_ADDRESS) type STRING .
  methods GET_ADDRESS
    returning
      value(RV_ADDRESSE) type STRING .
protected section.
private section.

  data MV_NAME type STRING .
  data MV_DOB type DATS .
  data MV_ADRESSE type STRING .
ENDCLASS.



CLASS ZMP_CL_PERSON IMPLEMENTATION.


  method CONSTRUCTOR.
    mv_name = iv_name.
    mv_adresse = iv_addresse.
    mv_dob = iv_dob.
  endmethod.


  METHOD GET_ADDRESS.
    rv_addresse = mv_adresse.
  ENDMETHOD.


  METHOD GET_DOB.
    rv_dob = mv_dob.
  ENDMETHOD.


  METHOD GET_NAME.
    rv_name = mv_name.
  ENDMETHOD.


  METHOD SET_ADDRESS.
    mv_adresse = iv_address.
  ENDMETHOD.


  METHOD SET_DOB.
    mv_dob = iv_dob.
  ENDMETHOD.


  METHOD SET_NAME.
    mv_name = iv_name.
  ENDMETHOD.
ENDCLASS.
