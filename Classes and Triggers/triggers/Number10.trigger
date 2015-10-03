trigger Number10 on Account (before delete, before insert, before update) {
 
   
    List<Opportunity> opptysClosedLost = [select id, name, closedate, stagename
            from Opportunity where  
            accountId IN :Trigger.newMap.keySet() and StageName='Closed - Lost'];
    
    List<Opportunity> opptysClosedWon = [select id, name, closedate, stagename
            from Opportunity where  
            accountId IN :Trigger.newMap.keySet() and StageName='Closed - Won'];
    
    for(Account a : Trigger.new){
    	
    	
        for(Opportunity o: opptysClosedLost){	
    		if(o.accountid == a.id)
    		   System.debug('Do more logic here...');
        }
        
        
        for(Opportunity o: opptysClosedWon){	
    		if(o.accountid == a.id)
    		   System.debug('Do more logic here...');
        }
    }
}