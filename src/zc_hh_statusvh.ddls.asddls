@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Value Help for Status'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Status'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.semanticKey: [ 'Status' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@Search.searchable: true

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_StatusVH
  as select from ZI_HH_PurchDocStatus

{
      @ObjectModel.text.element: [ 'StatusText' ]
  key Status,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Search.ranking: #HIGH
      StatusText
}
