@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Filters for Purchasing Document OVP'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}

@VDM.viewType: #CONSUMPTION
define view entity ZC_HH_PurchaseDocFilterOVP as select from ZI_HH_PurchaseDocument
{
  key PurchaseDocument,
  cast('' as abap.char(1)) as Priority,
  cast('' as abap.char(1)) as Status
}
