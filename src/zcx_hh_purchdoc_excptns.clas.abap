CLASS zcx_hh_purchdoc_excptns DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF purchasedocumentitem,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENTITEM',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchasedocumentitem .
    CONSTANTS:
      BEGIN OF purchasedocument,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '000',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENT',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchasedocument .
    CONSTANTS:
      BEGIN OF approved,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENT',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF approved .
    CONSTANTS:
      BEGIN OF purchasedocexists,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENT',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchasedocexists .
    CONSTANTS:
      BEGIN OF purchasedocintial,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '009',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENTITEM',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchasedocintial .
    CONSTANTS:
      BEGIN OF purchdocitemexists,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '007',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENTITEM',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchdocitemexists .
    CONSTANTS:
      BEGIN OF purchdociteminitial,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '010',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchdociteminitial .
    CONSTANTS:
      BEGIN OF purchasedocexitsinbuffer,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '006',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENT',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchasedocexitsinbuffer .
    CONSTANTS:
      BEGIN OF purchdocitemexistsinbuffer,
        msgid TYPE symsgid VALUE 'ZHH_PURCHDOC_EXCP',
        msgno TYPE symsgno VALUE '008',
        attr1 TYPE scx_attrname VALUE 'MV_PURCHASEDOCUMENTITEM',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF purchdocitemexistsinbuffer .
    DATA mv_currency_code TYPE tcurr_curr .
    DATA mv_purchasedocument TYPE zhh_purchdocdtel.
    DATA mv_uname TYPE syuname .
    DATA mv_purchasedocumentitem TYPE zhh_purchdocdtel.

    METHODS constructor
      IMPORTING
        !textid                  LIKE if_t100_message=>t100key OPTIONAL
        !previous                LIKE previous OPTIONAL
        !mv_currency_code        TYPE tcurr_curr OPTIONAL
        !mv_purchasedocument     TYPE zhh_purchdocdtel OPTIONAL
        !mv_uname                TYPE syuname OPTIONAL
        !mv_purchasedocumentitem TYPE zhh_purchdocdtel OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_hh_purchdoc_excptns IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    me->mv_currency_code = mv_currency_code .
    me->mv_purchasedocument = mv_purchasedocument .
    me->mv_uname = mv_uname .
    me->mv_purchasedocumentitem = mv_purchasedocumentitem .
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.


ENDCLASS.
