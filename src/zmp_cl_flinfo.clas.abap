class ZMP_CL_FLINFO definition
  public
  final
  create public .

public section.

  class-methods GET_N_O_CONNECTIONS
    importing
      value(IV_CARRID) type S_CARR_ID
    returning
      value(RV_N_O_CONNECTIONS) type I .
  class-methods GET_CONNECTION
    importing
      value(IV_CARRID) type S_CARR_ID
      value(IV_CONNID) type S_CONN_ID
    returning
      value(RV_CONNECTION) type SPFLI
    raising
      ZCX_ZMP_EXCEPTION .
  PROTECTED SECTION.
private section.
ENDCLASS.



CLASS ZMP_CL_FLINFO IMPLEMENTATION.


  METHOD get_connection.
    zmp_cl_singleton=>get_singleton( ).

    READ TABLE zmp_cl_singleton=>mt_connection_list INTO rv_connection WITH KEY carrid = iv_carrid connid = iv_connid.



    IF sy-subrc = 4.
       RAISE EXCEPTION TYPE zcx_zmp_exception
         EXPORTING
           textid    = zcx_zmp_exception=>no_connection
*           previous  =
           mv_carrid = iv_carrid
           mv_connid = iv_connid
       .
    ENDIF.
  ENDMETHOD.


  METHOD get_n_o_connections.
    DATA ls_flight TYPE spfli.
    zmp_cl_singleton=>get_singleton( ).

    LOOP AT zmp_cl_singleton=>mt_connection_list INTO ls_flight.
      IF ls_flight-carrid = iv_carrid.
        rv_n_o_connections = rv_n_o_connections + 1.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
