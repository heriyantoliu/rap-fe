@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@Analytics.dataCategory: #DIMENSION

@EndUserText.label: 'Purchase Document Priority'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'Priority'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.semanticKey: [ 'Priority' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_PurchDocPriority
  as select from zhh_purchdocprio

{
      @EndUserText.label: 'Priority'
      @ObjectModel.text.element: [ 'PriorityText' ]
  key priority     as Priority,

      @EndUserText.label: 'Priority Text'
      @Semantics.text: true
      prioritytext as PriorityText
}
