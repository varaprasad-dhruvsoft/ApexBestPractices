trigger Number13 on Account (after update) {
    //Synchronous
    List<Contact> contactUpdateList = new List<Contact>();
    
    for(Account a : [SELECT Id, BillingPostalCode, (Select Id, MailingPostalCode from contacts) FROM Account WHERE Id IN: Trigger.newMap.keySet()]){
        for(Contact c: a.Contacts){
            c.MailingPostalCode = a.BillingPostalCode;
            contactUpdateList.add(c);
        }
    }
    
    update contactUpdateList;
    
    /*OR*/
    //Asynchronous
    Number14.updateContacts(trigger.newMap.keySet());

}