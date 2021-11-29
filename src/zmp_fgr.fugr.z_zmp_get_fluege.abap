FUNCTION z_zmp_get_fluege.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(I_CARRID) TYPE  SPFLI-CARRID
*"  EXPORTING
*"     REFERENCE(E_LISTE) TYPE  ZMP_T_FLISTE
*"  EXCEPTIONS
*"      SQL_ERROR
*"      NO_AUTH
*"----------------------------------------------------------------------
  AUTHORITY-CHECK OBJECT 'S_CARRID'
           ID 'CARRID' FIELD i_carrid
           ID 'ACTVT' FIELD '03'.
  IF sy-subrc <> 0.
    Raise no_auth.
  ENDIF.




  SELECT  *
    FROM spfli
    INTO TABLE e_liste
    WHERE carrid = i_carrid.

  IF sy-subrc <> 0.
    RAISE sql_error.
  ENDIF.



ENDFUNCTION.
