@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@Analytics.dataCategory: #DIMENSION

@EndUserText.label: 'Vendor Type'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'VendorType'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.semanticKey: [ 'VendorType' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_VendorType
  as select from zhh_purchvdrtyp

{
      @EndUserText.label: 'Vendor Type'
      @ObjectModel.text.element: [ 'VendorTypeText' ]
  key vendortype     as VendorType,

      @EndUserText.label: 'Vendor Type'
      @Semantics.text: true
      vendortypetext as VendorTypeText
}
