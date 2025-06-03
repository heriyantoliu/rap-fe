CLASS zcl_hh_prchdc_logic DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_hh_prchdc_logic.

    TYPES: BEGIN OF ENUM ty_change_mode STRUCTURE change_mode,
             create,
             update,
           END OF ENUM ty_change_mode STRUCTURE change_mode.

    TYPES tt_message TYPE TABLE OF symsg.

    DATA mt_update_buffer_purchdoc     TYPE zif_hh_prchdc_logic=>tt_purchasedocument.
    DATA mt_update_buffer_purchdocitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem.

    CLASS-METHODS
      get_instance
        RETURNING VALUE(ro_instance) TYPE REF TO zcl_hh_prchdc_logic.

    METHODS create_purchasedocument
      IMPORTING it_purchasedocument TYPE zif_hh_prchdc_logic=>tt_purchasedocument
      EXPORTING et_messages         TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS delete_purchasedocument
      IMPORTING it_purchasedocumentkey TYPE zif_hh_prchdc_logic=>tt_purchasedocumentkey
                it_purchdocitemkey     TYPE zif_hh_prchdc_logic=>tt_purchdocitem_key
      EXPORTING et_messages            TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS update_purchasedocument
      IMPORTING it_purchasedocument     TYPE zif_hh_prchdc_logic=>tt_purchasedocument
                it_purchdocumentcontrol TYPE zif_hh_prchdc_logic=>tt_purchdocumentcontrol
      EXPORTING et_messages             TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS create_purchasedocitem
      IMPORTING it_purchasedocitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem
      EXPORTING et_messages        TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS delete_purchasedocitem
      IMPORTING it_purchasedocitemkey TYPE zif_hh_prchdc_logic=>tt_purchdocitem_key
      EXPORTING et_messages           TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    METHODS update_purchasedocitem
      IMPORTING it_purchdocitem        TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem
                it_purchdocitemcontrol TYPE zif_hh_prchdc_logic=>tt_purchdocumentitemcontrol
      EXPORTING et_messages            TYPE zif_hh_prchdc_logic=>tt_if_t100_message.

    CLASS-METHODS map_purchdoc_cds_to_db
      IMPORTING is_i_purchdoc_u    TYPE ZI_HH_PurchaseDocument_U
      RETURNING VALUE(rs_purchdoc) TYPE zif_hh_prchdc_logic=>ts_purchasedocument.

    CLASS-METHODS map_purchdocitem_cds_to_db
      IMPORTING is_i_purchdocitem_u    TYPE zi_hh_purchasedocumentitem_u
      RETURNING VALUE(rs_purchdocitem) TYPE zif_hh_prchdc_logic=>ts_purchasedocitem.

    CLASS-METHODS map_purchasedoc_message
      IMPORTING iv_cid              TYPE string           OPTIONAL
                iv_purchasedocument TYPE zhh_purchdocdtel OPTIONAL
                is_message          TYPE LINE OF zif_hh_prchdc_logic=>tt_if_t100_message
                is_messagetype      TYPE symsgty
      RETURNING VALUE(rs_report)    TYPE LINE OF zif_hh_prchdc_logic=>tt_purchasedocument_reported.

    METHODS save.
    METHODS initialize.

  PRIVATE SECTION.
    CLASS-DATA go_instance TYPE REF TO zcl_hh_prchdc_logic.

    CLASS-METHODS
      new_message
        IMPORTING !id        TYPE symsgid
                  !number    TYPE symsgno
                  severity   TYPE if_abap_behv_message=>t_severity
                  v1         TYPE simple OPTIONAL
                  v2         TYPE simple OPTIONAL
                  v3         TYPE simple OPTIONAL
                  v4         TYPE simple OPTIONAL
        RETURNING VALUE(obj) TYPE REF TO if_abap_behv_message.
ENDCLASS.


