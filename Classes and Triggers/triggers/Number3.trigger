trigger Number3 on Account (before insert, before update) {
   Account acct = Trigger.new[0];
   List<Contact> contacts = [select id, salutation, firstname, lastname, email 
              from Contact where accountId =: acct.Id];
   
}