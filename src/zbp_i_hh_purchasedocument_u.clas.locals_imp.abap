CLASS lhc_PurchaseDocument DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR PurchaseDocument RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR PurchaseDocument RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE PurchaseDocument.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE PurchaseDocument.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE PurchaseDocument.

    METHODS read FOR READ
      IMPORTING keys FOR READ PurchaseDocument RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK PurchaseDocument.

    METHODS rba_Purchasedocumentitem FOR READ
      IMPORTING keys_rba FOR READ PurchaseDocument\_Purchasedocumentitem FULL result_requested RESULT result LINK association_links.

    METHODS cba_Purchasedocumentitem FOR MODIFY
      IMPORTING entities_cba FOR CREATE PurchaseDocument\_Purchasedocumentitem.

    METHODS Approve_Order FOR MODIFY
      IMPORTING keys FOR ACTION PurchaseDocument~Approve_Order RESULT result.

    METHODS Reject_Order FOR MODIFY
      IMPORTING keys FOR ACTION PurchaseDocument~Reject_Order RESULT result.

    DATA et_messages TYPE zif_hh_prchdc_logic=>tt_if_t100_message.
ENDCLASS.


CLASS lhc_PurchaseDocument IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
    TYPES tt_message TYPE STANDARD TABLE OF symsg.

    CLEAR et_messages.

    DATA ls_purchdocument    TYPE zhh_purchdoc.
    DATA lt_purchdocument    TYPE zif_hh_prchdc_logic=>tt_purchasedocument.
    DATA lv_purchasedocument TYPE zhh_purchdocdtel.
    DATA lv_cid              TYPE string.

    SELECT FROM zhh_purchdoc FIELDS MAX( PurchaseDocument ) INTO @lv_purchasedocument.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_purchasedocument_create>).
      CLEAR ls_purchdocument.

      ls_purchdocument = CORRESPONDING #( zcl_hh_prchdc_logic=>get_instance( )->map_purchdocitem_cds_to_db(
                                              CORRESPONDING #( <fs_purchasedocument_create> ) ) ).
      lv_cid = <fs_purchasedocument_create>-%cid.

      IF <fs_purchasedocument_create>-PurchaseDocument > lv_purchasedocument.
        lv_purchasedocument = <fs_purchasedocument_create>-PurchaseDocument.
      ENDIF.

      lv_purchasedocument += 1.
      CONDENSE lv_purchasedocument.
      ls_purchdocument-purchasedocument = lv_purchasedocument.

      GET TIME STAMP FIELD ls_purchdocument-crea_date_time.
      GET TIME STAMP FIELD ls_purchdocument-lchg_date_time.

      ls_purchdocument-crea_uname               = sy-uname.
      ls_purchdocument-lchg_uname               = sy-uname.
      ls_purchdocument-status                   = 1.
      ls_purchdocument-purchasedocumentimageurl = './images/book.jpg'.
      APPEND ls_purchdocument TO lt_purchdocument.
    ENDLOOP.

    zcl_hh_prchdc_logic=>get_instance( )->create_purchasedocument( EXPORTING it_purchasedocument = lt_purchdocument
                                                                   IMPORTING et_messages         = et_messages ).

    IF et_messages IS INITIAL.
      INSERT VALUE #( PurchaseDocument          = ls_purchdocument-purchasedocument
                      %msg                      = new_message( id       = 'ZHH_PURCHDOC_EXCP'
                                                               number   = '000'
                                                               v1       = ls_purchdocument-purchasedocument
                                                               severity = if_abap_behv_message=>severity-success )
                      %element-PurchaseDocument = cl_abap_behv=>flag_changed
                      %cid                      = lv_cid )
             INTO TABLE reported-PurchaseDocument.
    ELSE.
      LOOP AT et_messages INTO DATA(ls_message).
        INSERT VALUE #( %cid             = lv_cid
                        PurchaseDocument = ls_purchdocument-purchasedocument )
               INTO TABLE reported-PurchaseDocument.

        INSERT zcl_hh_prchdc_logic=>map_purchasedoc_message( iv_purchasedocument = ls_purchdocument-purchasedocument
                                                             is_message          = ls_message
                                                             is_messagetype      = 'E' )
               INTO TABLE reported-PurchaseDocument.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD update.
    DATA ls_purchdocument           TYPE zhh_purchdoc.
    DATA ls_purchdocumentcontrol    TYPE zif_hh_prchdc_logic=>ts_purchdocumentcontrol.
    DATA lt_purchasedocument        TYPE zif_hh_prchdc_logic=>tt_purchasedocument.
    DATA lt_purchasedocumentcontrol TYPE zif_hh_prchdc_logic=>tt_purchdocumentcontrol.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_purchasedocument_create>).
      ls_purchdocument = CORRESPONDING #( zcl_hh_prchdc_logic=>get_instance( )->map_purchdoc_cds_to_db(
                                              CORRESPONDING #( <fs_purchasedocument_create> ) ) ).
      ls_purchdocumentcontrol-action                   = 'U'.
      ls_purchdocumentcontrol-purchasedocument         = ls_purchdocument-purchasedocument.
      ls_purchdocumentcontrol-description              = xsdbool( <fs_purchasedocument_create>-%control-Description = cl_abap_behv=>flag_changed ).
      ls_purchdocumentcontrol-status                   = xsdbool( <fs_purchasedocument_create>-%control-status = cl_abap_behv=>flag_changed ).
      ls_purchdocumentcontrol-priority                 = xsdbool( <fs_purchasedocument_create>-%control-priority = cl_abap_behv=>flag_changed ).
      ls_purchdocumentcontrol-purchasingorganization   = xsdbool( <fs_purchasedocument_create>-%control-PurchasingOrganization = cl_abap_behv=>flag_changed ).
      ls_purchdocumentcontrol-purchasedocumentimageurl = xsdbool( <fs_purchasedocument_create>-%control-PurchaseDocumentImageURL = cl_abap_behv=>flag_changed ).
      ls_purchdocumentcontrol-crea_date_time           = xsdbool( <fs_purchasedocument_create>-%control-crea_date_time = cl_abap_behv=>flag_changed ).
      ls_purchdocumentcontrol-crea_uname               = xsdbool( <fs_purchasedocument_create>-%control-crea_uname = cl_abap_behv=>flag_changed ).
      ls_purchdocumentcontrol-lchg_date_time           = 'X'.
      ls_purchdocumentcontrol-lchg_uname               = 'X'.

      GET TIME STAMP FIELD ls_purchdocument-lchg_date_time.

      ls_purchdocument-lchg_uname = sy-uname.

      APPEND ls_purchdocument TO lt_purchasedocument.
      APPEND ls_purchdocumentcontrol TO lt_purchasedocumentcontrol.
    ENDLOOP.

    IF lt_purchasedocument IS NOT INITIAL.
      zcl_hh_prchdc_logic=>get_instance( )->update_purchasedocument(
        EXPORTING it_purchasedocument     = lt_purchasedocument
                  it_purchdocumentcontrol = lt_purchasedocumentcontrol
        IMPORTING et_messages             = et_messages ).

      IF et_messages IS INITIAL.
        APPEND VALUE #( PurchaseDocument          = ls_purchdocument-purchasedocument
                        %msg                      = new_message( id       = 'ZHH_PURCHDOC_EXCP'
                                                                 number   = '011'
                                                                 v1       = ls_purchdocument-purchasedocument
                                                                 severity = if_abap_behv_message=>severity-success )
                        %element-PurchaseDocument = cl_abap_behv=>flag_changed )
               TO reported-PurchaseDocument.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD delete.
    DATA ls_purchdocument    TYPE zhh_purchdoc.
    DATA lt_purchdocumentkey TYPE zif_hh_prchdc_logic=>tt_purchasedocumentkey.
    DATA lt_purchdocitemkey  TYPE zif_hh_prchdc_logic=>tt_purchdocitem_key.

    CLEAR et_messages.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_purchasedocument_delete>).
      MOVE-CORRESPONDING <fs_purchasedocument_delete> TO ls_purchdocument.
      APPEND VALUE #( PurchaseDocument = ls_purchdocument-PurchaseDocument ) TO lt_purchdocumentkey.
    ENDLOOP.

    IF lt_purchdocitemkey IS INITIAL.
      RETURN.
    ENDIF.

    SELECT * FROM zhh_purchdocitem
      FOR ALL ENTRIES IN @lt_purchdocumentkey
      WHERE PurchaseDocument = @lt_purchdocumentkey-PurchaseDocument
      INTO CORRESPONDING FIELDS OF TABLE @lt_purchdocitemkey.

    zcl_hh_prchdc_logic=>get_instance( )->delete_purchasedocument(
      EXPORTING it_purchasedocumentkey = lt_purchdocumentkey
                it_purchdocitemkey     = lt_purchdocitemkey
      IMPORTING et_messages            = et_messages ).

    IF et_messages IS INITIAL.
      APPEND VALUE #( PurchaseDocument          = ls_purchdocument-PurchaseDocument
                      %msg                      = new_message( id       = 'ZHH_PURCHDOC_EXCP'
                                                               number   = '004'
                                                               v1       = ls_purchdocument-PurchaseDocument
                                                               severity = if_abap_behv_message=>severity-success )
                      %element-PurchaseDocument = cl_abap_behv=>flag_changed )
             TO reported-PurchaseDocument.
    ENDIF.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Purchasedocumentitem.
  ENDMETHOD.

  METHOD cba_Purchasedocumentitem.
    DATA ls_purchdocument     TYPE zhh_purchdoc.
    DATA ls_purchdocumentitem TYPE zhh_purchdocitem.
    DATA lt_purchdocumentitem TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem.
    DATA lv_purchdocitem      TYPE zhh_purchdocdtel.

    LOOP AT entities_cba ASSIGNING FIELD-SYMBOL(<fs_purchasedocument>).
      ls_purchdocument-PurchaseDocument = <fs_purchasedocument>-PurchaseDocument.

      SELECT FROM zhh_purchdocitem
        FIELDS MAX( PurchaseDocumentItem )
        WHERE PurchaseDocument = @ls_purchdocument-PurchaseDocument
        INTO @lv_purchdocitem.

      LOOP AT <fs_purchasedocument>-%target ASSIGNING FIELD-SYMBOL(<fs_purchasedocumentitem>).
        MOVE-CORRESPONDING <fs_purchasedocumentitem> TO ls_purchdocumentitem.

        IF <fs_purchasedocumentitem>-PurchaseDocumentItem > lv_purchdocitem.
          lv_purchdocitem = <fs_purchasedocumentitem>-PurchaseDocumentItem.
        ELSE.
          lv_purchdocitem += 1.
          CONDENSE lv_purchdocitem.
          ls_purchdocumentitem-purchasedocumentitem         = lv_purchdocitem.
          ls_purchdocumentitem-purchasedocument             = ls_purchdocument-PurchaseDocument.
          ls_purchdocumentitem-lchg_uname                   = sy-uname.
          ls_purchdocumentitem-crea_uname                   = sy-uname.
          ls_purchdocumentitem-purchasedocumentitemimageurl = './images/book.jpg'.

          GET TIME STAMP FIELD ls_purchdocumentitem-lchg_date_time.
          GET TIME STAMP FIELD ls_purchdocumentitem-crea_date_time.
          APPEND ls_purchdocumentitem TO lt_purchdocumentitem.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

    IF lt_purchdocumentitem IS NOT INITIAL.
      zcl_hh_prchdc_logic=>get_instance( )->create_purchasedocitem( EXPORTING it_purchasedocitem = lt_purchdocumentitem
                                                                    IMPORTING et_messages        = et_messages ).
    ENDIF.
  ENDMETHOD.

  METHOD Approve_Order.
    DATA ls_purchdocument TYPE zhh_purchdoc.

    CLEAR result.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_purchasedocument>).
      UPDATE zhh_purchdoc SET Status = 2 WHERE PurchaseDocument = @<fs_purchasedocument>-PurchaseDocument.
      IF sy-subrc = 0.
        APPEND VALUE #( PurchaseDocument        = <fs_purchasedocument>-PurchaseDocument
                        %param-PurchaseDocument = <fs_purchasedocument>-PurchaseDocument
                        %param-Status           = '2' )
               TO result.
      ENDIF.
    ENDLOOP.

    APPEND VALUE #( PurchaseDocument          = ls_purchdocument-PurchaseDocument
                    %msg                      = new_message( id       = 'ZHH_PURCHDOC_EXCP'
                                                             number   = '002'
                                                             v1       = ls_purchdocument-PurchaseDocument
                                                             severity = if_abap_behv_message=>severity-success )
                    %element-PurchaseDocument = cl_abap_behv=>flag_changed )
           TO reported-PurchaseDocument.
  ENDMETHOD.

  METHOD Reject_Order.
    DATA ls_purchdocument TYPE zhh_purchdoc.

    CLEAR result.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_purchasedocument>).
      UPDATE zhh_purchdoc SET Status = 3 WHERE PurchaseDocument = @<fs_purchasedocument>-PurchaseDocument.
      IF sy-subrc = 0.
        APPEND VALUE #( PurchaseDocument        = <fs_purchasedocument>-PurchaseDocument
                        %param-PurchaseDocument = <fs_purchasedocument>-PurchaseDocument
                        %param-Status           = '3' )
               TO result.
      ENDIF.
    ENDLOOP.

    APPEND VALUE #( PurchaseDocument          = ls_purchdocument-PurchaseDocument
                    %msg                      = new_message( id       = 'ZHH_PURCHDOC_EXCP'
                                                             number   = '003'
                                                             v1       = ls_purchdocument-PurchaseDocument
                                                             severity = if_abap_behv_message=>severity-success )
                    %element-PurchaseDocument = cl_abap_behv=>flag_changed )
           TO reported-PurchaseDocument.
  ENDMETHOD.
