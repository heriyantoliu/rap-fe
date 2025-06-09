@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Pending Purchase Document Item List'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #CONSUMPTION

define view entity ZC_HH_PurchaseDocPendingOVP
  as select from ZI_HH_PurchaseDocumentItem

{
  key PurchaseDocument,
  key PurchaseDocumentItem,

      _PurchaseDocument.Description             as PurchaseDocumentDescription,
      Description,
      OverallItemPrice,
      @Semantics.quantity.unitOfMeasure: 'QuantityUnit'
      Quantity,
      QuantityUnit,
      crea_date_time,
      crea_uname,
      Currency,
      _PurchaseDocument.Priority,
      _PurchaseDocument.Status,
      _PurchaseDocument._Priority.PriorityText as PriorityText,
      _PurchaseDocument._Status.StatusText as StatusText,
      _PurchaseDocument.PurchasingOrganization,

      _PurchaseDocument
}

where _PurchaseDocument.Status = '1'
