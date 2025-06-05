@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document Item'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #COMPOSITE

define view entity ZI_HH_PurchaseDocumentItemTP
  as select from ZI_HH_PurchaseDocumentItem

  association to parent ZI_HH_PurchaseDocumentTP as _PurchaseDocument on $projection.PurchaseDocument = _PurchaseDocument.PurchaseDocument

{
  key PurchaseDocument,
  key PurchaseDocumentItem,

      Description,
      Vendor,
      VendorType,

      @Semantics.amount.currencyCode: 'Currency'
      Price,

      Currency,

      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      Quantity,

      QuantityUnit,
      OverallItemPrice,
      PurchaseDocumentItemImageURL,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      /* Associations */
      _Currency,
      _PurchaseDocument,
      _QuantityUnitOfMeasure,
      _VendorType
}
