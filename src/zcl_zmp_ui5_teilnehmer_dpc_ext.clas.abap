class ZCL_ZMP_UI5_TEILNEHMER_DPC_EXT definition
  public
  inheriting from ZCL_ZMP_UI5_TEILNEHMER_DPC
  create public .

public section.
protected section.

  methods ZMP_ALLETEILNEHM_CREATE_ENTITY
    redefinition .
  methods ZMP_ALLETEILNEHM_DELETE_ENTITY
    redefinition .
  methods ZMP_ALLETEILNEHM_GET_ENTITY
    redefinition .
  methods ZMP_ALLETEILNEHM_GET_ENTITYSET
    redefinition .
  methods ZMP_ALLETEILNEHM_UPDATE_ENTITY
    redefinition .
  methods DUMPSSET_GET_ENTITYSET
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZMP_UI5_TEILNEHMER_DPC_EXT IMPLEMENTATION.


  METHOD dumpsset_get_entityset.

  ENDMETHOD.


  METHOD zmp_alleteilnehm_create_entity.
    DATA: ls_wa TYPE zmp_t_teilnehmer.
    DATA: lv_id TYPE zmp_t_teilnehmer-id.

    io_data_provider->read_entry_data(
      IMPORTING
        es_data                      = er_entity
    ).

    SELECT MAX( id ) FROM zmp_t_teilnehmer INTO lv_id.

      lv_id = lv_id + 1.
      ls_wa-geburtsdatum = er_entity-geburtsdatum.
      ls_wa-fachbereich = er_entity-fachbereich.
      ls_wa-name = er_entity-name.
      ls_wa-id = lv_id.
      INSERT zmp_t_teilnehmer FROM ls_wa.
      CLEAR ls_wa.
    ENDMETHOD.


  method ZMP_ALLETEILNEHM_DELETE_ENTITY.
    read table it_key_tab index 1 ASSIGNING FIELD-SYMBOL(<key>).
    Delete from zmp_t_teilnehmer where name = <key>-value.
  endmethod.


  METHOD zmp_alleteilnehm_get_entity.
    DATA ls_wa TYPE zmp_t_teilnehmer.
    READ TABLE it_key_tab INDEX 1 ASSIGNING FIELD-SYMBOL(<key>).


    SELECT SINGLE * FROM zmp_t_teilnehmer INTO ls_wa WHERE name = <key>-value.
    er_entity-fachbereich = ls_wa-fachbereich.
    er_entity-name = ls_wa-name.
    er_entity-geburtsdatum = ls_wa-geburtsdatum.

  ENDMETHOD.


  METHOD zmp_alleteilnehm_get_entityset.
    DATA: ls_teilnehmer TYPE zmp_s_teilnehmer,
          lt_teilnehmer TYPE TABLE OF zmp_t_teilnehmer.
    SELECT * FROM zmp_t_teilnehmer INTO TABLE lt_teilnehmer.

    LOOP AT lt_teilnehmer ASSIGNING FIELD-SYMBOL(<teilnehmer>).
      ls_teilnehmer-name = <teilnehmer>-name.
      ls_teilnehmer-geburtsdatum = <teilnehmer>-geburtsdatum.
      ls_teilnehmer-fachbereich = <teilnehmer>-fachbereich.
      APPEND ls_teilnehmer TO et_entityset.
      CLEAR ls_teilnehmer.
    ENDLOOP.
  ENDMETHOD.


  METHOD zmp_alleteilnehm_update_entity.
    DATA: ls_wa TYPE zmp_t_teilnehmer.
    DATA: lv_id TYPE zmp_t_teilnehmer-id.

    io_data_provider->read_entry_data(
      IMPORTING
        es_data                      = er_entity
    ).

    Select single id from zmp_t_teilnehmer into lv_id where name = er_entity-name.

    ls_wa-geburtsdatum = er_entity-geburtsdatum.
    ls_wa-fachbereich = er_entity-fachbereich.
    ls_wa-name = er_entity-name.
    ls_wa-id = lv_id.
    MODIFY zmp_t_teilnehmer FROM ls_wa.
    CLEAR ls_wa.
  ENDMETHOD.
ENDCLASS.
