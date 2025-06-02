CLASS zcl_hh_vendor_rating_calc_exit DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_sadl_exit.
    INTERFACES if_sadl_exit_calc_element_read.
ENDCLASS.


CLASS zcl_hh_vendor_rating_calc_exit IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
    CHECK it_original_data IS NOT INITIAL.

    IF line_exists( it_requested_calc_elements[ table_line = 'VENDORRATING' ] ).
      DATA lt_calculated_data TYPE TABLE OF ZC_HH_PurchaseDocumentItemLRP.
      MOVE-CORRESPONDING it_original_data TO lt_calculated_data.

      LOOP AT lt_calculated_data ASSIGNING FIELD-SYMBOL(<fs_calculated_data>).
        <fs_calculated_data>-vendorrating = zcl_hh_obj_factory_purch=>get_vendor_service( )->get_vendor_rating(
                                                <fs_calculated_data>-Vendor ).
      ENDLOOP.
      MOVE-CORRESPONDING lt_calculated_data TO ct_calculated_data.
    ENDIF.
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    IF iv_entity <> 'ZC_HH_PURCHASEDOCUMENTITEMLRP'.
      RAISE EXCEPTION NEW zcx_hh_unknown_entity( ).
    ENDIF.

    IF line_exists( it_requested_calc_elements[ table_line = 'VENDORRATING' ] ).
      APPEND 'VENDOR' TO et_requested_orig_elements.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
