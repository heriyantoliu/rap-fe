@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Orders Pending for Approval'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true

define view entity ZC_HH_PurchaseDocsforApprOVP
  as select from ZI_HH_PurchaseDocApprovalStat

{
  @Consumption.semanticObject: 'PurchasingDocument'
  key PurchaseDocument,

      Description,
      OverallPrice,
      Priority,
      crea_uname,
      _Priority.PriorityText,
      Status,
      PurchasingOrganization,
      Approval
}

where Status = '1' and OverallPrice > 15000
