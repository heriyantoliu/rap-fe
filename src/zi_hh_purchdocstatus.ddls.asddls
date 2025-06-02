@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@Analytics.dataCategory: #DIMENSION

@EndUserText.label: 'Purchase Document Status'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'Status'
@ObjectModel.semanticKey: [ 'Status' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_PurchDocStatus
  as select from zhh_purchdocsts

{
      @EndUserText.label: 'Status'
      @ObjectModel.text.element: [ 'StatusText' ]
  key status     as Status,

      @EndUserText.label: 'Status Text'
      @Semantics.text: true
      statustext as StatusText
}
