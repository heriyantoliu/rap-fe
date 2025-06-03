@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document Item Unmanaged'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #COMPOSITE

define view entity ZI_HH_PurchaseDocumentItem_U
  as select from ZI_HH_PurchaseDocumentItem

  association to parent ZI_HH_PurchaseDocument_U as _PurchaseDocument on $projection.PurchaseDocument = _PurchaseDocument.PurchaseDocument

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

      @Semantics.amount.currencyCode: 'Currency'
      OverallItemPrice,

      PurchaseDocumentItemImageURL,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      /* Associations */
      _Currency,
      _PurchaseDocument,
      _VendorType,
      _QuantityUnitOfMeasure
}
