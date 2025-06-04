@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@Analytics.dataCategory: #DIMENSION

@EndUserText.label: 'Indicator'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'IndicatorValue'
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_Indicator
  as select from zhh_indicator

  association [0..*] to ZI_HH_IndicatorText as _IndicatorText on $projection.IndicatorValue = _IndicatorText.IndicatorValue

{
      @ObjectModel.text.association: '_IndicatorText'
  key cast(substring(domvalue_l, 1, 1) as abap_boolean) as  IndicatorValue,

      _IndicatorText
}
