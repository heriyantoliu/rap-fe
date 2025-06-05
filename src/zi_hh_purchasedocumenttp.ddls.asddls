@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

define root view entity ZI_HH_PurchaseDocumentTP
  as select from ZI_HH_PurchDocOverallPrice
  composition [0..*] of ZI_HH_PurchaseDocumentItemTP as _PurchaseDocumentItem
  association [0..1] to ZI_HH_Indicator as _IsApprovalRequired on $projection.IsApprovalRequired = _IsApprovalRequired.IndicatorValue

{
  key PurchaseDocument,

      Description,
      Status,
      Priority,
      case when OverallPrice > 15000 then 'X' else '' end as IsApprovalRequired,

      case when OverallPrice >= 0 and OverallPrice < 15000 then 3
      when OverallPrice > -15000 and OverallPrice <= 18000 then 2
      when OverallPrice > 10000 then 1
      else 0 end                                          as OverallPriceCriticality,

      OverallPrice,
      Currency,
      PurchasingOrganization,
      PurchaseDocumentImageURL,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      _PurchaseDocumentItem,
      _Currency,
      _Priority,
      _Status,
      _IsApprovalRequired,
      _PurchasingOrganization
}
