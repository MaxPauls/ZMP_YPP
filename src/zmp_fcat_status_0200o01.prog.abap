*----------------------------------------------------------------------*
***INCLUDE ZMP_FCAT_STATUS_0200O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_0200  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
  SET PF-STATUS '0200'.
*  SET TITLEBAR 'xxx'.

  SELECT * FROM scustom JOIN sbook ON scustom~id = sbook~customid
    INTO CORRESPONDING FIELDS OF TABLE gt_bookings
    WHERE sbook~agencynum = stravelag-agencynum.

  IF gr_containter IS INITIAL.
    gs_fcat-fieldname = 'NAME'.
    gs_fcat-ref_field = 'NAME'.
    gs_fcat-ref_table = 'SCUSTOM'.
    gs_fcat-outputlen = 15.
    INSERT gs_fcat INTO TABLE gt_fcat.

    gs_fcat-fieldname = 'CITY'.
    gs_fcat-ref_field = 'CITY'.
    gs_fcat-ref_table = 'SCUSTOM'.
    gs_fcat-outputlen = 10.
    INSERT gs_fcat INTO TABLE gt_fcat.

    gs_fcat-fieldname = 'COUNTRY'.
    gs_fcat-ref_field = 'COUNTRY'.
    gs_fcat-ref_table = 'SCUSTOM'.
    INSERT gs_fcat INTO TABLE gt_fcat.

    gr_containter = NEW cl_gui_custom_container( container_name = 'MY_AREA' ).
    gr_alv = NEW cl_gui_alv_grid( i_parent = gr_containter ).

    SET HANDLER lcl_event_handler=>on_double_click FOR gr_alv.

    gr_alv->set_table_for_first_display( EXPORTING i_structure_name  =  'SBOOK'
                                         CHANGING it_outtab = gt_bookings it_fieldcatalog = gt_fcat ).
  ELSE.
    gr_alv->refresh_table_display( ).

  ENDIF.









ENDMODULE.                 " STATUS_0200  OUTPUT
