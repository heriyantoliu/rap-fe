@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'OVP Card fro Overall Budget'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_PurchaseDocBudgetOVP
  as select from ZI_HH_PurchaseDocumentTP

{
      @Consumption.semanticObject: 'PurchasingDocument'
  key PurchaseDocument,

      crea_date_time,
      PurchasingOrganization,
      OverallPrice,

      @Semantics.quantity.unitOfMeasure: 'Percentage'
      division(cast(OverallPrice as abap.dec(10)) * 100, 15000, 2) as BudgetUtilization,

      Status,
      Priority,
      cast(' % ' as abap.unit(3))                                  as Percentage
}
