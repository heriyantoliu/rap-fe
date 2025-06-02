@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@Analytics.dataCategory: #DIMENSION

@EndUserText.label: 'Purchasing Organization'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'PurchasingOrganization'
@ObjectModel.semanticKey: [ 'PurchasingOrganization' ]
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_PurchasingOrganization
  as select from zhh_purchorg

{
      @ObjectModel.text.element: [ 'Description' ]
  key purchasingorganization as PurchasingOrganization,

      @Semantics.name.fullName: true
      @Semantics.text: true
      description            as Description,

      @Semantics.eMail: { address: true,
                          type: [ #WORK ] }
      emailaddress           as Email,

      @Semantics.telephone.type: [ #WORK ]
      phonenumber            as Phone,

      @Semantics.telephone.type: [ #FAX ]
      faxnumber              as Fax
}
