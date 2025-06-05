CLASS zcl_hh_purch_doc_gen_data DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS clear_data.
    METHODS fill_priority.
    METHODS fill_purchase_doc.
    METHODS fill_purchase_doc_item.
    METHODS fill_vendor.
    METHODS fill_status.
    METHODS fill_purchorg.
    METHODS fill_indicator.
    METHODS fill_vendor_type.
ENDCLASS.


CLASS zcl_hh_purch_doc_gen_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    clear_data( ).
    fill_priority( ).
    fill_purchase_doc( ).
    fill_purchase_doc_item( ).
    fill_vendor( ).
    fill_status( ).
    fill_purchorg( ).
    fill_indicator( ).
    fill_vendor_type( ).
  ENDMETHOD.

  METHOD clear_data.
    DELETE FROM zhh_purchdocprio.
    DELETE FROM zhh_purchdoc.
    DELETE FROM zhh_purchdocitem.
    DELETE FROM zhh_purchdocsts.
    DELETE FROM zhh_purchorg.
    DELETE FROM zhh_indicator.
    DELETE FROM zhh_indicator_t.
    DELETE FROM zhh_purchvdrtyp.
  ENDMETHOD.

  METHOD fill_priority.
    DATA lt_priority TYPE TABLE OF zhh_purchdocprio.

    lt_priority = VALUE #( ( Priority = '1' PriorityText = 'High' )
                           ( Priority = '2' PriorityText = 'Medium' )
                           ( Priority = '3' PriorityText = 'Low' ) ).

    INSERT zhh_purchdocprio FROM TABLE @lt_priority.
  ENDMETHOD.

  METHOD fill_purchase_doc.
    DATA lt_purchasedocuments TYPE TABLE OF zhh_purchdoc.

    " APPEND VALUE #( PurchaseDocument       = '001'
    "                 Description            = 'Office furniture and supplies for new branch'
    "                 Status                 = 2
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '002'
    "                 Description            = 'Laptops for the IT department'
    "                 Status                 = 1
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '003'
    "                 Description            = 'Office kitchen supplies (plates, utensils, etc.)'
    "                 Status                 = 3
    "                 Priority               = 3
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '004'
    "                 Description            = 'Office printers and toner'
    "                 Status                 = 2
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '005'
    "                 Description            = 'Conference room furniture (tables, chairs)'
    "                 Status                 = 1
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '006'
    "                 Description            = 'Meeting room video conference equipment'
    "                 Status                 = 1
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '007'
    "                 Description            = 'Network switches and routers for office network'
    "                 Status                 = 2
    "                 Priority               = 3
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '008'
    "                 Description            = 'Office decoration (plants, artwork)'
    "                 Status                 = 3
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '009'
    "                 Description            = 'Project management software licenses'
    "                 Status                 = 2
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '010'
    "                 Description            = 'Office air purifiers and ventilation systems'
    "                 Status                 = 1
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '011'
    "                 Description            = 'Office lighting fixtures (LED, dimmable)'
    "                 Status                 = 3
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '012'
    "                 Description            = 'Business software (CRM and ERP licenses)'
    "                 Status                 = 2
    "                 Priority               = 3
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '013'
    "                 Description            = 'Ergonomic office chairs'
    "                 Status                 = 2
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '014'
    "                 Description            = 'Office safety equipment (fire extinguishers, first aid kits)'
    "                 Status                 = 3
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '015'
    "                 Description            = 'Office printer maintenance and support contract'
    "                 Status                 = 2
    "                 Priority               = 3
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '016'
    "                 Description            = 'Office IT accessories (keyboard, mouse, etc.)'
    "                 Status                 = 3
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '017'
    "                 Description            = 'Office stationeries (paper, pens, notebooks)'
    "                 Status                 = 1
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '018'
    "                 Description            = 'Networking cables and connectors'
    "                 Status                 = 2
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '019'
    "                 Description            = 'Conference room audio systems'
    "                 Status                 = 3
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '020'
    "                 Description            = 'Office cleaning supplies (disinfectants, cleaners)'
    "                 Status                 = 2
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '021'
    "                 Description            = 'Office whiteboards and presentation equipment'
    "                 Status                 = 1
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '022'
    "                 Description            = 'Air conditioning units for office spaces'
    "                 Status                 = 3
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '023'
    "                 Description            = 'Office security systems (cameras, alarms)'
    "                 Status                 = 2
    "                 Priority               = 3
    "                 PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '024'
    "                 Description            = 'Office furniture (desks, filing cabinets)'
    "                 Status                 = 3
    "                 Priority               = 1
    "                 PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    " APPEND VALUE #( PurchaseDocument       = '025'
    "                 Description            = 'Business travel agency services'
    "                 Status                 = 1
    "                 Priority               = 2
    "                 PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.

    lt_purchasedocuments = VALUE #(
        ( PurchaseDocument = 1  Description = 'Procurement of high-performance server racks'  Status = 1  Priority = 1  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 2  Description = 'Order for safety helmets and gloves'           Status = 2  Priority = 2  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 3  Description = 'Purchase of industrial-grade hydraulic pumps'  Status = 3  Priority = 3  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 4  Description = 'Procurement of electrical control panels'      Status = 2  Priority = 1  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 5  Description = 'Supply of stainless steel pipes'               Status = 1  Priority = 3  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 6  Description = 'Order for packaging and storage boxes'         Status = 3  Priority = 2  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 7  Description = 'Acquisition of backup diesel generators'       Status = 2  Priority = 1  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 8  Description = 'Purchase of sensor calibration tools'          Status = 1  Priority = 2  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 9  Description = 'Requisition for workstation chairs'            Status = 3  Priority = 3  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 10 Description = 'Procurement of air conditioning units'         Status = 2  Priority = 2  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 11 Description = 'Order for welding and cutting tools'           Status = 1  Priority = 1  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 12 Description = 'Purchase of industrial lubricants'             Status = 3  Priority = 2  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 13 Description = 'Requisition of aluminum sheets'                Status = 2  Priority = 3  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 14 Description = 'Supply of high-temperature insulation mats'    Status = 1  Priority = 1  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 15 Description = 'Procurement of fire extinguishers'             Status = 3  Priority = 2  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 16 Description = 'Order for network switches and routers'        Status = 2  Priority = 1  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 17 Description = 'Purchase of industrial fans and blowers'       Status = 1  Priority = 3  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 18 Description = 'Supply of power tools for workshop'            Status = 3  Priority = 2  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 19 Description = 'Procurement of laboratory test kits'           Status = 1  Priority = 1  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 20 Description = 'Requisition of office stationery supplies'     Status = 2  Priority = 3  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 21 Description = 'Order for LED lighting systems'                Status = 3  Priority = 2  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 22 Description = 'Acquisition of construction safety gear'       Status = 1  Priority = 1  PurchasingOrganization = 'P01' )
        ( PurchaseDocument = 23 Description = 'Procurement of IT accessories and cables'      Status = 2  Priority = 2  PurchasingOrganization = 'P03' )
        ( PurchaseDocument = 24 Description = 'Purchase of maintenance service kits'          Status = 3  Priority = 3  PurchasingOrganization = 'P02' )
        ( PurchaseDocument = 25 Description = 'Order for replacement machine components'      Status = 1  Priority = 1  PurchasingOrganization = 'P01' ) ).

    INSERT zhh_purchdoc FROM TABLE @lt_purchasedocuments.

    GET TIME STAMP FIELD DATA(lv_date).
