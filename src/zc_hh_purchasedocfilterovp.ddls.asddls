@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Filters for Purchasing Document OVP'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_PurchaseDocFilterOVP
  as select from ZI_HH_PurchaseDocument

{
      @Consumption.filter.hidden: true
  key PurchaseDocument,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_HH_PriorityVH', element: 'Priority' } } ]
      @UI.selectionField: [ { position: 10 } ]
      cast('' as abap.char(1)) as Priority,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_HH_StatusVH', element: 'Status' } } ]
      @UI.selectionField: [ { position: 20 } ]
      cast('' as abap.char(1)) as Status
}
