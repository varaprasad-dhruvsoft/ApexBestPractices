trigger Number17 on Contact (before insert, before update) {
   
   Set<Id> accountIdSet = new Set<Id>();
   for(Contact ct: Trigger.new)
   	   accountIdSet.add(ct.AccountId);
   
   //Do SOQL Query	   
   Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT id, name, billingState FROM Account WHERE Id IN :accountIdSet]);
  
   for(Contact ct: Trigger.new){
       if(accountsMap.containsKey(ct.AccountId) && accountsMap.get(ct.AccountId).BillingState=='CA'){
   	   	   System.debug('found a contact related to an account in california...');
   	   	   ct.email = 'test_email@testing.com';
   	   	   //Apply more logic here....
   	   }
   } 
   
}