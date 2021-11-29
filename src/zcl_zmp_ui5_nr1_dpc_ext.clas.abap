class ZCL_ZMP_UI5_NR1_DPC_EXT definition
  public
  inheriting from ZCL_ZMP_UI5_NR1_DPC
  create public .

public section.
protected section.

  methods PURCHASEORDERSET_GET_ENTITY
    redefinition .
  methods PURCHASEORDERSET_GET_ENTITYSET
    redefinition .
  methods PURCHASEORDERITE_GET_ENTITYSET
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZMP_UI5_NR1_DPC_EXT IMPLEMENTATION.


  METHOD purchaseorderite_get_entityset.
    DATA: lt_items TYPE TABLE OF bapiekpoc,
          ls_entity TYPE LINE OF zcl_zmp_ui5_nr1_mpc=>tt_purchaseorderitems,
          lv_value TYPE ebeln.

    READ TABLE it_key_tab ASSIGNING FIELD-SYMBOL(<fs>) INDEX 1.
    lv_value = <fs>-value.

    CALL FUNCTION 'BAPI_PO_GETITEMS'
      EXPORTING
        purchaseorder = lv_value
      TABLES
        po_items      = lt_items.

    LOOP AT lt_items ASSIGNING FIELD-SYMBOL(<fs2>).
      ls_entity-po_number = <fs2>-po_number.
      ls_entity-po_item = <fs2>-po_item.
      ls_entity-material = <fs2>-material.
      ls_entity-short_text = <fs2>-short_text.
      APPEND ls_entity TO et_entityset.
      CLEAR ls_entity.
    ENDLOOP.

  ENDMETHOD.


  method PURCHASEORDERSET_GET_ENTITY.
**TRY.
*CALL METHOD SUPER->PURCHASEORDERSET_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  IMPORTING
**    er_entity               =
**    es_response_context     =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  METHOD purchaseorderset_get_entityset.
    DATA lt_export TYPE TABLE OF bapiekpoc.
    DATA lt_header TYPE TABLE OF bapiekkol.
    DATA ls_export TYPE zmp_purchaseorder.
*    DATA ls_header TYPE bapiekkol.
    DATA lt_return TYPE TABLE OF bapireturn.

    CALL FUNCTION 'BAPI_PO_GETITEMS'
      EXPORTING
*       PURCHASEORDER   =
        doc_date        = '20170101'
        doc_type        = 'NB'
*       PUR_GROUP       =
*       PURCH_ORG       =
*       VENDOR          =
*       SUPPL_PLANT     =
*       MATERIAL        =
*       MAT_GRP         =
*       ITEM_CAT        =
*       ACCTASSCAT      =
*       PLANT           =
*       TRACKINGNO      =
*       SHORT_TEXT      =
*       CREATED_BY      =
*       PREQ_NAME       = ' '
        with_po_headers = 'X'
*       DELETED_ITEMS   = ' '
*       ITEMS_OPEN_FOR_RECEIPT       = ' '
*       PUR_MAT         = ' '
*       MATERIAL_EVG    =
*       PUR_MAT_EVG     =
      TABLES
        po_headers      = lt_header
        po_items        = lt_export
        return          = lt_return.

    LOOP AT lt_header ASSIGNING FIELD-SYMBOL(<ls_header>).
      ls_export-bestellnummer = <ls_header>-po_number.
      ls_export-lieferantenname = <ls_header>-vend_name.
      ls_export-lieferantennummer = <ls_header>-vendor.
      APPEND ls_export TO et_entityset.
      CLEAR ls_export.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
