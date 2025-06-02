@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document Item'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_PurchaseDocumentItemLRP  
  as projection on ZI_HH_PurchaseDocumentItem_U

{
      @EndUserText.label: 'Purchase Document'
      @ObjectModel.foreignKey.association: '_PurchaseDocument'
  key PurchaseDocument,

      @EndUserText.label: 'Purchase Document Item'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key PurchaseDocumentItem,

      @EndUserText.label: 'Price'
      @Semantics.amount.currencyCode: 'Currency'
      Price,

      @EndUserText.label: 'Quantity'
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      Quantity,

      @EndUserText.label: 'Overall Item Price'
      OverallItemPrice,

      @EndUserText.label: 'Vendor Name'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      Vendor,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_HH_VendorTypeVH', element: 'VendorType' } } ]
      @EndUserText.label: 'Vendor Type'
      VendorType,

      @EndUserText.label: 'Item Description'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      Description,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]

      Currency,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_UnitOfMeasure', element: 'UnitOfMeasure' } } ]
      QuantityUnit,

      @Consumption.filter.hidden: true
      @EndUserText.label: 'Image'
      PurchaseDocumentItemImageURL,      
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_HH_VENDOR_RATING_CALC_EXIT'
      virtual VendorRating: abap.int1(0),
      
      @EndUserText.label: 'Created At'
      crea_date_time,
      @EndUserText.label: 'Created By'
      crea_uname,
      @EndUserText.label: 'Last Changed At'
      lchg_date_time,
      @EndUserText.label: 'Last Changed By'
      lchg_name,

      /* Associations */
      _Currency,
      _PurchaseDocument : redirected to parent ZC_HH_PurchaseDocumentLRP,
      _QuantityUnitOfMeasure,
      _VendorType
}