ENDCLASS.


CLASS lhc_PurchaseDocumentItem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE PurchaseDocumentItem.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE PurchaseDocumentItem.

    METHODS read FOR READ
      IMPORTING keys FOR READ PurchaseDocumentItem RESULT result.

    METHODS rba_Purchasedocument FOR READ
      IMPORTING keys_rba FOR READ PurchaseDocumentItem\_Purchasedocument FULL result_requested RESULT result LINK association_links.

    DATA et_messages TYPE zif_hh_prchdc_logic=>tt_if_t100_message.
ENDCLASS.


CLASS lhc_PurchaseDocumentItem IMPLEMENTATION.
  METHOD update.
    DATA ls_purchdocumentitem        TYPE zhh_purchdocitem.
    DATA ls_purchdocumentitemcontrol TYPE zif_hh_prchdc_logic=>ts_purchdocumentitemcontrol.
    DATA lt_purchdocumentitem        TYPE zif_hh_prchdc_logic=>tt_purchdocumentitem.
    DATA lt_purchdocumentitemcontrol TYPE zif_hh_prchdc_logic=>tt_purchdocumentitemcontrol.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_purchasedocitem_create>).
      ls_purchdocumentitem = CORRESPONDING #( zcl_hh_prchdc_logic=>get_instance( )->map_purchdocitem_cds_to_db(
                                                  CORRESPONDING #( <fs_purchasedocitem_create> ) ) ).

      ls_purchdocumentitemcontrol-action                       = 'U'.
      ls_purchdocumentitemcontrol-purchasedocument             = ls_purchdocumentitem-purchasedocument.
      ls_purchdocumentitemcontrol-purchasedocumentitem         = ls_purchdocumentitem-purchasedocumentitem.
      ls_purchdocumentitemcontrol-crea_date_time               = xsdbool( <fs_purchasedocitem_create>-%control-crea_date_time = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-crea_uname                   = xsdbool( <fs_purchasedocitem_create>-%control-crea_uname = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-currency                     = xsdbool( <fs_purchasedocitem_create>-%control-currency = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-description                  = xsdbool( <fs_purchasedocitem_create>-%control-description = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-lchg_date_time               = 'X'.
      ls_purchdocumentitemcontrol-lchg_uname                   = 'X'.
      ls_purchdocumentitemcontrol-price                        = xsdbool( <fs_purchasedocitem_create>-%control-price = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-purchasedocumentitemimageurl = xsdbool( <fs_purchasedocitem_create>-%control-PurchaseDocumentItemImageURL = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-quantity                     = xsdbool( <fs_purchasedocitem_create>-%control-Quantity = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-quantityunit                 = xsdbool( <fs_purchasedocitem_create>-%control-QuantityUnit = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-vendor                       = xsdbool( <fs_purchasedocitem_create>-%control-vendor = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-vendortype                   = xsdbool( <fs_purchasedocitem_create>-%control-vendortype = cl_abap_behv=>flag_changed ).
      ls_purchdocumentitemcontrol-lchg_uname                   = xsdbool( <fs_purchasedocitem_create>-%control-lchg_uname = cl_abap_behv=>flag_changed ).

      GET TIME STAMP FIELD ls_purchdocumentitem-lchg_date_time.
      ls_purchdocumentitem-lchg_uname = sy-uname.
      APPEND ls_purchdocumentitem TO lt_purchdocumentitem.
      APPEND ls_purchdocumentitemcontrol TO lt_purchdocumentitemcontrol.
    ENDLOOP.

    IF lt_purchdocumentitemcontrol IS NOT INITIAL.
      zcl_hh_prchdc_logic=>get_instance( )->update_purchasedocitem(
        EXPORTING it_purchdocitem        = lt_purchdocumentitem
                  it_purchdocitemcontrol = lt_purchdocumentitemcontrol
        IMPORTING et_messages            = et_messages ).

      IF et_messages IS INITIAL.
        APPEND VALUE #( PurchaseDocument          = ls_purchdocumentitem-PurchaseDocument
                        %msg                      = new_message( id       = 'ZHH_PURCHDOC_EXCP'
                                                                 number   = '001'
                                                                 v1       = ls_purchdocumentitem-PurchaseDocument
                                                                 severity = if_abap_behv_message=>severity-success )
                        %element-PurchaseDocument = cl_abap_behv=>flag_changed )
               TO reported-PurchaseDocumentitem.
      ENDIF.
    ENDIF.
  ENDMETHOD.

  METHOD delete.
    DATA ls_purchdocitem    TYPE zhh_purchdocitem.
    DATA lt_purchdocitemkey TYPE zif_hh_prchdc_logic=>tt_purchdocitem_key.

    CLEAR et_messages.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_purchasedocitem_delete>).
      MOVE-CORRESPONDING <fs_purchasedocitem_delete> TO ls_purchdocitem.
      APPEND VALUE #( PurchaseDocument     = ls_purchdocitem-PurchaseDocument
                      PurchaseDocumentItem = ls_purchdocitem-PurchaseDocumentItem )
             TO lt_purchdocitemkey.
    ENDLOOP.

    IF lt_purchdocitemkey IS INITIAL.
      RETURN.
    ENDIF.

    zcl_hh_prchdc_logic=>get_instance( )->delete_purchasedocitem( EXPORTING it_purchasedocitemkey = lt_purchdocitemkey
                                                                  IMPORTING et_messages           = et_messages ).

    IF et_messages IS INITIAL.

      APPEND VALUE #( PurchaseDocument          = ls_purchdocitem-PurchaseDocument
                      %msg                      = new_message( id       = 'ZHH_PURCHDOC_EXCP'
                                                               number   = '015'
                                                               v1       = ls_purchdocitem-PurchaseDocument
                                                               severity = if_abap_behv_message=>severity-success )
                      %element-PurchaseDocument = cl_abap_behv=>flag_changed )
             TO reported-PurchaseDocumentitem.
    ENDIF.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Purchasedocument.
  ENDMETHOD.
ENDCLASS.


CLASS lsc_ZI_HH_PURCHASEDOCUMENT_U DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS finalize          REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save              REDEFINITION.

    METHODS cleanup           REDEFINITION.

    METHODS cleanup_finalize  REDEFINITION.

ENDCLASS.


CLASS lsc_ZI_HH_PURCHASEDOCUMENT_U IMPLEMENTATION.
  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    zcl_hh_prchdc_logic=>get_instance( )->save( ).
  ENDMETHOD.

  METHOD cleanup.
    zcl_hh_prchdc_logic=>get_instance( )->initialize( ).
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.
ENDCLASS.
