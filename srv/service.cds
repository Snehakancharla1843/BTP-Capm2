using { ust.sneha.kancharla.db as db } from '../db/schema';

service Myservice {

  entity BusinessPartner as projection on db.master.businesspartner;
  entity Address         as projection on db.master.address;
  entity Product         as projection on db.master.product;

  @odata.draft.enabled
  @UI.HeaderInfo: {
    TypeName       : 'Purchase Order',
    TypeNamePlural : 'Purchase Orders',
    Title          : { Value: PO_ID },
    Description    : { Value: OVERALL_STATUS }
  }

  @UI.SelectionFields: [
    PO_ID,
    PARTNER_GUID,
    LIFECYCLE_STATUS,
    OVERALL_STATUS
  ]

  @UI.LineItem: [
    { Value: NODE_KEY,         Label: 'NODE KEY' },
    { Value: PO_ID,            Label: 'PURCHASE ORDER ID' },
    { Value: PARTNER_GUID.NODE_KEY,     Label: 'PARTNER GUID' },
    { Value: CURRENCY.code,         Label: 'CURRENCY' },
    { Value: GROSS_AMOUNT,     Label: 'GROSS AMOUNT' },
    { Value: NET_AMOUNT,       Label: 'NET AMOUNT' },
    { Value: TAX_AMOUNT,       Label: 'TAX AMOUNT' },
    { Value: LIFECYCLE_STATUS, Label: 'LIFECYCLE STATUS' },
    { Value: OVERALL_STATUS,   Label: 'OVERALL STATUS' }
  ]

  @UI.Identification: [
    { Value: NODE_KEY,         Label: 'NODE KEY' },
    { Value: PO_ID,            Label: 'PURCHASE ORDER ID' },
    { Value: PARTNER_GUID.NODE_KEY,     Label: 'PARTNER GUID' },
    { Value: CURRENCY.code,         Label: 'CURRENCY' },
    { Value: GROSS_AMOUNT,     Label: 'GROSS AMOUNT' },
    { Value: NET_AMOUNT,       Label: 'NET AMOUNT' },
    { Value: TAX_AMOUNT,       Label: 'TAX AMOUNT' },
    { Value: LIFECYCLE_STATUS, Label: 'LIFECYCLE STATUS' },
    { Value: OVERALL_STATUS,   Label: 'OVERALL STATUS' }
  ]

  @UI.FieldGroup #Main: {
    Data: [
      { Value: PO_ID,        Label: 'PURCHASE ORDER ID' },
      { Value: PARTNER_GUID.NODE_KEY, Label: 'PARTNER GUID' },
      { Value: GROSS_AMOUNT, Label: 'GROSS AMOUNT' },
      { Value: NET_AMOUNT,   Label: 'NET AMOUNT' }
    ]
  }

  @UI.Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Purchase Order',
      Target : '@UI.Identification'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Status & Amounts',
      Target : '@UI.FieldGroup#Main'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Purchase Order Items',
      Target : 'Items/@UI.LineItem'
    }
  ]

  entity PurchaseOrder as projection on db.transaction.purchaseorder {
    key NODE_KEY,
    PO_ID,
    PARTNER_GUID,
    CURRENCY,
    GROSS_AMOUNT,
    NET_AMOUNT,
    TAX_AMOUNT,
    LIFECYCLE_STATUS,
    OVERALL_STATUS,
    Items
  };


  @UI.HeaderInfo: {
    TypeName       : 'Purchase Order Item',
    TypeNamePlural : 'Purchase Order Items',
    Title          : { Value: PO_ITEM_POS },
 
  }

  @UI.SelectionFields: [
    PO_ITEM_POS,
    PRODUCT_GUID,
    code,
    GROSS_AMOUNT
  ]

  @UI.LineItem: [
    { Value: PO_ITEM_POS,  Label: 'PURCHASE ORDER ITEM' },
    { Value: PRODUCT_GUID.NODE_KEY, Label: 'PRODUCT GUID' },
    { Value: CURRENCY_code,     Label: 'CURRENCY' },
    { Value: GROSS_AMOUNT, Label: 'GROSS AMOUNT' },
    { Value: NET_AMOUNT,   Label: 'NET AMOUNT' },
    { Value: TAX_AMOUNT,   Label: 'TAX AMOUNT' }
  ]

  @UI.Identification: [
    { Value: PO_ITEM_POS,  Label: 'PURCHASE ORDER ITEM' },
    { Value: PRODUCT_GUID.NODE_KEY, Label: 'PRODUCT GUID' },
    { Value:CURRENCY_code,     Label: 'CURRENCY' },
    { Value: GROSS_AMOUNT, Label: 'GROSS AMOUNT' },
    { Value: NET_AMOUNT,   Label: 'NET AMOUNT' },
    { Value: TAX_AMOUNT,   Label: 'TAX AMOUNT' }
  ]

  @UI.Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Purchase Order Item',
      Target : '@UI.Identification'
    }
  ]

  entity PurchaseOrderItems as projection on db.transaction.poitems {
    key NODE_KEY,
    PARENT_KEY,
    PO_ITEM_POS,
    PRODUCT_GUID,
    CURRENCY,
    GROSS_AMOUNT,
    NET_AMOUNT,
    TAX_AMOUNT
  };

}
