@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Value Help for Vendor Type'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'VendorType'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.semanticKey: [ 'VendorType' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@Search.searchable: true

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_VendorTypeVH
  as select from ZI_HH_VendorType

{
      @ObjectModel.text.element: [ 'VendorTypeText' ]
  key VendorType,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      VendorTypeText
}
