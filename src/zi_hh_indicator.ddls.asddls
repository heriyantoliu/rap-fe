@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Indicator'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_HH_Indicator as select from zhh_indicator
  association [0..*] to ZI_HH_IndicatorText as _IndicatorText
      on  $projection.IndicatorValue = _IndicatorText.IndicatorValue 
{
  key cast ( substring( domvalue_l, 1, 1 ) as abap_boolean ) as  IndicatorValue,
  _IndicatorText
}
