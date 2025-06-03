*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_abap_behv_msg IMPLEMENTATION.
  METHOD constructor.
    super->constructor( previous = previous ).

    me->msgty = msgty.
    me->msgv1 = msgv1.
    me->msgv2 = msgv2.
    me->msgv3 = msgv3.
    me->msgv4 = msgv4.
    CLEAR me->textid.

    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.


CLASS lcl_prch_buffer DEFINITION FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.
    DATA mt_create_buffer_purchdoc     TYPE zif_hh_prchdc_logic=>tt_purchasedocument.
    DATA mt_update_buffer_purchdoc     TYPE zif_hh_prchdc_logic=>tt_purchasedocument.
    DATA mt_delete_buffer_purchdoc     TYPE zif_hh_prchdc_logic=>tt_purchasedocument.
    DATA mt_create_buffer_purchdocitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem.
    DATA mt_update_buffer_purchdocitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem.
    DATA mt_delete_buffer_purchdocitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem.

    CLASS-METHODS get_instance
      RETURNING VALUE(ro_instance) TYPE REF TO lcl_prch_buffer.

    METHODS buffer_purchdoc_for_create
      IMPORTING it_purchasedocument TYPE zif_hh_prchdc_logic=>tt_purchasedocument
      EXPORTING et_purchasedocument TYPE zif_hh_prchdc_logic=>tt_purchasedocument
                et_messages         TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS buffer_purchdoc_for_delete
      IMPORTING it_purchasedocumentkey TYPE zif_hh_prchdc_logic=>tt_purchasedocumentkey
                it_purchasedocitemkey  TYPE zif_hh_prchdc_logic=>tt_purchdocitem_key
      EXPORTING et_messages            TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS buffer_purchdoc_for_update
      IMPORTING it_purchasedocument TYPE zif_hh_prchdc_logic=>tt_purchasedocument
      EXPORTING et_messages         TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS buffer_purchdocitem_for_create
      IMPORTING it_purchasedocitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem
      EXPORTING et_messages        TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS buffer_purchdocitem_for_update
      IMPORTING it_purchasedocitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem
      EXPORTING et_messages        TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS buffer_purchdocitem_for_delete
      IMPORTING it_purchasedocitemkey TYPE zif_hh_prchdc_logic=>tt_purchdocitem_key
      EXPORTING et_messages           TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS save.
    METHODS initialize.

  PRIVATE SECTION.
    CLASS-DATA go_instance TYPE REF TO lcl_prch_buffer.

    TYPES: BEGIN OF ts_purchasedocument_id,
             purchasedocument TYPE zhh_purchdocdtel,
           END OF ts_purchasedocument_id,
           tt_purchasedocument_id TYPE SORTED TABLE OF ts_purchasedocument_id WITH UNIQUE KEY PurchaseDocument.

    DATA lt_purchasedocument_id TYPE tt_purchasedocument_id.
ENDCLASS.


CLASS lcl_prch_buffer IMPLEMENTATION.
  METHOD get_instance.
    go_instance = COND #( WHEN go_instance IS BOUND THEN go_instance ELSE NEW #( ) ).
    ro_instance = go_instance.
  ENDMETHOD.

  METHOD buffer_purchdoc_for_create.
    CLEAR: et_purchasedocument,
           et_messages,
           lt_purchasedocument_id.

    IF it_purchasedocument IS INITIAL.
      RETURN.
    ENDIF.

    SELECT FROM zhh_purchdoc
      FIELDS PurchaseDocument
      FOR ALL ENTRIES IN @it_purchasedocument
      WHERE PurchaseDocument = @it_purchasedocument-PurchaseDocument
      INTO CORRESPONDING FIELDS OF TABLE @lt_purchasedocument_id.

    LOOP AT it_purchasedocument INTO DATA(ls_purchdoc_create).
      IF ls_purchdoc_create-PurchaseDocument IS INITIAL.
        APPEND NEW zcx_hh_purchdoc_excptns( textid              = zcx_hh_purchdoc_excptns=>purchasedocintial
                                            mv_purchasedocument = ls_purchdoc_create-PurchaseDocument )
               TO et_messages.
        initialize( ).
        RETURN.
      ENDIF.

      IF line_exists( mt_create_buffer_purchdoc[ PurchaseDocument = ls_purchdoc_create-PurchaseDocument ] ).
        APPEND NEW zcx_hh_purchdoc_excptns( textid              = zcx_hh_purchdoc_excptns=>purchasedocexitsinbuffer
                                            mv_purchasedocument = ls_purchdoc_create-PurchaseDocument )
               TO et_messages.
        initialize( ).
        RETURN.
      ENDIF.

      INSERT ls_purchdoc_create INTO TABLE mt_create_buffer_purchdoc.
    ENDLOOP.

    et_purchasedocument = mt_create_buffer_purchdoc.
  ENDMETHOD.

  METHOD buffer_purchdoc_for_delete.
    CLEAR et_messages.
    IF it_purchasedocumentkey IS INITIAL.
      RETURN.
    ENDIF.

    MOVE-CORRESPONDING it_purchasedocumentkey TO mt_delete_buffer_purchdoc.
    MOVE-CORRESPONDING it_purchasedocitemkey TO mt_delete_buffer_purchdocitem.
  ENDMETHOD.

  METHOD buffer_purchdoc_for_update.
    CLEAR et_messages.
    IF it_purchasedocument IS INITIAL.
      RETURN.
    ENDIF.

    MOVE-CORRESPONDING it_purchasedocument TO mt_update_buffer_purchdoc.
  ENDMETHOD.

  METHOD buffer_purchdocitem_for_create.
    CLEAR et_messages.
    IF it_purchasedocitem IS INITIAL.
      RETURN.
    ENDIF.
    MOVE-CORRESPONDING it_purchasedocitem TO mt_create_buffer_purchdocitem.
  ENDMETHOD.

  METHOD buffer_purchdocitem_for_delete.
    CLEAR et_messages.
    IF it_purchasedocitemkey IS INITIAL.
      RETURN.
    ENDIF.
    MOVE-CORRESPONDING it_purchasedocitemkey TO mt_delete_buffer_purchdocitem.
  ENDMETHOD.

  METHOD buffer_purchdocitem_for_update.
    CLEAR et_messages.
    IF it_purchasedocitem IS INITIAL.
      RETURN.
    ENDIF.
    MOVE-CORRESPONDING it_purchasedocitem TO mt_update_buffer_purchdocitem.
  ENDMETHOD.

  METHOD initialize.
    CLEAR: mt_create_buffer_purchdoc,
           mt_update_buffer_purchdoc,
           mt_delete_buffer_purchdoc,
           mt_create_buffer_purchdocitem,
           mt_update_buffer_purchdocitem,
           mt_delete_buffer_purchdocitem.
  ENDMETHOD.

  METHOD save.
    INSERT zhh_purchdoc FROM TABLE @mt_create_buffer_purchdoc.
    UPDATE zhh_purchdoc FROM TABLE @mt_update_buffer_purchdoc.
    DELETE zhh_purchdoc FROM TABLE @( CORRESPONDING #( mt_delete_buffer_purchdoc ) ).

    INSERT zhh_purchdocitem FROM TABLE @mt_create_buffer_purchdocitem.
    UPDATE zhh_purchdocitem FROM TABLE @mt_update_buffer_purchdocitem.
    DELETE zhh_purchdocitem FROM TABLE @( CORRESPONDING #( mt_delete_buffer_purchdocitem ) ).
  ENDMETHOD.
ENDCLASS.
