@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document for Overview Page'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'PurchaseDocument'
@ObjectModel.semanticKey: [ 'PurchaseDocument' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_PurchaseDocumentOVP
  as select from ZI_HH_PurchaseDocument

  association [0..1] to ZI_HH_PurchDocPriority as _Priority on $projection.Priority = _Priority.Priority
  association [0..1] to ZI_HH_PurchDocStatus   as _Status   on $projection.Status = _Status.Status

{
  key PurchaseDocument,

      Description,
      Priority,
      _Priority.PriorityText,
      Status,
      _Status.StatusText,

      @DefaultAggregation: #SUM
      cast(1 as abap.dec(9,0)) as TotalNumberofDocuments,

      _Priority,
      _Status
}
