@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Purchase Document'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

@VDM.viewType: #CONSUMPTION

define root view entity ZC_HH_PurchaseDocumentLRP  
  as projection on ZI_HH_PurchaseDocument_U

{
      @Consumption.semanticObject: 'PurchasingDocument'
      @EndUserText.label: 'Purchase Document'
  key PurchaseDocument,

      @EndUserText.label: 'Overall Price'
      OverallPrice,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_HH_Indicator', element: 'IndicatorValue' } } ]
      @EndUserText.label: 'Approval Required'
      @ObjectModel.foreignKey.association: '_IsApprovalRequired'
      IsApprovalRequired,

      OverallPriceCriticality,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_HH_StatusVH', element: 'Status' } } ]
      @EndUserText.label: 'Status'
      Status,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZC_HH_PriorityVH', element: 'Priority' } } ]
      @EndUserText.label: 'Priority'
      Priority,

      @EndUserText.label: 'Description'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      Description,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_HH_PurchasingOrganization',
                                                      element: 'PurchasingOrganization' } } ]
      @EndUserText.label: 'Purchasing Organization'
      PurchasingOrganization,

      @EndUserText.label: 'Currency'
      Currency,

      @Consumption.filter.hidden: true
      @EndUserText.label: 'Created At'
      crea_date_time,

      @EndUserText.label: 'Created By'
      crea_uname,

      @Consumption.filter.hidden: true
      @EndUserText.label: 'Last Changed At'
      lchg_date_time,

      @Consumption.filter.hidden: true
      @EndUserText.label: 'Last Changed By'
      lchg_uname,

      @Consumption.filter.hidden: true
      @EndUserText.label: 'Image'
      PurchaseDocumentImageURL,

      /* Associations */
      _Currency,
      _Priority,
      _PurchaseDocumentItem: redirected to composition child ZC_HH_PurchaseDocumentItemLRP,
      _PurchasingOrganization,
      _Status,
      _IsApprovalRequired
}
