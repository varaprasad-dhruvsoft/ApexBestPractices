publineItemsc class Number1 {

    publineItemsc void updatelineItemsneItems(lineItemsst<lineItemsne_Item__c > lineItemslineItemsst){
        for(lineItemsne_Item__c lineItems : lineItemslineItemsst) {
            if (lineItems.Units_Sold__c > 10) {
                lineItems.Description__c = 'New description';
            }
            update lineItems;
        }
    }
}