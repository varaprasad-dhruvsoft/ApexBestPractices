trigger Number7 on Account (before insert, before update) {
	  
   //For loop to iterate through all the incoming Account records
   for(Account a: Trigger.new) {
      	  
      List<Contact> contacts = [select id, salutation, firstname, lastname, email 
                        from Contact where accountId = :a.Id];
 		  
      for(Contact c: contacts) {
         System.debug('Contact Id[' + c.Id + '], FirstName[' + c.firstname + '], LastName[' + c.lastname +']');
         c.Description=c.salutation + ' ' + c.firstName + ' ' + c.lastname; 
   	                  	      
         update c;
      }    	  
   }
}