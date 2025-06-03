INTERFACE zif_hh_prchdc_logic
  PUBLIC.
  TYPES tt_purchasedocument  TYPE SORTED TABLE OF zhh_purchdoc WITH UNIQUE KEY PurchaseDocument.
  TYPES tt_purchdocumentitem TYPE SORTED TABLE OF zhh_purchdocitem WITH UNIQUE KEY PurchaseDocument PurchaseDocumentItem.

  TYPES: BEGIN OF ts_purchdoc_key,
           action           TYPE string,
           purchasedocument TYPE zhh_purchdocdtel,
         END OF ts_purchdoc_key,
         tt_purchasedocumentkey TYPE SORTED TABLE OF ts_purchdoc_key WITH UNIQUE KEY PurchaseDocument.

  TYPES: BEGIN OF ts_purchdoc_control,
           description              TYPE abap_bool,
           status                   TYPE abap_bool,
           priority                 TYPE abap_bool,
           purchasingorganization   TYPE abap_bool,
           purchasedocumentimageurl TYPE abap_bool,
           crea_date_time           TYPE abap_bool,
           crea_uname               TYPE abap_bool,
           lchg_date_time           TYPE abap_bool,
           lchg_uname               TYPE abap_bool,
         END OF ts_purchdoc_control.

  TYPES: BEGIN OF ts_purchdocitem_control,
           description                  TYPE abap_bool,
           price                        TYPE abap_bool,
           currency                     TYPE abap_bool,
           quantity                     TYPE abap_bool,
           quantityunit                 TYPE abap_bool,
           vendor                       TYPE abap_bool,
           vendortype                   TYPE abap_bool,
           purchasedocumentitemimageurl TYPE abap_bool,
           crea_date_time               TYPE abap_bool,
           crea_uname                   TYPE abap_bool,
           lchg_date_time               TYPE abap_bool,
           lchg_uname                   TYPE abap_bool,
         END OF ts_purchdocitem_control.

  TYPES: BEGIN OF ts_purchdocitem_key,
           action               TYPE string,
           purchasedocument     TYPE zhh_purchdocdtel,
           purchasedocumentitem TYPE zhh_purchdocdtel,
         END OF ts_purchdocitem_key.

  TYPES BEGIN OF ts_purchdocumentcontrol.
          INCLUDE TYPE ts_purchdoc_key.
          INCLUDE TYPE ts_purchdoc_control.
  TYPES END OF ts_purchdocumentcontrol.

  TYPES BEGIN OF ts_purchdocumentitemcontrol.
          INCLUDE TYPE ts_purchdocitem_key.
          INCLUDE TYPE ts_purchdocitem_control.
  TYPES END OF ts_purchdocumentitemcontrol.

  TYPES BEGIN OF ts_purchasedocument.
          INCLUDE TYPE zhh_purchdoc.
  TYPES END OF ts_purchasedocument.

  TYPES BEGIN OF ts_purchasedocitem.
          INCLUDE TYPE zhh_purchdocitem.
  TYPES END OF ts_purchasedocitem.

  TYPES tt_purchdocumentitemcontrol  TYPE TABLE OF ts_purchdocumentitemcontrol.
  TYPES tt_purchdocumentcontrol      TYPE TABLE OF ts_purchdocumentcontrol.
  TYPES tt_purchdocitem_key          TYPE SORTED TABLE OF ts_purchdocitem_key WITH UNIQUE KEY PurchaseDocument PurchaseDocumentItem.

  TYPES tt_purchasedocument_failed   TYPE TABLE FOR FAILED ZI_HH_PurchaseDocument_U.
  TYPES tt_purchasedocument_mapped   TYPE TABLE FOR MAPPED ZI_HH_PurchaseDocument_U.
  TYPES tt_purchasedocument_reported TYPE TABLE FOR REPORTED ZI_HH_PurchaseDocument_U.

  TYPES tt_purchasedocitem_failed    TYPE TABLE FOR FAILED ZI_HH_PurchaseDocumentItem_U.
  TYPES tt_purchasedocitem_mapped    TYPE TABLE FOR MAPPED ZI_HH_PurchaseDocumentItem_U.
  TYPES tt_purchasedocitem_reported  TYPE TABLE FOR REPORTED ZI_HH_PurchaseDocumentItem_U.

  CONSTANTS co_version_major TYPE int2 VALUE 2.
  CONSTANTS co_version_minor TYPE int2 VALUE 0.

  TYPES tt_message         TYPE TABLE OF symsg.
  TYPES tt_if_t100_message TYPE TABLE OF REF TO if_t100_message WITH EMPTY KEY.
ENDINTERFACE.
