trigger Number11 on Account (before delete, before insert, before update) {
 
     //This code efficiently queries all related Closed Lost and
     //Closed Won opportunities in a single query.
    List<Account> accountWithOpptys = [select id, name, 
                                       (select id, name, closedate, stagename  
                                        from Opportunities  
                                        where StageName='Closed - Lost' or StageName = 'Closed - Won'
                                       ) 
                                       from Account 
                                       where Id IN :Trigger.newMap.keySet()];
    
    //Loop through Accounts only once
    for(Account a : accountWithOpptys){
    	
    	 //Loop through related Opportunities only once
    	 for(Opportunity o: a.Opportunities){
    	 	if(o.StageName == 'Closed - Won'){
    	 		System.debug('Opportunity Closed Won...do some more logic here...');
    	 	}else if(o.StageName =='Closed - Lost'){
    	 		System.debug('Opportunity Closed Lost...do some more logic here...');
    	 	}
    	 }
    
   }
}