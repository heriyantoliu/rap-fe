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
  ENDMETHOD.

  METHOD clear_data.
    DELETE FROM zhh_purchdocprio.
    DELETE FROM zhh_purchdoc.
    DELETE FROM zhh_purchdocitem.
    DELETE FROM zhh_purchdocsts.
    DELETE FROM zhh_purchorg.
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

    APPEND VALUE #( PurchaseDocument       = 'PD001'
                    Description            = 'Office furniture and supplies for new branch'
                    Status                 = 2
                    Priority               = 1
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD002'
                    Description            = 'Laptops for the IT department'
                    Status                 = 1
                    Priority               = 2
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD003'
                    Description            = 'Office kitchen supplies (plates, utensils, etc.)'
                    Status                 = 3
                    Priority               = 3
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD004'
                    Description            = 'Office printers and toner'
                    Status                 = 2
                    Priority               = 2
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD005'
                    Description            = 'Conference room furniture (tables, chairs)'
                    Status                 = 1
                    Priority               = 1
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD006'
                    Description            = 'Meeting room video conference equipment'
                    Status                 = 1
                    Priority               = 2
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD007'
                    Description            = 'Network switches and routers for office network'
                    Status                 = 2
                    Priority               = 3
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD008'
                    Description            = 'Office decoration (plants, artwork)'
                    Status                 = 3
                    Priority               = 2
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD009'
                    Description            = 'Project management software licenses'
                    Status                 = 2
                    Priority               = 1
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD010'
                    Description            = 'Office air purifiers and ventilation systems'
                    Status                 = 1
                    Priority               = 2
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD011'
                    Description            = 'Office lighting fixtures (LED, dimmable)'
                    Status                 = 3
                    Priority               = 1
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD012'
                    Description            = 'Business software (CRM and ERP licenses)'
                    Status                 = 2
                    Priority               = 3
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD013'
                    Description            = 'Ergonomic office chairs'
                    Status                 = 2
                    Priority               = 1
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD014'
                    Description            = 'Office safety equipment (fire extinguishers, first aid kits)'
                    Status                 = 3
                    Priority               = 2
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD015'
                    Description            = 'Office printer maintenance and support contract'
                    Status                 = 2
                    Priority               = 3
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD016'
                    Description            = 'Office IT accessories (keyboard, mouse, etc.)'
                    Status                 = 3
                    Priority               = 2
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD017'
                    Description            = 'Office stationeries (paper, pens, notebooks)'
                    Status                 = 1
                    Priority               = 1
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD018'
                    Description            = 'Networking cables and connectors'
                    Status                 = 2
                    Priority               = 2
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD019'
                    Description            = 'Conference room audio systems'
                    Status                 = 3
                    Priority               = 1
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD020'
                    Description            = 'Office cleaning supplies (disinfectants, cleaners)'
                    Status                 = 2
                    Priority               = 2
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD021'
                    Description            = 'Office whiteboards and presentation equipment'
                    Status                 = 1
                    Priority               = 1
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD022'
                    Description            = 'Air conditioning units for office spaces'
                    Status                 = 3
                    Priority               = 2
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD023'
                    Description            = 'Office security systems (cameras, alarms)'
                    Status                 = 2
                    Priority               = 3
                    PurchasingOrganization = 'P02' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD024'
                    Description            = 'Office furniture (desks, filing cabinets)'
                    Status                 = 3
                    Priority               = 1
                    PurchasingOrganization = 'P03' ) TO lt_purchasedocuments.
    APPEND VALUE #( PurchaseDocument       = 'PD025'
                    Description            = 'Business travel agency services'
                    Status                 = 1
                    Priority               = 2
                    PurchasingOrganization = 'P01' ) TO lt_purchasedocuments.

    INSERT zhh_purchdoc FROM TABLE @lt_purchasedocuments.
  ENDMETHOD.

  METHOD fill_purchase_doc_item.
    DATA lt_purchase_items TYPE TABLE OF zhh_purchdocitem.

    APPEND VALUE #( PurchaseDocument     = 'PD001'
                    PurchaseDocumentItem = 'PD001-01'
                    Description          = 'Laptops for office staff (i5, 8GB RAM)'
                    Price                = 1000
                    Quantity             = 25
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD001'
                    PurchaseDocumentItem = 'PD001-02'
                    Description          = 'Laptop accessories (mice, keyboards)'
                    Price                = 50
                    Quantity             = 50
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD002'
                    PurchaseDocumentItem = 'PD002-01'
                    Description          = 'Office chairs (ergonomic, adjustable)'
                    Price                = 150
                    Quantity             = 30
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR03'
                    Currency             = 'EUR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD002'
                    PurchaseDocumentItem = 'PD002-02'
                    Description          = 'Executive chairs (leather, high-back)'
                    Price                = 250
                    Quantity             = 20
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR04'
                    Currency             = 'EUR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD003'
                    PurchaseDocumentItem = 'PD003-01'
                    Description          = 'Desks for office (adjustable height)'
                    Price                = 300
                    Quantity             = 40
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD003'
                    PurchaseDocumentItem = 'PD003-02'
                    Description          = 'Workstations (with multiple screens)'
                    Price                = 400
                    Quantity             = 15
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD004'
                    PurchaseDocumentItem = 'PD004-01'
                    Description          = 'Projector for conference room'
                    Price                = 1200
                    Quantity             = 10
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR05'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD004'
                    PurchaseDocumentItem = 'PD004-02'
                    Description          = 'Projection screens (motorized)'
                    Price                = 500
                    Quantity             = 12
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'IDR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD005'
                    PurchaseDocumentItem = 'PD005-01'
                    Description          = 'External hard drives (2TB)'
                    Price                = 100
                    Quantity             = 40
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'EUR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD005'
                    PurchaseDocumentItem = 'PD005-02'
                    Description          = 'Network storage (5TB NAS)'
                    Price                = 1500
                    Quantity             = 5
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR03'
                    Currency             = 'EUR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD006'
                    PurchaseDocumentItem = 'PD006-01'
                    Description          = 'Air conditioning units for office'
                    Price                = 800
                    Quantity             = 12
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR04'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD006'
                    PurchaseDocumentItem = 'PD006-02'
                    Description          = 'HVAC filters and replacements'
                    Price                = 150
                    Quantity             = 50
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD008'
                    PurchaseDocumentItem = 'PD008-01'
                    Description          = 'Office decoration (plants, artwork)'
                    Price                = 100
                    Quantity             = 30
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR03'
                    Currency             = 'EUR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD008'
                    PurchaseDocumentItem = 'PD008-02'
                    Description          = 'Office wall clocks'
                    Price                = 50
                    Quantity             = 50
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'EUR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD009'
                    PurchaseDocumentItem = 'PD009-01'
                    Description          = 'Project management software licenses'
                    Price                = 800
                    Quantity             = 15
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD009'
                    PurchaseDocumentItem = 'PD009-02'
                    Description          = 'Software licenses for accounting system (annual)'
                    Price                = 1200
                    Quantity             = 10
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD010'
                    PurchaseDocumentItem = 'PD010-01'
                    Description          = 'Office air purifiers (HEPA filter)'
                    Price                = 1500000
                    Quantity             = 5
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR05'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD010'
                    PurchaseDocumentItem = 'PD010-02'
                    Description          = 'Air purifiers for large rooms'
                    Price                = 1200000
                    Quantity             = 10
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'IDR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD011'
                    PurchaseDocumentItem = 'PD011-01'
                    Description          = 'Office lighting fixtures (LED, dimmable)'
                    Price                = 75
                    Quantity             = 50
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD011'
                    PurchaseDocumentItem = 'PD011-02'
                    Description          = 'LED light bulbs (for office use)'
                    Price                = 30
                    Quantity             = 150
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR03'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD012'
                    PurchaseDocumentItem = 'PD012-01'
                    Description          = 'Business software (CRM and ERP licenses)'
                    Price                = 3000
                    Quantity             = 5
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR04'
                    Currency             = 'EUR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD012'
                    PurchaseDocumentItem = 'PD012-02'
                    Description          = 'HR management software licenses'
                    Price                = 1500
                    Quantity             = 10
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR05'
                    Currency             = 'EUR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD013'
                    PurchaseDocumentItem = 'PD013-01'
                    Description          = 'Ergonomic office chairs (adjustable)'
                    Price                = 300
                    Quantity             = 30
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD013'
                    PurchaseDocumentItem = 'PD013-02'
                    Description          = 'Executive office chairs (leather, high-back)'
                    Price                = 450
                    Quantity             = 20
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD014'
                    PurchaseDocumentItem = 'PD014-01'
                    Description          = 'Fire extinguishers (office use)'
                    Price                = 150
                    Quantity             = 20
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD014'
                    PurchaseDocumentItem = 'PD014-02'
                    Description          = 'First aid kits for office (compliance kits)'
                    Price                = 60
                    Quantity             = 30
                    QuantityUnit         = 'BOX'
                    Vendor               = 'VDR05'
                    Currency             = 'IDR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD015'
                    PurchaseDocumentItem = 'PD015-01'
                    Description          = 'Printer maintenance service contract (12 months)'
                    Price                = 250
                    Quantity             = 1
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR03'
                    Currency             = 'EUR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD015'
                    PurchaseDocumentItem = 'PD015-02'
                    Description          = 'Printer toner (color)'
                    Price                = 150
                    Quantity             = 5
                    QuantityUnit         = 'BOX'
                    Vendor               = 'VDR01'
                    Currency             = 'EUR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD016'
                    PurchaseDocumentItem = 'PD016-01'
                    Description          = 'Office IT accessories (keyboard, mouse, etc.)'
                    Price                = 25
                    Quantity             = 100
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD016'
                    PurchaseDocumentItem = 'PD016-02'
                    Description          = 'External hard drives (2TB)'
                    Price                = 150
                    Quantity             = 20
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR04'
                    Currency             = 'IDR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD017'
                    PurchaseDocumentItem = 'PD017-01'
                    Description          = 'Office stationeries (paper, pens, notebooks)'
                    Price                = 15
                    Quantity             = 200
                    QuantityUnit         = 'BOX'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD017'
                    PurchaseDocumentItem = 'PD017-02'
                    Description          = 'Whiteboard markers and erasers'
                    Price                = 10
                    Quantity             = 100
                    QuantityUnit         = 'BOX'
                    Vendor               = 'VDR03'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD018'
                    PurchaseDocumentItem = 'PD018-01'
                    Description          = 'Networking cables (Cat6, 50 meters)'
                    Price                = 20
                    Quantity             = 50
                    QuantityUnit         = 'BOX'
                    Vendor               = 'VDR02'
                    Currency             = 'EUR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD018'
                    PurchaseDocumentItem = 'PD018-02'
                    Description          = 'Patch panels (24 ports, rack mount)'
                    Price                = 100
                    Quantity             = 15
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'EUR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD019'
                    PurchaseDocumentItem = 'PD019-01'
                    Description          = 'Conference room audio systems (speakers, microphonenumbers)'
                    Price                = 500
                    Quantity             = 5
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD019'
                    PurchaseDocumentItem = 'PD019-02'
                    Description          = 'Conference room speaker system (wireless)'
                    Price                = 250
                    Quantity             = 10
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR03'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD020'
                    PurchaseDocumentItem = 'PD020-01'
                    Description          = 'Office cleaning supplies (disinfectants, mops)'
                    Price                = 30
                    Quantity             = 50
                    QuantityUnit         = 'BOX'
                    Vendor               = 'VDR01'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD020'
                    PurchaseDocumentItem = 'PD020-02'
                    Description          = 'Office cleaning services (monthly)'
                    Price                = 300
                    Quantity             = 12
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'IDR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD021'
                    PurchaseDocumentItem = 'PD021-01'
                    Description          = 'Office whiteboards (magnetic, 4x6 ft)'
                    Price                = 200
                    Quantity             = 25
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD021'
                    PurchaseDocumentItem = 'PD021-02'
                    Description          = 'Office presentation tools (projectors, screens)'
                    Price                = 500
                    Quantity             = 15
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD022'
                    PurchaseDocumentItem = 'PD022-01'
                    Description          = 'Air conditioning units for office spaces'
                    Price                = 800
                    Quantity             = 10
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR05'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD022'
                    PurchaseDocumentItem = 'PD022-02'
                    Description          = 'HVAC filters and replacements'
                    Price                = 150
                    Quantity             = 40
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'IDR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD023'
                    PurchaseDocumentItem = 'PD023-01'
                    Description          = 'Office security systems (cameras, alarms)'
                    Price                = 300
                    Quantity             = 20
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR03'
                    Currency             = 'EUR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD023'
                    PurchaseDocumentItem = 'PD023-02'
                    Description          = 'Access control systems (cards, door readers)'
                    Price                = 250
                    Quantity             = 30
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR04'
                    Currency             = 'EUR' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD024'
                    PurchaseDocumentItem = 'PD024-01'
                    Description          = 'Network servers (rack-mountable)'
                    Price                = 2000
                    Quantity             = 8
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'USD' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD024'
                    PurchaseDocumentItem = 'PD024-02'
                    Description          = 'Server software licenses (annual)'
                    Price                = 500
                    Quantity             = 15
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR05'
                    Currency             = 'USD' ) TO lt_purchase_items.

    APPEND VALUE #( PurchaseDocument     = 'PD025'
                    PurchaseDocumentItem = 'PD025-01'
                    Description          = 'Office furniture (desks, chairs)'
                    Price                = 250
                    Quantity             = 50
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR02'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    APPEND VALUE #( PurchaseDocument     = 'PD025'
                    PurchaseDocumentItem = 'PD025-02'
                    Description          = 'Meeting room furniture (conference tables, chairs)'
                    Price                = 500
                    Quantity             = 10
                    QuantityUnit         = 'ST'
                    Vendor               = 'VDR01'
                    Currency             = 'IDR' ) TO lt_purchase_items.
    INSERT zhh_purchdocitem FROM TABLE @lt_purchase_items.
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
                    statustext = 'Closed' ) TO lt_status.
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
    insert zhh_purchorg from table @lt_purch_org.
  ENDMETHOD.
ENDCLASS.
