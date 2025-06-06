@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Indicator Text'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'IndicatorValue'
@ObjectModel.usageType: { serviceQuality: #X, sizeCategory: #S, dataClass: #MIXED }

@VDM.viewType: #BASIC

define view entity ZI_HH_IndicatorText
  as select from zhh_indicator_t

  association [0..1] to ZI_HH_Indicator as _Indicator on $projection.IndicatorValue = _Indicator.IndicatorValue
  association [0..1] to I_Language      as _Language  on $projection.Language = _Language.Language

{
      @ObjectModel.foreignKey.association: '_Language'
      @Semantics.language: true
  key ddlanguage                                        as Language,

  key cast(substring(domvalue_l, 1, 1) as abap_boolean) as  IndicatorValue,

      @Semantics.text: true
      ddtext                                            as  IndicatorText,

      _Indicator,
      _Language
}
