public class Number2 {

    public void updateLineItems(List<Line_Item__c > liList){
        List<Line_Item__c> updatedList = new List<Line_Item__c>();
        
        for(Line_Item__c li : liList) {
            if (li.Units_Sold__c > 10) {
                li.Description__c = 'New description';
                updatedList.add(li);
            }
        }
        
        update updatedList;
    }
}