*    data(lv_date) = cl_abap_context_info=>get_system_date( ).
    DATA(lv_uname) = sy-uname.

    UPDATE zhh_purchdoc
      SET PurchaseDocumentImageURL = 'https://cdn-icons-png.flaticon.com/512/3097/3097180.png',
          crea_date_time = @lv_date,
          crea_uname = @lv_uname,
          lchg_date_time = @lv_date,
          lchg_uname = @lv_uname
      WHERE PurchaseDocumentImageURL IS INITIAL.
  ENDMETHOD.

  METHOD fill_purchase_doc_item.
    DATA lt_purchase_items TYPE TABLE OF zhh_purchdocitem.

    lt_purchase_items = VALUE #(
        Currency     = 'USD'
        QuantityUnit = 'PC'
        ( PurchaseDocument     = 1
          PurchaseDocumentItem = 10
          Description          = 'High-performance server rack'
          Price                = 250
          Quantity             = 16
          Vendor               = 'VDR01'
          VendorType           = 'I' )
        ( PurchaseDocument     = 1
          PurchaseDocumentItem = 20
          Description          = 'Server rack cooling unit'
          Price                = 400
          Quantity             = 10
          Vendor               = 'VDR02'
          VendorType           = 'E' )

        ( PurchaseDocument = 2 PurchaseDocumentItem = 10 Description = 'Safety helmet' Price = 180 Quantity = 20 Vendor = 'VDR03' VendorType = 'I' )
        ( PurchaseDocument = 2 PurchaseDocumentItem = 20 Description = 'Protective gloves' Price = 150 Quantity = 25 Vendor = 'VDR01' VendorType = 'E' )

        ( PurchaseDocument     = 3
          PurchaseDocumentItem = 10
          Description          = 'Industrial hydraulic pump'
          Price                = 700
          Quantity             = 8
          Vendor               = 'VDR04'
          VendorType           = 'I' )
        ( PurchaseDocument = 3 PurchaseDocumentItem = 20 Description = 'Hydraulic pump seal kit' Price = 180 Quantity = 18 Vendor = 'VDR05' VendorType = 'E' )

        ( PurchaseDocument = 4 PurchaseDocumentItem = 10 Description = 'Electrical control panel' Price = 900 Quantity = 7 Vendor = 'VDR01' VendorType = 'I' )
        ( PurchaseDocument     = 4
          PurchaseDocumentItem = 20
          Description          = 'Control panel mounting hardware'
          Price                = 120
          Quantity             = 35
          Vendor               = 'VDR03'
          VendorType           = 'E' )

        ( PurchaseDocument = 5 PurchaseDocumentItem = 10 Description = 'Stainless steel pipe' Price = 300 Quantity = 25 Vendor = 'VDR02' VendorType = 'I' )
        ( PurchaseDocument = 5 PurchaseDocumentItem = 20 Description = 'Pipe fittings' Price = 150 Quantity = 30 Vendor = 'VDR05' VendorType = 'E' )
        ( PurchaseDocument = 5 PurchaseDocumentItem = 30 Description = 'Industrial cooling fan' Price = 500 Quantity = 12 Vendor = 'VDR02' VendorType = 'I' )

        ( PurchaseDocument = 6 PurchaseDocumentItem = 10 Description = 'LED lighting system' Price = 400 Quantity = 14 Vendor = 'VDR01' VendorType = 'E' )
        ( PurchaseDocument = 6 PurchaseDocumentItem = 20 Description = 'Digital pressure gauge' Price = 600 Quantity = 11 Vendor = 'VDR02' VendorType = 'I' )
        ( PurchaseDocument = 6 PurchaseDocumentItem = 30 Description = 'Light mounting brackets' Price = 200 Quantity = 20 Vendor = 'VDR01' VendorType = 'E' )

        ( PurchaseDocument     = 7
          PurchaseDocumentItem = 10
          Description          = 'Variable frequency drive (VFD)'
          Price                = 800
          Quantity             = 10
          Vendor               = 'VDR05'
          VendorType           = 'E' )
        ( PurchaseDocument = 7 PurchaseDocumentItem = 20 Description = 'Backup safety sensor' Price = 400 Quantity = 12 Vendor = 'VDR04' VendorType = 'I' )
        ( PurchaseDocument     = 7
          PurchaseDocumentItem = 30
          Description          = 'Industrial control relay'
          Price                = 450
          Quantity             = 10
          Vendor               = 'VDR02'
          VendorType           = 'I' )
        ( PurchaseDocument = 7 PurchaseDocumentItem = 40 Description = 'Welding safety kit' Price = 250 Quantity = 15 Vendor = 'VDR01' VendorType = 'E' )

        ( PurchaseDocument = 8 PurchaseDocumentItem = 10 Description = 'Flexible connectors' Price = 350 Quantity = 15 Vendor = 'VDR03' VendorType = 'E' )
        ( PurchaseDocument = 8 PurchaseDocumentItem = 20 Description = 'Heavy-duty storage bins' Price = 500 Quantity = 18 Vendor = 'VDR01' VendorType = 'E' )
        ( PurchaseDocument     = 8
          PurchaseDocumentItem = 30
          Description          = 'Stainless steel piping kit'
          Price                = 300
          Quantity             = 10
          Vendor               = 'VDR05'
          VendorType           = 'E' )
        ( PurchaseDocument = 8 PurchaseDocumentItem = 40 Description = 'Network router' Price = 250 Quantity = 12 Vendor = 'VDR01' VendorType = 'E' )

        ( PurchaseDocument     = 9
          PurchaseDocumentItem = 10
          Description          = 'Grounding and protection unit'
          Price                = 450
          Quantity             = 8
          Vendor               = 'VDR03'
          VendorType           = 'E' )
        ( PurchaseDocument = 9 PurchaseDocumentItem = 20 Description = 'Air conditioning unit' Price = 600 Quantity = 9 Vendor = 'VDR05' VendorType = 'E' )
        ( PurchaseDocument = 9 PurchaseDocumentItem = 30 Description = 'Flexible connectors' Price = 300 Quantity = 10 Vendor = 'VDR04' VendorType = 'I' )

        ( PurchaseDocument     = 10
          PurchaseDocumentItem = 10
          Description          = 'Server rack cooling unit'
          Price                = 480
          Quantity             = 15
          Vendor               = 'VDR02'
          VendorType           = 'E' )
        ( PurchaseDocument     = 10
          PurchaseDocumentItem = 20
          Description          = 'Industrial fans and blowers'
          Price                = 550
          Quantity             = 12
          Vendor               = 'VDR03'
          VendorType           = 'I' )

        ( PurchaseDocument     = 11
          PurchaseDocumentItem = 10
          Description          = 'Welding and cutting tools'
          Price                = 600
          Quantity             = 10
          Vendor               = 'VDR01'
          VendorType           = 'E' )
        ( PurchaseDocument = 11 PurchaseDocumentItem = 20 Description = 'Safety goggles' Price = 120 Quantity = 30 Vendor = 'VDR04' VendorType = 'I' )

        ( PurchaseDocument = 12 PurchaseDocumentItem = 10 Description = 'Industrial lubricants' Price = 400 Quantity = 16 Vendor = 'VDR02' VendorType = 'E' )
        ( PurchaseDocument     = 12
          PurchaseDocumentItem = 20
          Description          = 'Lubricant application kit'
          Price                = 320
          Quantity             = 12
          Vendor               = 'VDR05'
          VendorType           = 'E' )

        ( PurchaseDocument = 13 PurchaseDocumentItem = 10 Description = 'Aluminum sheets' Price = 350 Quantity = 20 Vendor = 'VDR03' VendorType = 'I' )
        ( PurchaseDocument = 13 PurchaseDocumentItem = 20 Description = 'Sheet metal fasteners' Price = 150 Quantity = 25 Vendor = 'VDR01' VendorType = 'E' )
        ( PurchaseDocument = 13 PurchaseDocumentItem = 30 Description = 'Industrial paint' Price = 200 Quantity = 20 Vendor = 'VDR02' VendorType = 'I' )

        ( PurchaseDocument     = 14
          PurchaseDocumentItem = 10
          Description          = 'High-temperature insulation mats'
          Price                = 380
          Quantity             = 16
          Vendor               = 'VDR05'
          VendorType           = 'E' )
        ( PurchaseDocument = 14 PurchaseDocumentItem = 20 Description = 'Insulation adhesive' Price = 220 Quantity = 25 Vendor = 'VDR04' VendorType = 'I' )

        ( PurchaseDocument = 15 PurchaseDocumentItem = 10 Description = 'Fire extinguishers' Price = 500 Quantity = 15 Vendor = 'VDR01' VendorType = 'E' )
        ( PurchaseDocument = 15 PurchaseDocumentItem = 20 Description = 'Fire safety signage' Price = 100 Quantity = 40 Vendor = 'VDR03' VendorType = 'I' )

        ( PurchaseDocument     = 16
          PurchaseDocumentItem = 10
          Description          = 'Network switches and routers'
          Price                = 650
          Quantity             = 10
          Vendor               = 'VDR02'
          VendorType           = 'I' )
        ( PurchaseDocument     = 16
          PurchaseDocumentItem = 20
          Description          = 'Switch mounting brackets'
          Price                = 200
          Quantity             = 15
          Vendor               = 'VDR04'
          VendorType           = 'I' )

        ( PurchaseDocument     = 17
          PurchaseDocumentItem = 10
          Description          = 'Industrial fans and blowers'
          Price                = 550
          Quantity             = 12
          Vendor               = 'VDR05'
          VendorType           = 'E' )
        ( PurchaseDocument     = 17
          PurchaseDocumentItem = 20
          Description          = 'Control interface module'
          Price                = 450
          Quantity             = 10
          Vendor               = 'VDR03'
          VendorType           = 'I' )

        ( PurchaseDocument     = 18
          PurchaseDocumentItem = 10
          Description          = 'Power tools for workshop'
          Price                = 600
          Quantity             = 14
          Vendor               = 'VDR01'
          VendorType           = 'E' )
        ( PurchaseDocument = 18 PurchaseDocumentItem = 20 Description = 'Tool storage cabinet' Price = 400 Quantity = 10 Vendor = 'VDR04' VendorType = 'I' )

        ( PurchaseDocument = 19 PurchaseDocumentItem = 10 Description = 'Laboratory test kits' Price = 350 Quantity = 20 Vendor = 'VDR02' VendorType = 'I' )
        ( PurchaseDocument     = 19
          PurchaseDocumentItem = 20
          Description          = 'Testing equipment calibration'
          Price                = 650
          Quantity             = 10
          Vendor               = 'VDR05'
          VendorType           = 'E' )

        ( PurchaseDocument     = 20
          PurchaseDocumentItem = 10
          Description          = 'Office stationery supplies'
          Price                = 120
          Quantity             = 30
          Vendor               = 'VDR03'
          VendorType           = 'I' )
        ( PurchaseDocument = 20 PurchaseDocumentItem = 20 Description = 'Desk organizers' Price = 200 Quantity = 20 Vendor = 'VDR01' VendorType = 'E' )
        ( PurchaseDocument     = 20
          PurchaseDocumentItem = 30
          Description          = 'Ergonomic workstation chair'
          Price                = 550
          Quantity             = 10
          Vendor               = 'VDR04'
          VendorType           = 'I' )

        ( PurchaseDocument = 21 PurchaseDocumentItem = 10 Description = 'LED lighting systems' Price = 400 Quantity = 15 Vendor = 'VDR01' VendorType = 'E' )
        ( PurchaseDocument     = 21
          PurchaseDocumentItem = 20
          Description          = 'Light mounting hardware'
          Price                = 350
          Quantity             = 12
          Vendor               = 'VDR05'
          VendorType           = 'E' )

        ( PurchaseDocument     = 22
          PurchaseDocumentItem = 10
          Description          = 'Construction safety gear'
          Price                = 350
          Quantity             = 15
          Vendor               = 'VDR04'
          VendorType           = 'I' )
        ( PurchaseDocument = 22 PurchaseDocumentItem = 20 Description = 'Safety harness kit' Price = 400 Quantity = 12 Vendor = 'VDR02' VendorType = 'I' )

        ( PurchaseDocument     = 23
          PurchaseDocumentItem = 10
          Description          = 'IT accessories and cables'
          Price                = 200
          Quantity             = 20
          Vendor               = 'VDR01'
          VendorType           = 'E' )
        ( PurchaseDocument = 23 PurchaseDocumentItem = 20 Description = 'Cable management kits' Price = 450 Quantity = 10 Vendor = 'VDR05' VendorType = 'E' )

        ( PurchaseDocument     = 24
          PurchaseDocumentItem = 10
          Description          = 'Maintenance service kits'
          Price                = 500
          Quantity             = 14
          Vendor               = 'VDR03'
          VendorType           = 'I' )
        ( PurchaseDocument = 24 PurchaseDocumentItem = 20 Description = 'Repair tools' Price = 450 Quantity = 12 Vendor = 'VDR01' VendorType = 'E' )

        ( PurchaseDocument = 25 PurchaseDocumentItem = 10 Description = 'Battery backup systems' Price = 650 Quantity = 10 Vendor = 'VDR04' VendorType = 'I' )
        ( PurchaseDocument = 25 PurchaseDocumentItem = 20 Description = 'Power surge protectors' Price = 400 Quantity = 15 Vendor = 'VDR02' VendorType = 'I' )
        ( PurchaseDocument = 25 PurchaseDocumentItem = 30 Description = 'Cable connectors' Price = 350 Quantity = 12 Vendor = 'VDR05' VendorType = 'E' ) ).

    INSERT zhh_purchdocitem FROM TABLE @lt_purchase_items.

    GET TIME STAMP FIELD DATA(lv_date).
    DATA(lv_uname) = sy-uname.

    UPDATE zhh_purchdocitem
      SET purchasedocumentitemimageurl = 'https://cdn-icons-png.flaticon.com/512/1768/1768214.png',
          crea_date_time = @lv_date,
          crea_uname = @lv_uname,
          lchg_date_time = @lv_date,
          lchg_uname = @lv_uname
      WHERE PurchaseDocumentitemImageURL IS INITIAL.
  ENDMETHOD.

  METHOD fill_vendor.