CLASS zcl_hh_prchdc_logic IMPLEMENTATION.
  METHOD get_instance.
    go_instance = COND #( WHEN go_instance IS BOUND THEN go_instance ELSE NEW #( ) ).
    ro_instance = go_instance.
  ENDMETHOD.

  METHOD create_purchasedocument.
    CLEAR et_messages.
    lcl_prch_buffer=>get_instance( )->buffer_purchdoc_for_create( EXPORTING it_purchasedocument = it_purchasedocument
                                                                  IMPORTING et_messages         = et_messages ).
  ENDMETHOD.

  METHOD delete_purchasedocument.
    lcl_prch_buffer=>get_instance( )->buffer_purchdoc_for_delete(
      EXPORTING it_purchasedocumentkey = it_purchasedocumentkey
                it_purchasedocitemkey  = it_purchdocitemkey
      IMPORTING et_messages            = et_messages ).
  ENDMETHOD.

  METHOD update_purchasedocument.
    DATA lt_purchasedocument_db TYPE zif_hh_prchdc_logic=>tt_purchasedocument.

    FIELD-SYMBOLS <fs_purchdocument_buffer> TYPE zhh_purchdoc.

    SELECT * FROM zhh_purchdoc
      FOR ALL ENTRIES IN @it_purchasedocument
      WHERE PurchaseDocument = @it_purchasedocument-PurchaseDocument
      INTO TABLE @lt_purchasedocument_db.

    LOOP AT it_purchasedocument ASSIGNING FIELD-SYMBOL(<fs_purchasedocument_current>).
      READ TABLE lt_purchasedocument_db INTO DATA(ls_purchasedocument_db)
           WITH KEY PurchaseDocument = <fs_purchasedocument_current>-PurchaseDocument.
      IF sy-subrc = 0.
        INSERT ls_purchasedocument_db INTO TABLE mt_update_buffer_purchdoc ASSIGNING <fs_purchdocument_buffer>.
      ENDIF.

      ASSIGN it_purchdocumentcontrol[ PurchaseDocument = <fs_purchasedocument_current>-PurchaseDocument ] TO FIELD-SYMBOL(<fs_purchasedocumentcontrol>).

      DATA lv_field TYPE i.
      lv_field = 2.
      DO.
        ASSIGN COMPONENT lv_field OF STRUCTURE <fs_purchasedocumentcontrol> TO FIELD-SYMBOL(<v_flag>).
        IF sy-subrc <> 0.
          EXIT.
        ENDIF.

        IF <v_flag> = abap_true.
          ASSIGN COMPONENT lv_field OF STRUCTURE <fs_purchasedocument_current> TO FIELD-SYMBOL(<v_field_current>).
          ASSERT sy-subrc = 0.
          ASSIGN COMPONENT lv_field OF STRUCTURE <fs_purchdocument_buffer> TO FIELD-SYMBOL(<v_field_db>).
          ASSERT sy-subrc = 0.
          <v_field_db> = <v_field_current>.
        ENDIF.
        lv_field += 1.
      ENDDO.
    ENDLOOP.

    lcl_prch_buffer=>get_instance( )->buffer_purchdoc_for_update(
      EXPORTING it_purchasedocument = mt_update_buffer_purchdoc
      IMPORTING et_messages         = et_messages ).
  ENDMETHOD.

  METHOD create_purchasedocitem.
    lcl_prch_buffer=>get_instance( )->buffer_purchdocitem_for_create( EXPORTING it_purchasedocitem = it_purchasedocitem
                                                                      IMPORTING et_messages        = et_messages ).
  ENDMETHOD.

  METHOD delete_purchasedocitem.
    lcl_prch_buffer=>get_instance( )->buffer_purchdocitem_for_delete(
      EXPORTING it_purchasedocitemkey = it_purchasedocitemkey
      IMPORTING et_messages           = et_messages ).
  ENDMETHOD.

  METHOD update_purchasedocitem.
    DATA lt_purchdocitem_db TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem.

    FIELD-SYMBOLS <fs_purchdocitem_buffer> TYPE zhh_purchdocitem.

    SELECT * FROM zhh_purchdocitem
      FOR ALL ENTRIES IN @it_purchdocitem
      WHERE PurchaseDocument     = @it_purchdocitem-PurchaseDocument
        AND PurchaseDocumentItem = @it_purchdocitem-PurchaseDocumentItem
      INTO TABLE @lt_purchdocitem_db.

    LOOP AT it_purchdocitem ASSIGNING FIELD-SYMBOL(<fs_purchdocitem_current>).
      READ TABLE lt_purchdocitem_db INTO DATA(ls_purchdocitem_db)
           WITH KEY PurchaseDocument     = <fs_purchdocitem_current>-PurchaseDocument
                    PurchaseDocumentItem = <fs_purchdocitem_current>-PurchaseDocumentItem.
      IF sy-subrc = 0.
        INSERT ls_purchdocitem_db INTO TABLE mt_update_buffer_purchdocitem ASSIGNING <fs_purchdocitem_buffer>.
      ENDIF.

      ASSIGN it_purchdocitemcontrol[ PurchaseDocument     = <fs_purchdocitem_current>-PurchaseDocument
                                     PurchaseDocumentItem = <fs_purchdocitem_current>-PurchaseDocumentItem ] TO FIELD-SYMBOL(<fs_purchdocitemcontrol>).

      DATA lv_field TYPE i.
      lv_field = 2.
      DO.
        ASSIGN COMPONENT lv_field OF STRUCTURE <fs_purchdocitemcontrol> TO FIELD-SYMBOL(<v_flag>).
        IF sy-subrc <> 0.
          EXIT.
        ENDIF.

        IF <v_flag> = abap_true.
          ASSIGN COMPONENT lv_field OF STRUCTURE <fs_purchdocitem_current> TO FIELD-SYMBOL(<v_field_current>).
          ASSERT sy-subrc = 0.
          ASSIGN COMPONENT lv_field OF STRUCTURE <fs_purchdocitem_buffer> TO FIELD-SYMBOL(<v_field_db>).
          ASSERT sy-subrc = 0.
          <v_field_db> = <v_field_current>.
        ENDIF.
        lv_field += 1.
      ENDDO.
    ENDLOOP.

    lcl_prch_buffer=>get_instance( )->buffer_purchdocitem_for_update(
      EXPORTING it_purchasedocitem = mt_update_buffer_purchdocitem
      IMPORTING et_messages        = et_messages ).
  ENDMETHOD.

  METHOD map_purchasedoc_message.
    data: ls_message type line of tt_message.
    move-CORRESPONDING is_message->t100key to ls_message.
    ls_message-msgty = is_messagetype.
    ls_message-msgv1 = iv_purchasedocument.
    DATA(lo) = new_message( id       = ls_message-msgid
                            number   = ls_message-msgno
                            severity = if_abap_behv_message=>severity-error
                            v1       = ls_message-msgv1
                            v2       = ls_message-msgv2
                            v3       = ls_message-msgv3
                            v4       = ls_message-msgv4 ).
    rs_report-%cid     = iv_cid.
    rs_report-PurchaseDocument = iv_purchasedocument.
    rs_report-%msg     = lo.
  ENDMETHOD.

  METHOD map_purchdocitem_cds_to_db.
    rs_purchdocitem = CORRESPONDING #( is_i_purchdocitem_u MAPPING  purchasedocument             = PurchaseDocument
                                                                    crea_date_time               = crea_date_time
                                                                    crea_uname                   = crea_uname
                                                                    description                  = Description
                                                                    lchg_date_time               = lchg_date_time
                                                                    lchg_uname                   = lchg_uname
                                                                    purchasedocumentitem         = PurchaseDocumentItem
                                                                    quantity                     = Quantity
                                                                    quantityunit                 = QuantityUnit
                                                                    vendor                       = Vendor
                                                                    vendortype                   = VendorType
                                                                    price                        = Price
                                                                    purchasedocumentitemimageurl = PurchaseDocumentItemImageURL
                                                                    currency                     = Currency ).
  ENDMETHOD.

  METHOD map_purchdoc_cds_to_db.
    rs_purchdoc = CORRESPONDING #( is_i_purchdoc_u MAPPING purchasedocument         = PurchaseDocument
                                                            crea_date_time           = crea_date_time
                                                            crea_uname               = crea_uname
                                                            description              = Description
                                                            lchg_date_time           = lchg_date_time
                                                            lchg_uname               = lchg_uname
                                                            priority                 = Priority
                                                            purchasedocumentimageurl = PurchaseDocumentImageURL
                                                            purchasingorganization   = PurchasingOrganization
                                                            status                   = status ).
  ENDMETHOD.

  METHOD new_message.
    obj = new lcl_abap_behv_msg(
      textid   = value #( msgid = id
                          msgno = number
                          attr1 = cond #( when v1 is not initial then 'IF_T100_DYN_MSG~MSGV1' )
                          attr2 = cond #( when v2 is not initial then 'IF_T100_DYN_MSG~MSGV2' )
                          attr3 = cond #( when v3 is not initial then 'IF_T100_DYN_MSG~MSGV3' )
                          attr4 = cond #( when v4 is not initial then 'IF_T100_DYN_MSG~MSGV4' ) )
*      previous =
      msgty    = switch #( severity
                   when if_abap_behv_message=>severity-error then 'E'
                   when if_abap_behv_message=>severity-warning then 'W'
                   when if_abap_behv_message=>severity-information then 'I'
                   when if_abap_behv_message=>severity-success then 'S' )
      msgv1    = |{ v1 }|
      msgv2    = |{ v2 }|
      msgv3    = |{ v3 }|
      msgv4    = |{ v4 }|
    ).

    obj->m_severity = severity.
  ENDMETHOD.

  METHOD initialize.
    lcl_prch_buffer=>get_instance( )->initialize( ).
  ENDMETHOD.

  METHOD save.
    lcl_prch_buffer=>get_instance( )->save( ).
    initialize( ).
  ENDMETHOD.
ENDCLASS.
