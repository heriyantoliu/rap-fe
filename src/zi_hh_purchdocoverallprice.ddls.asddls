@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document Overall Price'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'PurchaseDocument'
@ObjectModel.semanticKey: [ 'PurchaseDocument' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #COMPOSITE

define view entity ZI_HH_PurchDocOverallPrice
  as select from ZI_HH_PurchaseDocument

  association [0..1] to I_Currency as _Currency on $projection.currency = _Currency.Currency

{
  key PurchaseDocument,

      @DefaultAggregation: #NONE
      @Semantics.amount.currencyCode: 'Currency'
      sum(_PurchaseDocumentItem.OverallItemPrice) as OverallPrice,

      @ObjectModel.foreignKey.association: '_Currency'
      _PurchaseDocumentItem.Currency,

      PurchasingOrganization,
      Description,
      Status,
      Priority,
      PurchaseDocumentImageURL,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      /* Associations */
      _Priority,
      _PurchaseDocumentItem,
      _PurchasingOrganization,
      _Status,
      _Currency
}

group by PurchaseDocument,
         _PurchaseDocumentItem.Currency,
         PurchasingOrganization,
         Description,
         Status,
         Priority,
         PurchaseDocumentImageURL,
         crea_date_time,
         crea_uname,
         lchg_date_time,
         lchg_uname
