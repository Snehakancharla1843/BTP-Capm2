sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"purchaseordernavigation/test/integration/pages/PurchaseOrderList",
	"purchaseordernavigation/test/integration/pages/PurchaseOrderObjectPage",
	"purchaseordernavigation/test/integration/pages/PurchaseOrderItemsObjectPage"
], function (JourneyRunner, PurchaseOrderList, PurchaseOrderObjectPage, PurchaseOrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('purchaseordernavigation') + '/test/flp.html#app-preview',
        pages: {
			onThePurchaseOrderList: PurchaseOrderList,
			onThePurchaseOrderObjectPage: PurchaseOrderObjectPage,
			onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

