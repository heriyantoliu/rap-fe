"!@testing ZI_HH_PURCHDOCOVERALLPRICE
CLASS ltc_zi_hh_purchdocoverallprice DEFINITION FINAL
  FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA environment TYPE REF TO if_cds_test_environment.

    DATA td_zi_hh_purchasedocument     TYPE STANDARD TABLE OF zi_hh_purchasedocument WITH EMPTY KEY.
    DATA td_zi_hh_purchasedocumentitem TYPE STANDARD TABLE OF zi_hh_purchasedocumentitem WITH EMPTY KEY.
    DATA act_results                   TYPE STANDARD TABLE OF zi_hh_purchdocoverallprice WITH EMPTY KEY.

    CLASS-METHODS class_setup RAISING cx_static_check.
    CLASS-METHODS class_teardown.

    METHODS setup                RAISING cx_static_check.
    METHODS prepare_testdata_no_items.
    METHODS prepare_testdata.
    METHODS overall_price_no_items FOR TESTING RAISING cx_static_check.
    METHODS overall_price FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltc_zi_hh_purchdocoverallprice IMPLEMENTATION.
  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZI_HH_PURCHDOCOVERALLPRICE' ).
  ENDMETHOD.

  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.

  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.

  METHOD overall_price_no_items.
    prepare_testdata_no_items( ).

    SELECT * FROM zi_hh_purchdocoverallprice INTO TABLE @act_results.

    cl_abap_unit_assert=>assert_equals( exp = 1 act = lines( act_results ) ).
    cl_abap_unit_assert=>assert_equals( exp = 0 act = act_results[ 1 ]-overallprice ).
  ENDMETHOD.

  METHOD overall_price.
    prepare_testdata( ).

    SELECT * FROM zi_hh_purchdocoverallprice INTO TABLE @act_results.

    cl_abap_unit_assert=>assert_equals( exp = 1 act = lines( act_results ) ).
    cl_abap_unit_assert=>assert_equals( exp = 20 act = act_results[ 1 ]-overallprice ).
  ENDMETHOD.

  METHOD prepare_testdata_no_items.
    " Prepare test data for 'zi_hh_purchasedocument'
    td_zi_hh_purchasedocument = VALUE #( ( PurchaseDocument = '1'
                                           Description      = 'Doc with no items' ) ).

    environment->insert_test_data( i_data = td_zi_hh_purchasedocument ).

    " Prepare test data for 'zi_hh_purchasedocumentitem'
    " TODO: Provide the test data here
    td_zi_hh_purchasedocumentitem = VALUE #( ( ) ).

    environment->insert_test_data( i_data = td_zi_hh_purchasedocumentitem ).
  ENDMETHOD.

  METHOD prepare_testdata.
    td_zi_hh_purchasedocument = VALUE #( ( PurchaseDocument = '1'
                                           Description      = 'Doc with items' ) ).

    environment->insert_test_data( i_data = td_zi_hh_purchasedocument ).

    td_zi_hh_purchasedocumentitem = VALUE #( PurchaseDocument = '1'
                                             OverallItemPrice = '10'
                                             ( PurchaseDocumentItem = '1' )
                                             ( PurchaseDocumentItem = '2' ) ).

    environment->insert_test_data( i_data = td_zi_hh_purchasedocumentitem ).
  ENDMETHOD.
ENDCLASS.
