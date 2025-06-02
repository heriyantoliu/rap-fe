CLASS zcl_hh_obj_factory_purch DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
    class-methods: get_vendor_service
      returning value(ro_vendor_service) type ref to zif_hh_vendor_service.
  PROTECTED SECTION.
  PRIVATE SECTION.
    class-data: go_vendor_service type ref to zif_hh_vendor_service.
ENDCLASS.

CLASS zcl_hh_obj_factory_purch IMPLEMENTATION.
  METHOD get_vendor_service.
    if go_vendor_service is not bound.
      go_vendor_service = new zcl_hh_vendor_service( ).
    endif.

    ro_vendor_service = go_vendor_service.

  ENDMETHOD.

ENDCLASS.
