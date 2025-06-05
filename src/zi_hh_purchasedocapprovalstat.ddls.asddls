@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchasing Docs with Approval Status'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #COMPOSITE

define view entity ZI_HH_PurchaseDocApprovalStat
  as select from ZI_HH_PurchDocOverallPrice

{
  key PurchaseDocument,

      Description,
      Status,
      Priority,
      OverallPrice,
      Currency,
      PurchasingOrganization,
      crea_date_time,
      crea_uname,
      lchg_date_time,
      lchg_uname,

      case
      when OverallPrice > 10000
      then 'Approval Required'
      else 'No Approval Required' end as Approval,

      _Priority,
      _Status
}
