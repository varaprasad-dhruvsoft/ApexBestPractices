public class Number1 {

    public void updateLineItems(List<Line_Item__c > liList){
        for(Line_Item__c li : liList) {
            if (li.Units_Sold__c > 10) {
                li.Description__c = 'New description';
            }
            update li;
        }
    }
}