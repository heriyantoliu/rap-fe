@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Value Help for Priority'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Priority'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.semanticKey: [ 'Priority' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@Search.searchable: true

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_PriorityVH
  as select from ZI_HH_PurchDocPriority

{
      @ObjectModel.text.element: [ 'PriorityText' ]
  key Priority,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Search.ranking: #HIGH
      PriorityText
}