*    APPEND VALUE #( vendor = 'VDR01' name = 'Tech Supplies Inc.' address = '123 Tech Street, City Center, TechLand' contact_person = 'John Doe' phonenumber = '+1 555-1234' emailaddress = 'sales@techsupplies.com' ) TO lt_vendors.
*APPEND VALUE #( vendor = 'VDR02' name = 'Office Solutions Co.' address = '456 Office Road, Business Park, OfficeCity' contact_person = 'Jane Smith' phonenumber = '+1 555-5678' emailaddress = 'info@officesolutions.com' ) TO lt_vendors.
*APPEND VALUE #( vendor = 'VDR03' name = 'Comfort Seating Ltd.' address = '789 Comfort Blvd, SeatTown' contact_person = 'Alice Johnson' phonenumber = '+1 555-8765' emailaddress = 'contact@comfortseating.com' ) TO lt_vendors.
*APPEND VALUE #( vendor = 'VDR04' name = 'Global Electronics Inc.' address = '321 Electronics Way, Tech Park' contact_person = 'Bob Brown' phonenumber = '+1 555-4321' emailaddress = 'support@globalelectronics.com' ) TO lt_vendors.
*APPEND VALUE #( vendor = 'VDR05' name = 'EcoTech Solutions' address = '654 Green Valley, EcoCity' contact_person = 'Charlie White' phonenumber = '+1 555-6789' emailaddress = 'contact@ecotechsolutions.com' ) TO lt_vendors.
  ENDMETHOD.

  METHOD fill_status.
    DATA lt_status TYPE TABLE OF zhh_purchdocsts.

    APPEND VALUE #( status     = '1'
                    statustext = 'Created' ) TO lt_status.
    APPEND VALUE #( status     = '2'
                    statustext = 'Approved' ) TO lt_status.
    APPEND VALUE #( status     = '3'
                    statustext = 'Rejected' ) TO lt_status.
    INSERT zhh_purchdocsts FROM TABLE @lt_status.
  ENDMETHOD.

  METHOD fill_purchorg.
    DATA lt_purch_org TYPE TABLE OF zhh_purchorg.

    APPEND VALUE #( PurchasingOrganization = 'P01'
                    Description            = 'Purchasing Organization 1'
                    EmailAddress           = 'purchasing1@company.com'
                    PhoneNumber            = '+1 555-1000'
                    FaxNumber              = '+1 555-1001' ) TO lt_purch_org.

    APPEND VALUE #( PurchasingOrganization = 'P02'
                    Description            = 'Purchasing Organization 2'
                    EmailAddress           = 'purchasing2@company.com'
                    PhoneNumber            = '+1 555-2000'
                    FaxNumber              = '+1 555-2001' ) TO lt_purch_org.

    APPEND VALUE #( PurchasingOrganization = 'P03'
                    Description            = 'Purchasing Organization 3'
                    EmailAddress           = 'purchasing3@company.com'
                    PhoneNumber            = '+1 555-3000'
                    FaxNumber              = '+1 555-3001' ) TO lt_purch_org.
    INSERT zhh_purchorg FROM TABLE @lt_purch_org.
  ENDMETHOD.

  METHOD fill_indicator.
    DATA lt_indicator   TYPE TABLE OF zhh_indicator.
    DATA lt_indicator_t TYPE TABLE OF zhh_indicator_t.

    lt_indicator = VALUE #( ( domvalue_l = 'X' )
                            ( domvalue_l = '' ) ).

    lt_indicator_t = VALUE #( ddlanguage = 'E'
                              ( domvalue_l = 'X' ddtext = 'Yes' )
                              ( domvalue_l = '' ddtext = 'No' ) ).

    INSERT zhh_indicator FROM TABLE @lt_indicator.
    INSERT zhh_indicator_t FROM TABLE @lt_indicator_t.
  ENDMETHOD.

  METHOD fill_vendor_type.
    DATA lt_vendor_type TYPE TABLE OF zhh_purchvdrtyp.

    lt_vendor_type = VALUE #( ( vendortype = 'I' vendortypetext = 'Internal' )
                              ( vendortype = 'E' vendortypetext = 'External' ) ).

    INSERT zhh_purchvdrtyp FROM TABLE @lt_vendor_type.
  ENDMETHOD.
ENDCLASS.
