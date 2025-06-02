@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document Unmanaged'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #COMPOSITE

define root view entity ZI_HH_PurchaseDocument_U
  as select from ZI_HH_PurchDocOverallPrice

  composition [0..*] of ZI_HH_PurchaseDocumentItem_U as _PurchaseDocumentItem
  association [0..1] to ZI_HH_Indicator as _IsApprovalRequired on $projection.IsApprovalRequired = _IsApprovalRequired.IndicatorValue

{
  key PurchaseDocument,

      Description,
      Status,
      Priority,

      @ObjectModel.foreignKey.association: '_IsApprovalRequired'
      case when OverallPrice > 1000 then 'X' else '' end as IsApprovalRequired,

      case when OverallPrice >= 0 and OverallPrice < 1000 then 3
      when OverallPrice >= 1000 and OverallPrice <= 10000 then 2
      when OverallPrice > 10000 then 1
      else 0 end                                         as OverallPriceCriticality,

      OverallPrice,
      Currency,
      PurchasingOrganization,
      PurchaseDocumentImageURL,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      /* Associations */
      _Currency,
      _Priority,
      _PurchaseDocumentItem,
      _PurchasingOrganization,
      _Status,
      _IsApprovalRequired
}
