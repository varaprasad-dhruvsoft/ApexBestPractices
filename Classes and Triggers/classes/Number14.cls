public class Number14 {
	
    @future
    public static void updateContacts(Set<Id> accountIdSet){
        List<Contact> contactUpdateList = new List<Contact>();
        
        for(Account a : [SELECT Id, BillingPostalCode, (Select Id, MailingPostalCode from contacts) FROM Account WHERE Id IN: accountIdSet]){
            for(Contact c: a.Contacts){
                c.MailingPostalCode = a.BillingPostalCode;
                contactUpdateList.add(c);
            }
        }
        
        update contactUpdateList;
    }
}