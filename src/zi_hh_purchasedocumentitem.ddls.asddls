@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document Item'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'PurchaseDocument'
@ObjectModel.semanticKey: [ 'PurchaseDocument', 'PurchaseDocumentItem' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_PurchaseDocumentItem
  as select from zhh_purchdocitem

  association [1..1] to ZI_HH_PurchaseDocument as _PurchaseDocument      on $projection.PurchaseDocument = _PurchaseDocument.PurchaseDocument
  association [0..1] to I_UnitOfMeasure        as _QuantityUnitOfMeasure on $projection.QuantityUnit = _QuantityUnitOfMeasure.UnitOfMeasure
  association [0..1] to ZI_HH_VendorType       as _VendorType            on $projection.VendorType = _VendorType.VendorType
  association [0..1] to I_Currency             as _Currency              on $projection.Currency = _Currency.Currency

{
      @ObjectModel.foreignKey.association: '_PurchaseDocument'
  key purchasedocument                                             as PurchaseDocument,

      @ObjectModel.text.element: [ 'Description' ]
  key purchasedocumentitem                                         as PurchaseDocumentItem,

      @Semantics.text: true
      description                                                  as Description,

      vendor                                                       as Vendor,
      vendortype                                                   as VendorType,

      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'Currency'
      price                                                        as Price,

      @ObjectModel.foreignKey.association: '_Currency'
      currency                                                     as Currency,

      @DefaultAggregation: #NONE
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      quantity                                                     as Quantity,

      @ObjectModel.foreignKey.association: '_QuantityUnitOfMeasure'
      quantityunit                                                 as QuantityUnit,

      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'Currency'
      curr_to_decfloat_amount(price) * get_numeric_value(quantity) as OverallItemPrice,

      @Semantics.imageUrl: true
      purchasedocumentitemimageurl                                 as PurchaseDocumentItemImageURL,

      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_name,

      _PurchaseDocument,
      _QuantityUnitOfMeasure,
      _VendorType,
      _Currency
}
