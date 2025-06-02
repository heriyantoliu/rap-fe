@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'PurchaseDocument'
@ObjectModel.semanticKey: [ 'PurchaseDocument' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_PurchaseDocument
  as select from zhh_purchdoc

  association [0..*] to ZI_HH_PurchaseDocumentItem   as _PurchaseDocumentItem   on $projection.PurchaseDocument = _PurchaseDocumentItem.PurchaseDocument
  association [0..1] to ZI_HH_PurchDocPriority       as _Priority               on $projection.Priority = _Priority.Priority
  association [0..1] to ZI_HH_PurchDocStatus         as _Status                 on $projection.Status = _Status.Status
  association [0..1] to ZI_HH_PurchasingOrganization as _PurchasingOrganization on $projection.PurchasingOrganization = _PurchasingOrganization.PurchasingOrganization

{
      @ObjectModel.text.element: [ 'Description' ]
  key purchasedocument         as PurchaseDocument,

      @Semantics.text: true
      description              as Description,

      @ObjectModel.foreignKey.association: '_Status'
      status                   as Status,

      @ObjectModel.foreignKey.association: '_Priority'
      priority                 as Priority,

      @ObjectModel.foreignKey.association: '_PurchasingOrganization'
      purchasingorganization   as PurchasingOrganization,

      @Semantics.imageUrl: true
      purchasedocumentimageurl as PurchaseDocumentImageURL,

      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      _PurchaseDocumentItem,
      _Priority,
      _Status,
      _PurchasingOrganization
}
